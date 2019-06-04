# Thingsboard Gateway docker image [![](https://images.microbadger.com/badges/version/gmatheu/thingsboard-gateway.svg)](https://microbadger.com/images/gmatheu/thingsboard-gateway "Get your own version badge on microbadger.com")

# Build docker image
- Run "sudo ./docker-build.sh"

# Deploy docker
- Edit acccess token inside docker-compose.yml
- sudo ./docker-run.sh

#Build and push docker image
- make push
- Note: If there are new thingsboard build need to update the new link of deb file inside the dockerfile
