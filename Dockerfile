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
RUN appcenter test run uitest --uitest-tools-dir "./tools" --app "Tom_Bruyneel/Q8-Smiles" --devices "Tom_Bruyneel/huawei" --app-path "./qeight_1.0.28-internal-uat.apk"  --test-series "master" --locale "en_US" --build-dir "./Q8.UITest/bin/Debug" --include-category UITest --token fd16e08889f32baa020decffbeb3b747a3c500bf
