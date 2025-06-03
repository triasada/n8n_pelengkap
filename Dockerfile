FROM node:18-bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  ffmpeg \
  python3 \
  python3-pip \
  curl \
  gnupg \
  ca-certificates \
  sudo && \
  pip3 install gTTS

# Install n8n
RUN npm install -g n8n

# Set up user (as used by n8n)
RUN useradd -m -s /bin/bash node && \
  mkdir /home/node/.n8n && \
  chown -R node:node /home/node

USER node

ENV N8N_USER_FOLDER=/home/node/.n8n
ENV N8N_PORT=5678
EXPOSE 5678

CMD ["n8n"]
