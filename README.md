## Prerequisites

- Docker
- Docker-compose

## Local development


```bash
# clone the repository
git clone git@github.com:simoneMaggi/e-commerce.git

# cd in the project directory
$ cd e-commerce/

# Build the images
$ docker-compose build

# Start local dev server
$ docker-compose up
```
The website will be accessible at http://localhost:1313/drunk/


To update after a change 

```bash

$ docker-compose restart
```

