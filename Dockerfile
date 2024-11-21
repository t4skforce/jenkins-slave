FROM jenkins/agent

ARG BUILD_DATE="2024-11-21T21:53:06Z"

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
