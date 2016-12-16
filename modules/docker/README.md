# Docker

Defines [Docker][1] aliases.

## Aliases

### Docker

  - `dk` is short for `docker`
  - `dka` Attach to a running container
  - `dkb` Build an image from a Dockerfile
  - `dkd` Inspect changes on a container's filesystem
  - `dke` Run a command in a running container
  - `dkE` Run an interactive command in a running container
  - `dkh` Show the history of an image
  - `dki` List images
  - `dkin` Return low-level information on a container, image or task
  - `dkk` Kill a running container
  - `dkl` Fetch the logs of a container
  - `dkli` Log in to a Docker registry
  - `dklo` Log out from a Docker registry
  - `dkn` Manage Docker networks
  - `dkp` Pause all processes within one or more containers<Paste>
  - `dkP` Unpause all processes within one or more containers
  - `dkps` List containers
  - `dkpsa` List all containers (default lists just running)
  - `dkr` Run a command in a new container
  - `dkR` Run an interactive command in a new container and automatically remove
  the container when it exits
  - `dkRe` like `dkR` and set entry point to `/bin/bash`
  - `dkrm` Remove one or more containers
  - `dkrmi` Remove one or more images
  - `dkrmC` Clean up exited containers
  - `dkrmI` Clean up dangling images
  - `dkrmV` Clean up unused volumes ( Docker >= 1.9 )
  - `dks` Start one or more stopped containers
  - `dkS` Restart a container
  - `dkss` Display a live stream of container(s) resource usage statistics
  - `dksw` Manage Docker Swarm
  - `dkt` Tag an image into a repository
  - `dktop` Display the running processes of a container
  - `dkup` Update configuration of one or more containers
  - `dkv` Manage Docker volumes
  - `dkV` Show the Docker version information
  - `dkw` Block until a container stops, then print its exit code<Paste>
  - `dkx` Stop a running container

### Docker Machine

  - `dkm` is short for `docker-machine`
  - `dkma` Get or set the active machine
  - `dkmcp` Copy files between machines
  - `dkme` Set up the environment for the Docker client
        (eg: `dkme staging` to toggle to staging)
  - `dkmin` Inspect information about a machine
  - `dkmip` Get the IP address of a machine
  - `dkmk` Kill a machine
  - `dkmls` List machines
  - `dkmpr` Re-provision existing machines
  - `dkmps` alias for `dkmls`
  - `dkmrg` Regenerate TLS Certificates for a machine
  - `dkmrm` Remove a machine
  - `dkms` Start a machine
  - `dkmsh` Log into or run a command on a machine with SSH
  - `dkmst` Get the status of a machine
  - `dkmS` Restart a machine
  - `dkmu` Get the URL of a machine
  - `dkmup` Upgrade a machine to the latest version of Docker
  - `dkmV` Show the Docker Machine version or a machine docker version
  - `dkmx` Stop a machine

### Docker Compose

  - `dkc` is short for `docker-compose`
  - `dkcb` Build or rebuild services
  - `dkcd` Stop and remove containers, networks, images, and volumes
  - `dkce` Execute a command in a running container
  - `dkck` Kill containers
  - `dkcl` View output from containers
  - `dkcp` Pause services
  - `dkcP` Unpause services
  - `dkcps` List containers
  - `dkcr` Run a one-off command
  - `dkcrm` Remove stopped containers
  - `dkcs` Start services
  - `dkcsc` Set number of containers for a service
  - `dkcS` Restart services
  - `dkcu` Create and start containers
  - `dkcU` Create and start containers in detached mode:
        Run containers in the background, print new container names
  - `dkcV` Show the Docker-Compose version information
  - `dkcx` Stop services

## Author

*The author of this module should be contacted via the [issue tracker][2].*

  - [François Vantomme](https://github.com/akarzim)

[1]: https://www.docker.com/
[2]: https://github.com/akarzim/prezto/issues
