FROM quay.io/keycloak/keycloak:latest

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HTTP_PORT=10000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]