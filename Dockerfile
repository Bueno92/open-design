FROM ghcr.io/nodejs/node:20-bookworm

WORKDIR /app
COPY . .

RUN corepack enable
RUN pnpm install

ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000

CMD ["pnpm", "tools-dev", "run", "web"]
