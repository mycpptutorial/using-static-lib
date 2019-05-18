cmake_minimum_required(VERSION 2.8.12)
project(DatetimeUtilSharedLib)

set(HEADER_SEARCH_PATH "./include")


include_directories(${HEADER_SEARCH_PATH})

set(LIB_NAME "libdatetimeutil.a")

if(UNIX)
    if(APPLE)
      link_directories("./libs/macos/")
    else()
      link_directories("./libs/unix/")
    endif()
elseif(WIN32)
  message(FATAL_ERROR "-- Unsupported platform sorry! :( ")
else()
  message(FATAL_ERROR "-- Unsupported platform sorry! :( ")
endif()

add_executable(main main.cpp)
target_link_libraries(main ${LIB_NAME})
