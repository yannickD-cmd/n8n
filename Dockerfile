FROM n8nio/n8n:latest

USER root

RUN npm install -g mammoth docx countries-and-timezones

RUN cd /usr/local/lib/node_modules/n8n && \
    npm install @respond-io/n8n-nodes-respond-io --no-fund --no-audit

RUN echo '{"task-runners":[{"runner-type":"javascript","env-overrides":{"NODE_FUNCTION_ALLOW_BUILTIN":"*","NODE_FUNCTION_ALLOW_EXTERNAL":"*"}}]}' > /etc/n8n-task-runners.json

USER node
