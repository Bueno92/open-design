FROM node:20-alpine

WORKDIR /app
COPY . .

RUN corepack enable
RUN pnpm install

ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000

CMD ["pnpm", "tools-dev", "run", "web"]
