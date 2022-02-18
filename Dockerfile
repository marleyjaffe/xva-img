FROM ubuntu:20.04
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y \
	g++ \
	libssl-dev \
	libxxhash-dev \
	git \
	cmake

RUN git clone https://github.com/eriklax/xva-img.git

RUN cd xva-img && cmake . && make && make install
