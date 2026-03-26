FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip3 install --break-system-packages mammoth python-docx
RUN npm install -g mammoth

USER node
