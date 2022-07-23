# factorio-docker

This repository contains the files necessary to build and deploy Factorio as a docker container.
Since there are a number of Factorio containers already made out there, I want to take a slightly different approach.

The main features I will be trying to implement here are:
- First-class documentation for using `docker-compose`
- Opinionated, but configurable: require little to no configuration to run a server
- Automated server deployment to AWS using Terraform
- Compressed server files for a slimmer docker container (Possibly switch compression from .xz to .gz for higher speed - will lose some compression, but should keep image under 100MB)

Secondary features, to keep parity with other container offerings:
- rcon
- mod support
- save file backups
