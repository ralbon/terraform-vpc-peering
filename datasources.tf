data "google_compute_network" "network_a" {
  count = length(var.VPC_PEERS)
  name = var.VPC_PEERS[count.index].vpc_name_a
  project = var.VPC_PEERS[count.index].project_id_a
}

data "google_compute_network" "network_b" {
  count = length(var.VPC_PEERS)
  name = var.VPC_PEERS[count.index].vpc_name_b
  project = var.VPC_PEERS[count.index].project_id_b
}