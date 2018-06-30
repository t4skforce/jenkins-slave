FROM jenkinsci/slave

USER root

RUN apt-get update -qqy \
	&& apt-get -qqy --no-install-recommends install openssl ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

USER jenkins
