# Thingsboard Gateway docker image [![](https://images.microbadger.com/badges/version/gmatheu/thingsboard-gateway.svg)](https://microbadger.com/images/gmatheu/thingsboard-gateway "Get your own version badge on microbadger.com")

# Build docker image
- Run "sudo ./docker-build.sh"
- Note: Edit the .deb link inside docker file if there are new builds of gateway

# Build and push docker image
- make push
- Note: 
  - If there are new thingsboard build need to update the new link of deb file inside the dockerfile
  - Need to change user if you want to push to your docker hub

# Deploy container
- Option 1 : sudo ./docker-run.sh
- Option 2 (Fresh data): sudo docker run -d -v ~/.mytb-gateway-data:/etc/tb-gateway/conf -v ~/.mytb-gateway-logs:/var/log/tb-gateway/ --name tb-gateway-instance pmnhat/thingsboard-gateway --entrypoint "/run-application.sh"
- Option 3 (Using config file from this source code): 
  - Edit acccess token inside docker-compose.yml
  - Run "docker-compose up".
