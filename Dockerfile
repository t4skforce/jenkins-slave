FROM jenkinsci/slave

USER root

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install sudo build-essential openssl libssl-dev ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && chown -R ${user}:${group} /home/${user}

USER jenkins
