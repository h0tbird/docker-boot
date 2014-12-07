#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM h0tbird/base
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Get the puppet modules and apply the manifest:
#------------------------------------------------------------------------------

ADD puppet /etc/puppet

RUN cd /etc/puppet/environments/production && \
    r10k puppetfile install && \
    FACTER_docker_build=true \
    FACTER_fqdn=boot00.demo.lan \
    puppet apply /etc/puppet/environments/production/manifests/site.pp

#------------------------------------------------------------------------------
# Expose ports and set systemd as default process:
#------------------------------------------------------------------------------

CMD ["/usr/sbin/init"]
