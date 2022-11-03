package cmd

import (
	"fmt"
	"log"

	"github.com/spf13/cobra"

	"nekonomicon/service"
	"nekonomicon/service/do"
)

// instanceCmd represents the instance command
var instanceCmd = &cobra.Command{
	Use:   "instance",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("instance called")

		targetService, err := cmd.Flags().GetString("service")
		if err != nil {
			log.Fatal(err)
		}
		log.Println("Target service is", targetService)

		switch targetService {
		case service.AWS:
			log.Fatal("AWS is not implemented.")
		case service.DO:
			err := do.GetDroplets()
			if err != nil {
				log.Fatal(err)
			}
		case service.GCP:
			log.Fatal("GCP is not implemented.")
		default:
			log.Fatal("Unexpected variable.", targetService)
		}
	},
}

func init() {
	rootCmd.AddCommand(instanceCmd)
}
