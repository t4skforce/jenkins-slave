FROM jenkinsci/slave

ENV UID 1000
ENV GID 1000

USER root

WORKDIR /tmp/
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install sudo build-essential openssl libssl-dev ca-certificates \
  && apt-get -qqy --no-install-recommends install git subversion jq curl wget \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && groupmod -g ${GID} jenkins \
  && usermod -u ${UID} -g ${GID} jenkins \
  && chown -R jenkins:jenkins /home/jenkins
WORKDIR /home/jenkins
USER jenkins
