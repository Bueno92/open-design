FROM node:local

WORKDIR /app

RUN npm install -g pnpm

COPY . .

RUN pnpm install --frozen-lockfile
RUN pnpm --filter web build

EXPOSE 3000

WORKDIR /app/apps/web

CMD ["pnpm", "exec", "next", "start", "-p", "3000", "-H", "0.0.0.0"]
