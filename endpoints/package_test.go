package endpoints

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/briandowns/hashknife/hashknife-api/config"
	"github.com/stretchr/testify/suite"
)

// PackageServiceTestSuite
type PackageServiceTestSuite struct {
	suite.Suite
	conf     *config.Config
	endpoint PackageServicer
}

// SetupSuite runs code needed for the test suite
func (p *PackageServiceTestSuite) SetupSuite() {
	p.conf = &config.Config{}
	p.endpoint = NewPackageService(p.conf)
}

// TestFrontendTestSuite
func TestFPackageServiceTestSuite(t *testing.T) {
	suite.Run(t, &PackageServiceTestSuite{})
}

// TestFrontend_Success
func (p *PackageServiceTestSuite) TestFrontend_Success() {
	server := httptest.NewServer(f.endpoint)
	defer server.Close()
	resp, err := http.Get(server.URL)
	f.Require().NoError(err)
	f.Require().Equal(resp.StatusCode, http.StatusOK)
}
