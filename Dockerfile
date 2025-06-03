FROM node:18-bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  ffmpeg \
  python3 \
  python3-pip \
  curl \
  gnupg \
  ca-certificates && \
  pip3 install gTTS

# Install n8n
RUN npm install -g n8n

# Buat folder untuk n8n dan atur kepemilikan
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Gunakan user 'node' yang sudah ada
USER node

ENV N8N_USER_FOLDER=/home/node/.n8n
ENV N8N_PORT=5678
ENV N8N_PORT=8080
ENV PORT=8080
EXPOSE 8080

COPY assets/background.mp4 /home/node/background.mp4

CMD ["n8n"]
