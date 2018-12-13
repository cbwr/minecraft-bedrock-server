FROM ubuntu:latest

RUN addgroup -g 1000 minecraft && \
    adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft && \
    mkdir -m 777 /bedrock-server /bedrock-server/config /bedrock-server/worlds /home/minecraft && \
    chown minecraft:minecraft /bedrock-server /bedrock-server/config /bedrock-server/worlds /home/minecraft && \
    apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0 gosu && \
    curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.0.24.zip --output bedrock-server.zip && \
    unzip bedrock-server.zip -d bedrock-server && \
    rm bedrock-server.zip && \
    mv /bedrock-server/server.properties /bedrock-server/whitelist.json bedrock-server/permissions.json /bedrock-server/config && \
    ln -s /bedrock-server/config/server.properties /bedrock-server/server.properties && \
    ln -s /bedrock-server/config/whitelist.json /bedrock-server/whitelist.json && \
    ln -s /bedrock-server/config/permissions.json /bedrock-server/permissions.json

EXPOSE 19132/udp 19133/udp
VOLUME /bedrock-server/worlds /bedrock-server/config
WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ./bedrock_server
