FROM n8nio/n8n:latest

USER root

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node

WORKDIR /home/node

EXPOSE 10000

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT:-10000}/healthz || exit 1

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n"]