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

# Building the container

The script `build-container.sh` will handle automatically building the Factorio docker container.  By default, running this script with no arguments will build a container for the latest version of Factorio offered by Wube.  The latest version is automatically fetched from the server download page.

This script uses `docopt.sh` to perform command-line argument parsing.  To run this script, install it with `pip3 install docopt.sh`.  A version of this script with a static parser will be provided at a later date.

This script also accepts a single argument: the factorio version.  Running `build-container.sh 1.1.51`, for example, will build a Factorio container for Factorio version `1.1.51`.

Since the docker build is split up into two stages, the download only needs to be performed once per version.  Multiple re-builds of a specific version of Factorio will not attempt to hug the Factorio servers to death, as long as the first build stage is not modified :)
