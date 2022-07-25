# factorio-docker

This repository contains the files necessary to build and deploy Factorio as a docker container.
Since there are a number of Factorio containers already made out there, I want to take a slightly different approach, not necessarily because mine is better, but as a learning exercise.

The main features I will be trying to implement here are:
- Opinionated, but configurable: require little to no configuration to run a server
- Automated server deployment to AWS using Terraform (possibly also GCP, Azure, and local K8s as options, since I want to learn Terraform)
- Compressed server files for a slimmer docker container (Possibly switch compression from .xz to .gz for higher speed - will lose some compression, but should keep image under 100MB)
- Offer a built-in utility for generating map previews with the container
- Offer batch previews (with randomized seeds) for browsing starting areas
- Container build script that can automatically scrape/choose Factorio versions from Wube's download page

Secondary features, to keep parity with other container offerings:
- rcon
- mod support
- save file backups
- First-class documentation for using `docker-compose`
- Support all available Factorio releases from Wube's download page
