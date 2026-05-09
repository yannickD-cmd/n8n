FROM n8nio/n8n:latest

USER root

RUN npm install -g mammoth docx countries-and-timezones

RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm init -y && \
    npm install @respond-io/n8n-nodes-respond-io --no-fund --no-audit && \
    chown -R node:node /home/node/.n8n

RUN echo '{"task-runners":[{"runner-type":"javascript","env-overrides":{"NODE_FUNCTION_ALLOW_BUILTIN":"*","NODE_FUNCTION_ALLOW_EXTERNAL":"*"}}]}' > /etc/n8n-task-runners.json

USER node
