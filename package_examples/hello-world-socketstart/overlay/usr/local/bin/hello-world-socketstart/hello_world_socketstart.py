#!/usr/bin/env python3

import http.server
import socketserver
import socket
import signal
import sys
import os
import json
from datetime import datetime

class ServiceHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        
        response = {
            "service": os.path.basename(os.path.dirname(__file__)),
            "status": "running",
            "socket_activated": True,
            "pid": os.getpid(),
            "timestamp": datetime.now().isoformat()
        }
        
        self.wfile.write(json.dumps(response, indent=2).encode())

class SocketActivatedService:
    def __init__(self):
        self.httpd = None
        
    def get_systemd_socket(self):
        """Get socket from systemd socket activation"""
        listen_pid = os.environ.get('LISTEN_PID')
        listen_fds = os.environ.get('LISTEN_FDS')
        
        if not listen_pid or not listen_fds:
            raise RuntimeError("Not started by systemd socket activation")
        
        if int(listen_pid) != os.getpid():
            raise RuntimeError(f"PID mismatch: expected {listen_pid}, got {os.getpid()}")
        
        if int(listen_fds) < 1:
            raise RuntimeError(f"No sockets provided: LISTEN_FDS={listen_fds}")
        
        # (FD 3 is first socket)
        sock = socket.fromfd(3, socket.AF_INET, socket.SOCK_STREAM)
        return sock
        
    def start(self):
        # Get the socket from systemd
        server_socket = self.get_systemd_socket()
        
        # Create HTTP server without binding
        self.httpd = socketserver.TCPServer(('', 0), ServiceHandler, bind_and_activate=False)
        self.httpd.socket = server_socket
        
        print(f"Service started (PID: {os.getpid()})")
        self.httpd.serve_forever()
    
    def stop(self):
        if self.httpd:
            self.httpd.shutdown()
            self.httpd.server_close()

def signal_handler(signum, frame):
    if hasattr(signal_handler, 'service'):
        signal_handler.service.stop()
    sys.exit(0)

def main():
    # Validate socket activation environment
    if not os.environ.get('LISTEN_PID') or not os.environ.get('LISTEN_FDS'):
        print("ERROR: Must be started by systemd socket activation")
        sys.exit(1)
    
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    
    service = SocketActivatedService()
    signal_handler.service = service
    service.start()

if __name__ == "__main__":
    main()