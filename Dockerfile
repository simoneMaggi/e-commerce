FROM ubuntu

# INSTALL HUGO
RUN apt-get update
RUN apt-get install -y curl git
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_extended_0.91.2_Linux-64bit.deb -o hugo.deb
RUN apt install -y ./hugo.deb
RUN rm hugo.deb

# START A NEW WEBSITE
# WORKDIR /home/app
# RUN hugo new site website
# COPY  ./themes/vex-hugo /home/app/themes/vex-hugo

# da sostituire con un copy o al limite mettere i volume, cosi i cambiamenti da fuori li vedo nel sito
# RUN cd website
# RUN git init
# RUN git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke

EXPOSE 1313

WORKDIR /home/app/website
# RUN echo "theme = '{HUGO_THEME}'" >> config.toml

# https://gohugo.io/hosting-and-deployment/deployment-with-rsync/
# CMD ["hugo", "server", "-b", "https://e359-151-31-230-23.eu.ngrok.io", "--bind", "0.0.0.0", "--appendPort=false", "--liveReloadPort=443", "--disableFastRender"]
CMD [ "hugo", "server", "--bind",  "0.0.0.0", "-D"] 
# CMD ["/bin/bash"]