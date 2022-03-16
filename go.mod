module github.com/forbole/bdjuno/v2

go 1.16

require (
	github.com/Baseledger/baseledger v0.0.0-00010101000000-000000000000
	github.com/cosmos/cosmos-sdk v0.44.5
	github.com/cosmos/gaia/v6 v6.0.0-rc1
	github.com/cosmos/ibc-go v1.2.3 // indirect
	github.com/forbole/juno/v2 v2.0.0-20220223115732-dbb226a91ce9
	github.com/go-co-op/gocron v1.11.0
	github.com/gogo/protobuf v1.3.3
	github.com/hashicorp/golang-lru v0.5.5-0.20210104140557-80c98217689d // indirect
	github.com/jmoiron/sqlx v1.2.1-0.20200324155115-ee514944af4b
	github.com/lib/pq v1.10.4
	github.com/pelletier/go-toml v1.9.4
	github.com/proullon/ramsql v0.0.0-20181213202341-817cee58a244
	github.com/rs/zerolog v1.26.1
	github.com/spf13/cobra v1.3.0
	github.com/stretchr/testify v1.7.0
	github.com/tendermint/tendermint v0.34.14
	google.golang.org/grpc v1.44.0
	gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b
)

replace github.com/tendermint/tendermint => github.com/forbole/tendermint v0.34.13-0.20210820072129-a2a4af55563d

replace github.com/cosmos/cosmos-sdk => github.com/desmos-labs/cosmos-sdk v0.43.0-alpha1.0.20211102084520-683147efd235

replace github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76

replace github.com/cosmos/ledger-cosmos-go => github.com/desmos-labs/ledger-desmos-go v0.11.2-0.20210814121638-5d87e392e8a9

replace (
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1
	github.com/keybase/go-keychain => github.com/99designs/go-keychain v0.0.0-20191008050251-8e49817e8af4
	google.golang.org/grpc => google.golang.org/grpc v1.33.2
)

// this is done in cosmos-sdk go.mod as well, with comment:
// Fix upstream GHSA-h395-qcrw-5vmq vulnerability.
// TODO Remove it: https://github.com/cosmos/cosmos-sdk/issues/10409
replace github.com/gin-gonic/gin => github.com/gin-gonic/gin v1.7.0

// next 2 replacements fix lower priority alerts
replace github.com/opencontainers/runc => github.com/opencontainers/runc v1.0.3

replace github.com/opencontainers/image-spec => github.com/opencontainers/image-spec v1.0.2

replace github.com/Baseledger/baseledger => ../../github/baseledger-plateau/baseledger
