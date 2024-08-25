FROM node:21.7.3 as web-builder
WORKDIR /ai4e-ems-webui
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm \
    && pnpm install
COPY . .
RUN pnpm build \
    && pnpm cache clean --force

FROM nginx:alpine as prod
WORKDIR /ai4e-ems-webui
COPY --from=web-builder /ai4e-ems-webui/dist .
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
