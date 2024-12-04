terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.0"
    }
  }
}

resource "time_sleep" "wait" {
  create_duration  = var.create_duration
  destroy_duration = var.destroy_duration

  triggers = var.triggers
}
