package provider

import (
	"github.com/cosmos/cosmos-sdk/codec"
	"github.com/forbole/bdjuno/v2/database"
	providersource "github.com/forbole/bdjuno/v2/modules/provider/source"
	"github.com/forbole/juno/v2/modules"
)

var (
	_ modules.Module = &Module{}
	// _ modules.PeriodicOperationsModule = &Module{}
	// _ modules.GenesisModule            = &Module{}
	// _ modules.BlockModule              = &Module{}
	// _ modules.MessageModule            = &Module{}
)

// Module represents the x/provider module
type Module struct {
	cdc    codec.Marshaler
	db     *database.Db
	source providersource.Source
}

// NewModule returns a new Module instance
func NewModule(
	source providersource.Source, cdc codec.Marshaler, db *database.Db,
) *Module {
	return &Module{
		cdc:    cdc,
		db:     db,
		source: source,
	}
}

// Name implements modules.Module
func (m *Module) Name() string {
	return "provider"
}
