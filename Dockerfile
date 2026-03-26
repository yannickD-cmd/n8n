FROM n8nio/n8n:latest

USER root

RUN npm install -g mammoth docx

# Update task runner config to allow mammoth and docx
RUN cat /etc/n8n-task-runners.json | \
    sed 's/"NODE_FUNCTION_ALLOW_BUILTIN": "[^"]*"/"NODE_FUNCTION_ALLOW_BUILTIN": "*"/' | \
    sed 's/"NODE_FUNCTION_ALLOW_EXTERNAL": "[^"]*"/"NODE_FUNCTION_ALLOW_EXTERNAL": "*"/' \
    > /tmp/runners.json && mv /tmp/runners.json /etc/n8n-task-runners.json

USER node
