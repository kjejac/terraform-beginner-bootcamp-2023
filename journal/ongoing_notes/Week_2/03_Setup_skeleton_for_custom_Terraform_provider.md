# Custom Terraform Provider

Should ideally be in a separate repo.

Terraform Registry expects providers/modules to be written in a particular way. Use hyphens, not underscores if publishing to the Registry.

# Go
(Go is already installed on Gitpod so no need to install anything!)

Need a `main.go` file.

We are cramming everything into a single file - normally this would go into several files.

## Hello world
To check that Go works
```go
package main

import "fmt"

func main() {
	// format.PrintLine
	fmt.Println("Hello, world!")
}
```

To run the file
```sh
go run main.go
```

[Writing Custom Terraform Providers](https://www.hashicorp.com/blog/writing-custom-terraform-providers)

### Dir&Files created in this module
`[Dir] terraform-provider-terratowns`
`[File] terraform-provider-terratowns\main.go`
`[File] terraformrc`
`[File] bin\build_provider`
`[File] terraform-provider-terratowns\go.mod`
`[File] terraform-provider-terratowns\go.sum` # auto created, contains required plugins that was imported


[Terraform Local Providers and Registry Mirror Configuration](https://servian.dev/terraform-local-providers-and-registry-mirror-configuration-b963117dfffa)

**DO NOT commit binaries!** Edit the `.gitignore`