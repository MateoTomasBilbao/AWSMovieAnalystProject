FROM node:alpine3.15
COPY . .
ENV BACKEND_URL=${BACKEND_URL}
ENV FRONTEND_PORT=8000

RUN npm install
CMD ["npm","start"]
