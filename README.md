# xnohbdyx/minecraft-bedrock-server

Deploy Minecraft Bedrock Dedicated Server in a docker container.

## Usage:
```
docker create --name=Minecraft \
-v <path to config>:/bedrock-server/config \
-v <path to worlds>:/bedrock-server/worlds \
-e PID=<gid> -e PID=<uid> \
-e VERSION=<version>
-p 19132:8080 -p 19133:19133 \
xnohbdyx/minecraft-bedrock-server
```

## Volumes:

**/bedrock-server/config** contains: `server.properties`, `whitelist.json`, `permissions.json`

**/bedrock-server/worlds** contains: worlds/levels

## Ports:

- IPv4: 19132 UDP
- IPv6: 19133 UDP

## Environment Variables (optional)

`VERSION` - The version number you want to install
- e.g. `-e VERSION=1.7.0.13`  
- assumes the base url is still `https://minecraft.azureedge.net/bin-linux/bedrock-server-<VERSION>.zip`

`URL` - The full download URL to the version you want to install
- e.g. `-e URL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.7.0.13.zip`
- use this if the download URL changes or you want to download from a different source

`UID` & `GID` - The UID & GID of the user that owns the host data volume directories
- Docker doesn't always play nicely with data volumes, and sometimes permissions issues happen between the host and container. If that happens, set these to the same UID & GID of the user that owns the directories on the host.

## Useful Links
[Official Bedrock Server Download Page](https://minecraft.net/en-us/download/server/bedrock/)

[u/ProfessorValko's Bedrock Dedicated Server Tutorial on Reddit](https://www.reddit.com/user/ProfessorValko/comments/9f438p/bedrock_dedicated_server_tutorial/)

Also, see the `bedrock_server_how_to.html` page included with the official server download for more documentation.
