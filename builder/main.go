package main

import (
	"github.com/gopherjs/gopherjs/js"
	hcl "github.com/hashicorp/hcl/v2"

	"github.com/hashicorp/hcl/v2/hclsyntax"
)

func parse(bytes []byte) (map[string]interface{}, error) {
	file, diags := hclsyntax.ParseConfig(bytes, "", hcl.Pos{Line: 1, Column: 1})
	if diags.HasErrors() {
		return nil, diags
	}
	return convertFile(file)
}

func main() {
	js.Module.Get("exports").Set("parse", parse)
}
