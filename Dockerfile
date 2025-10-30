# Usar imagen oficial completa de n8n
FROM n8nio/n8n:latest

# Cambiar a usuario root para configuración
USER root

# Crear directorio de trabajo si no existe
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV EXECUTIONS_DATA_SAVE_ON_ERROR=all
ENV EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
ENV EXECUTIONS_DATA_SAVE_MANUAL_EXECUTIONS=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Volver a usuario node
USER node

# Exponer puerto
EXPOSE 5678

# Workaround: usar tini + n8n directamente
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD []