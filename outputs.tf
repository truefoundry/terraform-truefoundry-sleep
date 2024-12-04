output "id" {
  description = "ID of the sleep resource that can be used as an explicit dependency"
  value       = time_sleep.wait.id
}

output "triggers" {
  description = "Map of trigger values that were provided"
  value       = time_sleep.wait.triggers
} 
