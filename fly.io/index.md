## Install fly.io cli
curl -L https://fly.io/install.sh | sh

**Update zshrc**

```
export FLYCTL_INSTALL="/home/jordi/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
```
source ~/.zshrc

## Upload project to fly.io

Run in project folder root.

It seems using local environment setup, so set local node version to a right version.

```
flyctl auth login
flyctl launch
```

## Config fly.toml config env variables

```
[env]
  MongoDB_URI='mongodb://127.0.0.1:27017/db'
  PORT='3000'

```

## Deploy

```
fly deploy
```
