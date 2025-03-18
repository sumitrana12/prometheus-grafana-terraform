
variable "grafana_url" {
  description = "URL of the Grafana instance."
  type        = string
}

variable "grafana_auth" {
  description = "Authentication token for Grafana."
  type        = string
  sensitive   = true
}

variable "folder_title" {
  description = "Title of the Grafana folder."
  type        = string
}

variable "dashboard_path" {
  description = "Path to the directory containing JSON files for dashboards."
  type        = string
}