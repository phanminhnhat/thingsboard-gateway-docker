# Thingsboard Gateway docker image [![](https://images.microbadger.com/badges/version/gmatheu/thingsboard-gateway.svg)](https://microbadger.com/images/gmatheu/thingsboard-gateway "Get your own version badge on microbadger.com")

# Build docker image
- Run "sudo ./docker-build.sh"

# Deploy container

- Option 1: sudo ./docker-run.sh
- Option 2: sudo docker run -d -v ~/.mytb-gateway-data:/etc/tb-gateway/conf -v ~/.mytb-gateway-logs:/var/log/tb-gateway/ --name tb-gateway-instance tb-gate-way
- Option 3: Edit acccess token inside docker-compose.yml then run "docker-compose up"

# Build and push docker image
- make push
- Note: If there are new thingsboard build need to update the new link of deb file inside the dockerfile
