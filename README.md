# Grafana Dashboard Terraform Module

## Overview
This Terraform module allows users to create Grafana dashboards dynamically by specifying a folder and a directory containing JSON files. It also enables easy configuration of the Grafana provider details.

Additionally, a Docker Compose setup is provided to run Prometheus and Grafana along with monitoring components like Windows Node Exporter and cAdvisor.
This Terraform module allows users to create Grafana dashboards dynamically by specifying a folder and a directory containing JSON files. It also enables easy configuration of the Grafana provider details.

## Features
- Fetches an existing Grafana folder and deploys dashboards inside it.
- Reads JSON files from a specified directory and creates dashboards.
- Allows configurable Grafana URL and authentication.

## Requirements
- Terraform v1.0+
- Grafana provider for Terraform
- A valid Grafana instance with API access

## Usage

### cAdvisor Setup
cAdvisor (Container Advisor) is used to collect, process, and export resource usage and performance metrics for running containers. It integrates with Prometheus to provide real-time insights into CPU, memory, network, and disk usage for multiple containers on a host machine.

By default, cAdvisor runs on port `8080` and automatically detects all running containers using Docker's API.

### Docker Compose Setup
The repository includes a `docker-compose.yml` file to set up Prometheus, Grafana, Windows Node Exporter, and cAdvisor for monitoring system and container metrics.


### Windows Node Exporter Setup
Windows Node Exporter is installed manually using the Prometheus Windows Node Exporter MSI file. You can download it from the official Prometheus website:

[Prometheus Windows Node Exporter](https://prometheus.io/download/)

By default, Windows Node Exporter runs on port `9182`.

### Prometheus Configuration
A `prometheus.yml` file is provided in the repository to define scrape jobs for collecting metrics from Prometheus, Windows Node Exporter, and cAdvisor.


### Terraform Module Configuration
```hcl
module "grafana_dashboard" {
  source = "git::https://github.com/sumitrana12/prometheus-grafana-terraform.git//Grafana_Dashboard?ref=main"
  folder_title   = "Windows"
  dashboard_path = "./dashboards"
  grafana_url    = "http://localhost:3000/"
  grafana_auth   = "your_grafana_api_token"
}
```

### Variables
| Name            | Type   | Description                                      |
|----------------|--------|--------------------------------------------------|
| folder_title   | string | Title of the Grafana folder.                    |
| dashboard_path | string | Path to the directory containing JSON dashboards.|
| grafana_url    | string | URL of the Grafana instance.                     |
| grafana_auth   | string | Authentication token for Grafana. (Sensitive)    |

### Outputs
| Name           | Description                           |
|---------------|----------------------------------|
| dashboard_ids | List of created Grafana dashboard IDs. |

## Notes
- Ensure the JSON files are correctly formatted Grafana dashboard configurations.
- The authentication token must have the necessary permissions to create dashboards.

## License
This module is open-source and can be modified as needed.

## Contributors
Feel free to contribute to improving this module!

## Author
**Sumit Rana**  
- [GitHub](https://github.com/sumitrana12)  
- [LinkedIn](https://www.linkedin.com/in/sumitrana1/)
Feel free to contribute to improving this module!
