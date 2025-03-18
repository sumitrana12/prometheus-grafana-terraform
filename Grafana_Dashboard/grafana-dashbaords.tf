data "grafana_folder" "main" {
  title = var.folder_title
}

resource "grafana_dashboard" "main" {
  for_each    = fileset(var.dashboard_path, "*.json")
  config_json = file("${var.dashboard_path}/${each.key}")
  folder      = data.grafana_folder.main.id
}

