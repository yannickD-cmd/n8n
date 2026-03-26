FROM n8nio/n8n:latest

USER root

RUN npm install -g mammoth docx

RUN echo '{"task-runners":[{"runner-type":"javascript","env-overrides":{"NODE_FUNCTION_ALLOW_BUILTIN":"*","NODE_FUNCTION_ALLOW_EXTERNAL":"*"}}]}' > /etc/n8n-task-runners.json

USER node
