FROM node:18.16.0-alpine AS base
ENV NODE_ENV=development

#RUN apk add curl && curl -fsSL "https://github.com/pnpm/pnpm/releases/download/v7.27.1/pnpm-linuxstatic-x64" -o /bin/pnpm; chmod +x /bin/pnpm;
RUN apk update && apk add --no-cache libc6-compat
RUN corepack enable && corepack prepare pnpm@7.4.1 --activate 

USER root
WORKDIR /usr/node

RUN mkdir base && chown -R node:node ./base

WORKDIR /usr/node/base
COPY --chown=node:node package.json pnpm-lock.yaml ./

USER node
# RUN npm install --force

COPY --chown=node:node packages/ui/components ./packages/ui/components
COPY --chown=node:node packages/config/eslint ./packages/config/eslint

# RUN npm install --force

FROM base AS dev

USER root
WORKDIR /usr/node
RUN mkdir app && chown -R node:node ./app

USER node
WORKDIR /usr/node/app
COPY --from=base --chown=node:node /usr/node/base ./

WORKDIR /usr/node/app/packages/ui/components

EXPOSE 6006
CMD [ "pnpm", "--filter", "@monorepo-ui/components", "run", "storybook" ]