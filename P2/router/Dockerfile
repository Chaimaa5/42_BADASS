FROM frrouting/frr:latest as routeur_oouazahr
RUN apk update && apk add vim openrc iproute2
RUN touch /etc/frr/vtysh.conf
RUN sed -i 's/^bgpd=no/bgpd=yes/' /etc/frr/daemons
RUN sed -i 's/^ospfd=no/ospfd=yes/' /etc/frr/daemons
RUN sed -i 's/^isisd=no/isisd=yes/' /etc/frr/daemons
RUN rc-update add frr default
