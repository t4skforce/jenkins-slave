FROM jenkinsci/slave

ARG BUILD_DATE="2021-10-07T20:54:11Z"

USER root

WORKDIR /tmp/
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install sudo build-essential openssl libssl-dev ca-certificates \
  && apt-get -qqy --no-install-recommends install git subversion jq curl wget \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && chown -R jenkins:jenkins /home/jenkins
WORKDIR /home/jenkins
USER jenkins
