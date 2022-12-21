## Prerequisites

- Linux or wsl
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
