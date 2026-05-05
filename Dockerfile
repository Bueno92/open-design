FROM node:local

WORKDIR /app

RUN corepack enable

# 👉 copier uniquement les fichiers nécessaires au lock
COPY package.json pnpm-lock.yaml ./
COPY apps ./apps
COPY packages ./packages

# install propre
RUN pnpm install --frozen-lockfile

# build uniquement le web
RUN pnpm --filter web build

EXPOSE 3000

# 👉 IMPORTANT : lancer dans le bon package
WORKDIR /app/apps/web

CMD ["pnpm", "start"]
