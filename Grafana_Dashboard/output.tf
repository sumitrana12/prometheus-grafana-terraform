output "dashboard_ids" {
  description = "List of Grafana dashboard IDs."
  value       = [for d in grafana_dashboard.main : d.id]
}