# TShock Docker Environment

This is a simple Docker environment to run containerized instance of TShock.

## What is TShock?

TShock is a powerful dedicated Terraria server software. Please visit [official TShock repository](https://github.com/Pryaxis/TShock) for more details about TShock. There also you could find some documentation and guides.

## Why?

I wanted to create my own simple Docker environment for TShock. Make as simple as possible. I think that some people may found it's cool boilerplate for their own TShock environments so I created it. Also I have completed Terraria for Summoner class on this environment so it's fully working (for now).

## Installation

To run this environment you will need to install Docker if you have not. After that you will need to clone this repository and move into it:

```bash
git clone https://github.com/nukdokplex/tshock-docker-environment && cd tshock-docker-environment
```

After that you'll need to copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

… and edit it in your favorite text editor:

```bash
nano .env
```

There will be comments how to set it up.

### Placing your world

Okay after that all let's place your Terraria world into environment.

```bash
mkdir -p ./tshock_data/world && cp /path/to/your/world.wld ./tshock_data/world/.
```
Don't forget to set your world file name in `.env`

## Running

Just run that command:

```bash
docker-compose up -d
```

… and your TShock instance will start! Now you'll need to localize your running TShock container using command:

```bash
docker ps
```

You will see something like that:

```
CONTAINER ID   IMAGE                               COMMAND                  CREATED             STATUS             PORTS                                         NAMES
12341234123   your-terraria-server-tshock   "bash run.sh"            About an hour ago   Up 4 seconds       0.0.0.0:7777->25565/tcp, :::7777->25565/tcp   your-terraria-server-tshock
```

As you can see here container is running after name `your-terraria-server-tshock`. Now you can attach to terminal of this container to get access to TShock server terminal:

```bash
docker attach your-terraria-server-tshock
```

And here you can user TShock's terminal, now you can type here `/help` to see available commands.

## Special thanks

Thanks to [beardedio](https://github.com/beardedio) for his [docker images](https://github.com/beardedio/terraria) that inspired me to create this environment.
