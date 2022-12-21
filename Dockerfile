
FROM ubuntu AS base
# INSTALL HUGO
RUN apt-get update
RUN apt-get install -y curl git
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_extended_0.91.2_Linux-64bit.deb -o hugo.deb
RUN apt install -y ./hugo.deb
RUN rm hugo.deb
WORKDIR /home/app/website


FROM base AS hugo-develop
EXPOSE 1313
CMD [ "hugo", "server", "--bind",  "0.0.0.0", "-D"]

FROM base AS hugo-deploy
CMD ["hugo"]

