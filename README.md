# Baseledger

BDJuno needs a reference to baseledger package. Currently it is not published, so this is targeting local package (check go.mod).
If we go with that, we need to clone plateau on node running explorer.

To run this it is same as docs, steps:

1. make sure db is set (check big dipper repo)
2. cd bdjuno `make install`
3. init bdjuno config `bdjuno init` it will be in `~/.bdjuno/config.yaml`

This is how it looks like modified for our needs:

```
chain:
    bech32_prefix: baseledger
    modules: 
        - modules
        - messages
        - auth
        - bank
        - staking
node:
    type: remote
    config:
        rpc:
            client_name: juno
            address: http://localhost:26657
            max_connections: 20
        grpc:
            address: http://localhost:9090
            insecure: true
parsing:
    workers: 1
    listen_new_blocks: true
    parse_old_blocks: true
    parse_genesis: true
    start_height: 1
    fast_sync: true
database:
    name: bigdipper
    host: localhost
    port: 5432
    user: user
    password: password
    schema: public
    max_open_connections: 10
    max_idle_connections: 10
logging:
    level: debug
    format: text
telemetry:
    port: 5000
pruning:
    keep_recent: 100
    keep_every: 500
    interval: 10

```

4. `bdjuno parse-genesis`

5. `bdjuno parse` as service:

```
$ sudo tee /etc/systemd/system/bdjuno.service > /dev/null <<EOF
[Unit]
Description=BDJuno parser
After=network-online.target

[Service]
User=$USER
ExecStart=$GOPATH/bin/bdjuno parse
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

$ sudo systemctl enable bdjuno
$ sudo systemctl start bdjuno

```

6. run hasura
docker-compose in big dipper should run, but also hasura-cli needs to be installed:

`curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash`

7. `hasura metadata apply --endpoint <your-endpoint> --admin-secret <hasura_password>`

admin secret is configured in docker-compose, endpoint is localhost:8080, or configured in docker-compose

8. `bdjuno hasura-actions` as service

```
$ sudo tee /etc/systemd/system/hasura-actions.service > /dev/null <<EOF
[Unit]
Description=BDJuno Hasura Actions
After=network-online.target

[Service]
User=$USER
ExecStart=$GOPATH/bin/bdjuno hasura-actions
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

```
   

# BDJuno
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/forbole/bdjuno/Tests)](https://github.com/forbole/bdjuno/actions?query=workflow%3ATests)
[![Go Report Card](https://goreportcard.com/badge/github.com/forbole/bdjuno)](https://goreportcard.com/report/github.com/forbole/bdjuno)
![Codecov branch](https://img.shields.io/codecov/c/github/forbole/bdjuno/cosmos/v0.40.x)

BDJuno (shorthand for BigDipper Juno) is the [Juno](https://github.com/forbole/juno) implementation
for [BigDipper](https://github.com/forbole/big-dipper).

It extends the custom Juno behavior by adding different handlers and custom operations to make it easier for BigDipper
showing the data inside the UI.

All the chains' data that are queried from the RPC and gRPC endpoints are stored inside
a [PostgreSQL](https://www.postgresql.org/) database on top of which [GraphQL](https://graphql.org/) APIs can then be
created using [Hasura](https://hasura.io/).

## Usage
To know how to setup and run BDJuno, please refer to
the [docs website](https://docs.bigdipper.live/cosmos-based/parser/overview/).

## Testing
If you want to test the code, you can do so by running

```shell
$ make test-unit
```

**Note**: Requires [Docker](https://docker.com).

This will:
1. Create a Docker container running a PostgreSQL database.
2. Run all the tests using that database as support.


