if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "No in-source builds.")
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")
message("ROOT: " ${CMAKE_SYSROOT})
cmake_minimum_required (VERSION 3.0.2)

set(PROJECT_NAME example)

project(${PROJECT_NAME})

add_compile_options(-std=c++20 -O3 -Wall -Wno-deprecated-declarations -Wno-psabi -Wno-class-memaccess -fvisibility=hidden  )
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_GLIBCXX_USE_CXX11_ABI=1" CACHE INTERNAL "" FORCE) 

link_directories(${CMAKE_SYSROOT}/usr/lib)
set(PROJECT_LINK_LIBS ntcore wpiutil)

include_directories(${CMAKE_SYSROOT}/usr/include)
include_directories(${CMAKE_SYSROOT}/usr/include/ntcore)
include_directories(${CMAKE_SYSROOT}/usr/include/wpiutil)

file(GLOB SOURCES "src/*.cpp")

set(GLOBS ${SOURCES})

add_executable (${PROJECT_NAME} ${GLOBS})
target_link_libraries(${PROJECT_NAME} ${PROJECT_LINK_LIBS})

install(TARGETS ${PROJECT_NAME} DESTINATION /usr/local/bin/example)