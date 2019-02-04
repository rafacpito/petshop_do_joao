FROM ubuntu

MAINTAINER Rafael do Couto Pito "rafael.couto@traylabs.com.br"

RUN apt-get update && apt-get install -y nginx openssh-server git-core openssh-client curl nano build-essential openssl curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config sudo supervisor libpq-dev  libreadline-dev

RUN addgroup -gid 1000 docker && adduser docker -gid 1000 --uid 1000 --disabled-password --gecos ""
RUN sudo sh -c "echo 'docker ALL=NOPASSWD: ALL' >> /etc/sudoers"

RUN cd
RUN git clone https://github.com/sstephenson/rbenv.git /usr/share/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/share/.rbenv/plugins/ruby-build
RUN /usr/share/.rbenv/plugins/ruby-build/install.sh
ENV PATH=/usr/share/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

ENV TZ=America/Sao_Paulo
RUN mkdir /var/www/petshop && chown -Rf docker:docker /var/www
USER docker
ENV PATH=/usr/share/.rbenv/bin:/usr/share/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN rbenv install 2.4.0
RUN rbenv global 2.4.0
RUN sudo apt-get install libmysqlclient-dev -y
RUN sudo apt-get install nodejs -y
RUN sudo apt-get install imagemagick -y
RUN export RBENV_ROOT="${HOME}/.rbenv"
RUN export PATH="${RBENV_ROOT}/bin:${PATH}"
RUN sudo echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN /home/docker/.rbenv/shims/gem install bundle
WORKDIR /var/www/petshop
RUN sudo /usr/bin/supervisord