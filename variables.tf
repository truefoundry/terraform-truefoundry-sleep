variable "create_duration" {
  description = "Duration to sleep during create operation. Examples: '30s', '5m', '1h'"
  type        = string
  default     = "30s"
}

variable "destroy_duration" {
  description = "Duration to sleep during destroy operation. Examples: '30s', '5m', '1h'"
  type        = string
  default     = "0s"
}

variable "triggers" {
  description = "Arbitrary map of values that, when changed, will trigger a new sleep duration"
  type        = map(string)
  default     = {}
} 
