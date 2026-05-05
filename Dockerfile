FROM node:20-alpine

WORKDIR /app

# Install pnpm
RUN corepack enable

COPY . .

RUN pnpm install
RUN pnpm --filter web build

EXPOSE 3000

CMD ["pnpm", "--filter", "web", "exec", "next", "start", "-p", "3000", "-H", "0.0.0.0"]
