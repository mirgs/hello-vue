FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
RUN npm install @vue/cli
ENTRYPOINT [ "yarn", "run", "build" ]

FROM ngnix
COPY --from=nodebuild /build/dist/ /usr/share/nginx/html/
