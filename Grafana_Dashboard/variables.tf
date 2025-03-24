
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


variable "dashboard" {
  description = "Grafana dashboard with dynamically generated panels."
  type = object({
    title   = string
    version = number
    panels = list(object({
      title      = string
      type       = string
      datasource = string
      query      = string
      width      = optional(number, 12)
      height     = optional(number, 6)
      position   = optional(object({ x = number, y = number }), { x = 0, y = 0 })
    }))
  })
}
