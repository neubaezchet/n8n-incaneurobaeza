FROM n8nio/n8n:latest

USER root

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node

WORKDIR /home/node

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5678/healthz || exit 1

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]