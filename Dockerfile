FROM node:18-alpine

# Instalar dependencias del sistema
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    openssh-client \
    ca-certificates \
    curl

# Instalar n8n globalmente
RUN npm install -g n8n

# Crear directorio de trabajo
WORKDIR /home/node

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV EXECUTIONS_DATA_SAVE_ON_ERROR=all
ENV EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
ENV EXECUTIONS_DATA_SAVE_MANUAL_EXECUTIONS=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Exponer puerto
EXPOSE 5678

# Comando de inicio
CMD ["n8n"]