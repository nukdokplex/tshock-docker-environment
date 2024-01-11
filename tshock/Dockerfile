FROM mcr.microsoft.com/dotnet/runtime:6.0

ARG UID
ARG GID
ARG RELEASE_URL

RUN groupadd -g $GID -o tshock
RUN useradd -m -u $UID -g $GID -o -s /bin/bash tshock

RUN apt-get update && \
    apt-get install -y curl nuget vim zip --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER tshock

# fix for favorites.json error
RUN favorites_path="/home/tshock/My Games/Terraria" && \
    mkdir -p "$favorites_path" && \
    echo "{}" > "$favorites_path/favorites.json"

RUN mkdir /home/tshock/tshock && \
    cd /tmp && \
    curl -sL $RELEASE_URL --output tshock_release.zip && \
    unzip tshock_release.zip -d /tmp/tshock && \
    cd /tmp/tshock && \
    mkdir ./untar && tar -xf *.tar -C ./untar && \
    cd $(find . -type f -name TShock.Server -printf '%h\n') && \
    mv ./* /home/tshock/tshock && \
    rm -R /tmp/tshock

COPY  ./run-tshock.sh /home/tshock/tshock/run.sh

WORKDIR /home/tshock/tshock

ENTRYPOINT ["bash", "run.sh"]
