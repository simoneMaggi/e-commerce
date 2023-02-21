# Website for a friend

A simple static website based on [vex-hugo]( https://github.com/themefisher/vex-hugo ) template for Hugo framework. Deployed for free in digitalocean [here]( https://steven-drunk-ah69z.ondigitalocean.app/ )
This contanerized version makes things even more simple.



## Prerequisites

- Docker
- Docker-compose

## Local development


```bash
# clone the repository
git clone git@github.com:simoneMaggi/e-commerce.git

# cd in the project directory
$ cd e-commerce/

# Run the build script
$ ./stefano.sh --start

```
The website will be accessible at http://localhost:1313/drunk/


To update after a change 

```bash

$ ./stefano.sh --restart

```

To deploy the website with hugo

```bash

$ ./stefano.sh --deploy

```
The website will be available in the public folder.
