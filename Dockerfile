#------------------------------------------------------------------------------
# BUILD: docker build --rm -t h0tbird/dnsmasq .
# RUN:   docker run --privileged -d -P -v /sys/fs/cgroup:/sys/fs/cgroup:ro h0tbird/dnsmasq
#------------------------------------------------------------------------------

FROM h0tbird/base
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Get the isolated puppet modules and apply the manifest:
#------------------------------------------------------------------------------

ADD puppet /etc/puppet

RUN cd /etc/puppet/environments/production && \
    r10k puppetfile install && \
    FACTER_docker_build=true \
    puppet apply /etc/puppet/environments/production/manifests/site.pp

#------------------------------------------------------------------------------
# Require the /sys/fs/cgroup volume mounted and execute the init command:
#------------------------------------------------------------------------------

EXPOSE 22
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
