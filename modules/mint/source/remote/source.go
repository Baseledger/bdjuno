package remote

import (
	minttypes "github.com/osmosis-labs/osmosis/x/mint/types"
	"github.com/forbole/juno/v2/node/remote"

	mintsource "github.com/forbole/bdjuno/v2/modules/mint/source"
)

var (
	_ mintsource.Source = &Source{}
)

// Source implements mintsource.Source using a remote node
type Source struct {
	*remote.Source
	querier minttypes.QueryClient
}

// NewSource returns a new Source instance
func NewSource(source *remote.Source, querier minttypes.QueryClient) *Source {
	return &Source{
		Source:  source,
		querier: querier,
	}
}


// Params implements mintsource.Source
func (s Source) Params(height int64) (minttypes.Params, error) {
	res, err := s.querier.Params(s.Ctx, &minttypes.QueryParamsRequest{}, remote.GetHeightRequestHeader(height))
	if err != nil {
		return minttypes.Params{}, nil
	}

	return res.Params, nil
}
