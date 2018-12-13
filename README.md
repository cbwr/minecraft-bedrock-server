# minecraft-bedrock-server

Deploys a minecraft bedrock server as a docker container. 

This dockerfile does all of the following things really well:
- Builds a ubuntu container.
- Creates a user and group for minecraft.
- Downloads the [minecraft bedrock server 1.8](https://minecraft.net/en-us/download/server/bedrock/).
- Mounts volumes for `worlds` and `config`. This keeps your world safe should the container be destroyed, allowing for easy updates.
- Allows configurable flags on execution.
- Runs on your Synology.
- Runs minecraft bedrock server.

It does not do the following thing(s), yet (maybe ever):
- Download the latest server updates

