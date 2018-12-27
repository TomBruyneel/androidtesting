FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install gnupg
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get -y install nodejs
RUN apt-get -y install android-sdk android-sdk-platform-23
RUN export ANDROID_HOME=/usr/lib/android-sdk
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get -y update
RUN apt-get -y install mono-devel
RUN npm install -g appcenter-cli
