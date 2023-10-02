// TEST HELLO WORLD
// Declares the package name.
// The main package is special in Go, it's where the execution of the program starts.
// package main

// Imports the `fmt` package, which contains functions for formated I/O
// import "fmt"

// `func main()` defines the `main` function, the entry point of the application. 
// When you run the program, it starts executing from this function
//func main() {
//	// format.PrintLine. Prints to the standard outputs.
//	fmt.Println("Hello, world!")
//}

package main

// Use {} when importing multiple items
import (
	//"log"
	//"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

func main() {
	// always start with a plugin
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
}

// See above, ProviderFunc
// In golang, a titlecase function will get exported.
func Provider() *schema.Provider {
	// Define a variable `p`
	var p *schema.Provider
	p = &schema.Provider {
		// Resources, datasources etc. it supports 
		ResourcesMap: map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		// Definition of fields use
		Schema: map[string]*schema.Schema{
			// see diagram main.tf file
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true, // make the token as sensitive to hide it in the logs
				Required: true,
				Description: "Bearer token for authorization",
			},
			"user_uuid": {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				//ValidateFunc: validateUUID
			},
		},
	}
	//p.ConfigureContextFunc = providerConfigure(p)
	return p
}

//func validateUUID(v interface{}, k string) (ws []string, errors []error) {
//	log.Print('validateUUID:start')
//	value := v.(string)
//	if _,err = uuid.Parse(value); err != nil {
//		errors = append(error, fmt.Errorf("invalid UUID format"))
//	}
//	log.Print('validateUUID:end')
//}