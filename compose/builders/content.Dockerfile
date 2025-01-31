ARG MONOREPO_VERSION=main
FROM greenpress/monorepo:${MONOREPO_VERSION} as base

FROM node:15.14-alpine
ENV NODE_ENV=production
ENV PORT=9001
EXPOSE $PORT
COPY --from=base /apps/content/greenpress-content.tgz .
RUN tar zxvf ./greenpress-content.tgz -C ./
WORKDIR /package
CMD npm start
