#!/usr/bin/env python3
import http.server
import socketserver
import threading
import signal
import sys
import os
import json
from datetime import datetime

class HelloWorldHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            
            script_dir = os.path.dirname(os.path.abspath(__file__))
            index_path = os.path.join(script_dir, 'index.html')
            
            try:
                with open(index_path, 'r', encoding='utf-8') as f:
                    html_content = f.read()
            except FileNotFoundError:
                html_content = '''
<!DOCTYPE html>
<html lang="en">
<p>error</p>
</body>
</html>
                '''
            
            self.wfile.write(html_content.encode())
            
        elif self.path == '/api/status':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            
            status_data = {
                "service": "hello-world-autostart",
                "status": "running",
                "timestamp": datetime.now().isoformat(),
            }
            
            self.wfile.write(json.dumps(status_data, indent=2).encode())
            
        else:
            self.send_response(404)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            
            script_dir = os.path.dirname(os.path.abspath(__file__))
            not_found_path = os.path.join(script_dir, '404.html')
            
            try:
                with open(not_found_path, 'r', encoding='utf-8') as f:
                    dark_404 = f.read()
            except FileNotFoundError:
                dark_404 = '''
<!DOCTYPE html>
<html lang="en">
<p>error</p>
</body>
</html>
                '''
            
            self.wfile.write(dark_404.encode())

    def log_message(self, format, *args):
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(f"[{timestamp}] {format % args}")

class HelloWorldServer:
    def __init__(self, port=9001):
        self.port = port
        self.httpd = None
        self.server_thread = None
        self.shutdown_event = threading.Event()
        
    def start(self):
        try:
            self.httpd = socketserver.TCPServer(("", self.port), HelloWorldHandler)
            # Allow socket reuse to prevent "Address already in use" errors
            self.httpd.allow_reuse_address = True
            
            self.server_thread = threading.Thread(target=self.httpd.serve_forever)
            self.server_thread.daemon = True
            self.server_thread.start()
            print(f"Hello World server started on port {self.port}")
            return True
        except Exception as e:
            print(f"Failed to start server: {e}")
            return False

    def stop(self):
        print("Stopping Hello World server...")
        self.shutdown_event.set()
        
        if self.httpd:
            self.httpd.shutdown()
            self.httpd.server_close()
            
        if self.server_thread and self.server_thread.is_alive():
            self.server_thread.join(timeout=2)
            
        print("Hello World server stopped")

# Global server instance for signal handler
server_instance = None

def signal_handler(signum, frame):
    print(f"\nReceived signal {signum}, stopping server...")
    if server_instance:
        server_instance.stop()
    sys.exit(0)

def main():
    global server_instance
    
    # Register signal handlers
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    
    server_instance = HelloWorldServer(9001)
    
    if server_instance.start():
        print("Hello World service is running. Managed by systemd.")
        try:
            server_instance.shutdown_event.wait()
        except KeyboardInterrupt:
            signal_handler(signal.SIGINT, None)
    else:
        print("Failed to start Hello World service")
        sys.exit(1)

if __name__ == "__main__":
    main()