# Use a specific version for reproducibility
FROM quay.io/keycloak/keycloak:24.0.4

# Set defaults (better to override these in Render ENV VARS)
# ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
# ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
# - KEYCLOAK_ADMIN=admin
#             - KEYCLOAK_ADMIN_PASSWORD=password
# Configure Keycloak runtime via ENV vars
#ENV KC_HTTP_PORT=10000
# Add other necessary ENV vars here or (preferably) in Render
# ENV KC_PROXY=edge # Needed if using 'start' command
# ENV KC_HOSTNAME_URL=https://your-app.onrender.com # Needed if using 'start' command
ENV KC_HTTP_PORT=10000

# Keep the ENTRYPOINT simple, let ENV vars configure Keycloak
# Use 'start-dev' for testing (HTTP, easier setup)
# Use 'start' for production (requires proxy/hostname vars)
EXPOSE 10000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
# Optional: Explicitly expose the port for documentation/clarity
# Note: EXPOSE doesn't *make* it listen, ENV KC_HTTP_PORT does.
# Render uses its own Port setting, not directly the EXPOSE instruction.
