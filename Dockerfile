FROM ruby:2.2
MAINTAINER Kazuki Hasegawa<hasegawa@khasegawa.net>
RUN mkdir /home/work
RUN useradd work -d /home/work
RUN chown -R work:work /home/work
USER work
WORKDIR /home/work
VOLUME ["/home/work"]
ENTRYPOINT ["ruby"]
