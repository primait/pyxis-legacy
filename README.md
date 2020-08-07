# Pyxis

This repo contains the code for the Pyxis design system's website.

## Setup

This repo currently depends on multiple *git submodules*.
To download the submodules, simply run `git submodule update --init`. This
command will fetch the submodules and put them in the `lib` folder.

To run the website locally, you'll need to install the following on your machine:
* `Node.js`
* the `yarn` package manager
* `docker`
* `docker-compose`

First of all you need to install the package's dependencies. Navigate to the root
folder of the repository and run `yarn install`.

To start the website in development mode, run `yarn serve`, this will start a
local http server and a compiler that will watch any file changes in the source
directory, and recompile the code on the fly.
You can reach the website at `http://localhost:3000/`.

To build the code for production, simply run `yarn build`, this command will
create a bundle in the `dist` folder.

The `yarn deploy:local`, will start a docker container that will automatically
build the code and host the website at the following address `http://localhost:10080/`.

To stop the docker container, run `docker-compose down`.
