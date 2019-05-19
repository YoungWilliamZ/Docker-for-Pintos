FROM ubuntu:16.04
LABEL maintainer=youngwilliam.zheng@gmail.com

ENV HOME /root
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install some useful apps
RUN apt-get update && \
		apt-get install -y sudo && \
		sudo apt-get install -y --no-install-recommends apt-utils && \
		apt-get install -y \
			wget \
			tar \
			make \
			patch \
			vim \
			git \
			gdb \
            --fix-missing build-essential xorg-dev bison libgtk2.0-dev \
            python-pip \
            psmisc \
		locales locales-all

# Install gdbgui https://gdbgui.com/
RUN pip install --upgrade gdbgui

WORKDIR ${HOME}

RUN wget https://downloads.sourceforge.net/project/bochs/bochs/2.6.7/bochs-2.6.7.tar.gz && tar -zxvf bochs-2.6.7.tar.gz
WORKDIR ${HOME}/bochs-2.6.7
RUN ./configure --with-nogui --enable-gdb-stub
RUN make
RUN make install

# Needed in project 2
RUN apt-get update && apt-get install -y qemu && \
	ln -s /usr/bin/qemu-system-i386 /usr/bin/qemu

ENV PATH $HOME/pintos/src/utils:$PATH

ENV GDBMACROS $HOME/pintos/src/misc/gdb-macros

WORKDIR $HOME/pintos/src/userprog

CMD ["sleep", "infinity"]
