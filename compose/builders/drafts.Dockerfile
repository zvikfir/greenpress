ARG MONOREPO_VERSION=main
FROM greenpress/monorepo:${MONOREPO_VERSION} as base

FROM node:15.14-alpine
ENV NODE_ENV=production
ENV PORT=9005
EXPOSE $PORT
COPY --from=base /apps/drafts/greenpress-drafts.tgz .
RUN tar zxvf ./greenpress-drafts.tgz -C ./
WORKDIR /package
CMD npm start
