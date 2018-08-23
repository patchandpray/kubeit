# create new instance

resource "random_id" "server" {
  byte_length = 4
  prefix = "ubuntu-k8s-"
}

output "name" {
  value = ["${google_compute_instance.server.*.name}"]
}

output "public_ip" {
  value = ["${google_compute_instance.server.*.network_interface.0.access_config.0.nat_ip}"]
}
output "private_ip"{
  value = ["${google_compute_instance.server.*.network_interface.0.address}"]
}

output "api_url" {
  value = ["${google_compute_instance.server.*.self_link}"]
}

output "node_info" {
  value = ["${zipmap(
    google_compute_instance.server.*.name, google_compute_instance.server.*.network_interface.0.address
  )}"]
}

resource "google_compute_instance" "server" {
  name = "ubuntu-k8s-${count.index}"
  count = 2
  machine_type = "n1-standard-2"
  zone = "${var.zone}"
  boot_disk {
    initialize_params {
    image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
    address = ""
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

  metadata {
    enable-oslogin = "TRUE"
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}
