FROM ubuntu

# INSTALL HUGO
RUN apt-get update
RUN apt-get install -y curl git
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_0.91.2_Linux-64bit.deb -o hugo.deb
RUN apt install -y ./hugo.deb
RUN rm hugo.deb

# START A NEW WEBSITE
WORKDIR /home/app
RUN hugo new site website

# da sostituire con un copy o al limite mettere i volume, cosi i cambiamenti da fuori li vedo nel sito
# RUN cd website
# RUN git init
# RUN git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
# RUN echo "theme = 'ananke'" >> config.toml

EXPOSE 1313

WORKDIR /home/app/website
CMD [ "hugo", "server", "--bind",  "0.0.0.0", "-D" ] 
#CMD ["/bin/bash"]