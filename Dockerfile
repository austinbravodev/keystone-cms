FROM node:18-slim AS base

RUN apt-get update -y && apt-get install -y openssl

USER node

WORKDIR /app

COPY --chown=node:node . .

ENV NODE_ENV production

RUN npm ci

# ARG DATABASE_PROVIDER

# ENV DATABASE_PROVIDER $DATABASE_PROVIDER

RUN npm run build -- --frozen

EXPOSE 3000

CMD npm run start