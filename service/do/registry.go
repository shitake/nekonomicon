package do

import (
	"context"
	"fmt"
	"os"

	"github.com/digitalocean/godo"
)

func GetRegistries() error {
	var token string = os.Getenv("DIGITALOCEAN_TOKEN")
	if token == "" {
		return fmt.Errorf("failed to find environment variable DIGITALOCEAN_TOKEN")
	}

	client := godo.NewFromToken(token)
	ctx := context.TODO()

	registries, _, _ := client.Registry.Get(ctx)
	fmt.Println("Registries: ", registries)

	registryName := registries.Name
	opt := &godo.TokenListOptions{}

	repositories, _, _ := client.Registry.ListRepositoriesV2(ctx, registryName, opt)
	for i, v := range repositories {
		fmt.Printf("Repository %d: %s\n", i, v.Name)
	}

	return nil
}
