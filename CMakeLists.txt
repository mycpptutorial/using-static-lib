cmake_minimum_required(VERSION 2.8.12)
project(DatetimeUtilSharedLib)

set(HEADER_SEARCH_PATH "./include")


include_directories(${HEADER_SEARCH_PATH})

link_directories("./libs/macos/")

add_executable(main main.cpp)
target_link_libraries(main libdatetimeutil.a)
