#------------------------------------------------------------------------------
# docker build --rm -t registry.demo.lan:5000/dnsmasq .
#------------------------------------------------------------------------------

FROM registry.demo.lan:5000/base
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Get the isolated puppet modules and apply the manifest:
#------------------------------------------------------------------------------

ADD puppet /etc/puppet

RUN cd /etc/puppet && \
    librarian-puppet install && \
    puppet apply manifests/site.pp
