grafana_url  = "http://localhost:3000/"
grafana_auth = "xxxxxxxxxxxxx"
folder_title = "Laptop"

dashboard = {
  title   = "Laptop-metrics"
  version = 2
  panels = [
    {
      title      = "Memory Usage"
      type       = "timeseries"
      datasource = "degs7duqsxou8a"
      query      = "(windows_memory_committed_bytes / windows_memory_commit_limit) * 100"
      width      = 12
      height     = 8
      position   = { x = 0, y = 0 }
    },
    {
      title      = "CPU Usage"
      type       = "timeseries"
      datasource = "degs7duqsxou8a"
      query      = "100 - (avg by (instance) (rate(windows_cpu_time_total{mode='idle'}[5m])) * 100)"
      width      = 12
      height     = 8
      position   = { x = 12, y = 0 }
    },
    {
      title      = "Disk Usage"
      type       = "timeseries"
      datasource = "degs7duqsxou8a"
      query      = "100 - (windows_logical_disk_free_bytes / windows_logical_disk_size_bytes * 100)"
      width      = 12
      height     = 7
      position   = { x = 0, y = 8 }
    },
    {
      title      = "Network Usage"
      type       = "timeseries"
      datasource = "degs7duqsxou8a"
      query      = "rate(windows_net_bytes_received_total[5m])"
      width      = 12
      height     = 7
      position   = { x = 12, y = 8 }
    }
  ]
}
