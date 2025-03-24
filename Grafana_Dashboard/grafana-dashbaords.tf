data "grafana_folder" "main" {
  title = var.folder_title
}

resource "grafana_dashboard" "dashboard" {
  folder = data.grafana_folder.main.id
  config_json = jsonencode({
    title   = var.dashboard.title
    panels = [for panel in var.dashboard.panels : {
      title      = panel.title
      type       = panel.type
      datasource = panel.datasource
      targets    = [{ expr = panel.query }]
      gridPos = {
        x = panel.position.x
        y = panel.position.y
        w = panel.width
        h = panel.height
      }
    }]
  })
}


