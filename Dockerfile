FROM ubuntu:18.10
RUN apt-get update
RUN apt-get -y install g++
RUN apt-get -y install cmake
RUN apt-get -y install git
WORKDIR /usr/src/mycpptutorial
RUN git clone https://github.com/mycpptutorial/datetimeutil-shared-lib.git
RUN cd datetimeutil-shared-lib && mkdir -p build && cd build && cmake .. && make
COPY . /usr/src/mycpptutorial/using-static-shared-lib
WORKDIR /usr/src/mycpptutorial/using-static-shared-lib
RUN rm -rf build
RUN mkdir -p /usr/src/mycpptutorial/using-static-shared-lib/libs/unix
RUN cp /usr/src/mycpptutorial/datetimeutil-shared-lib/build/libdatetimeutil.a /usr/src/mycpptutorial/using-static-shared-lib/libs/unix/libdatetimeutil.a
RUN mkdir -p build && cd build && cmake .. && make
ENTRYPOINT ["/usr/src/mycpptutorial/using-static-shared-lib/build/main"]
