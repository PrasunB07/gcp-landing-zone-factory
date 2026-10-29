locals {
  _base_dir    = path.module
  firewall_dir = "${local._base_dir}/${var.firewall_dir}/"
}