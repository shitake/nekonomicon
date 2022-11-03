package do

import (
	"context"
	"fmt"
	"os"

	"github.com/digitalocean/godo"
)

func GetDroplets() error {
	var token string = os.Getenv("DIGITALOCEAN_TOKEN")
	if token == "" {
		return fmt.Errorf("failed to find environment variable DIGITALOCEAN_TOKEN")
	}

	client := godo.NewFromToken(token)
	ctx := context.TODO()

	opt := &godo.ListOptions{
		Page:    1,
		PerPage: 200,
	}

	// droplets, _, err := client.Droplets.List(ctx, opt)
	droplets, _, _ := client.Droplets.List(ctx, opt)

	fmt.Println(droplets)

	return nil
}
