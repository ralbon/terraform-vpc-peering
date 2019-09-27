resource "google_compute_network_peering" "peering_vpc_a_to_vpc_b" {
  count = length(var.VPC_PEERS)
  name = format("%s-%s", data.google_compute_network.network_a[count.index].name, data.google_compute_network.network_b[count.index].name)
  network = data.google_compute_network.network_a[count.index].self_link
  peer_network = data.google_compute_network.network_b[count.index].self_link

  provider = "google-beta"
  export_custom_routes = (var.VPC_PEERS[count.index].is_transitive_to_on_premise ? true : false)
}

resource "google_compute_network_peering" "peering_vpc_b_to_vpc_a" {
  count = length(var.VPC_PEERS)
  name = format("%s-%s", data.google_compute_network.network_b[count.index].name, data.google_compute_network.network_a[count.index].name)
  network = data.google_compute_network.network_b[count.index].self_link
  peer_network = data.google_compute_network.network_a[count.index].self_link

  provider = "google-beta"
  import_custom_routes = (var.VPC_PEERS[count.index].is_transitive_to_on_premise ? true : false)
}
