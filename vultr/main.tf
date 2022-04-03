terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.9.1"
    }
  }
}


provider "vultr" {
  api_key = var.api_key
}

resource "vultr_ssh_key" "my_ssh_key" {
  name = "ide"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC85HkCz6BkQloWC/YUkAXM9xCa2lmsGHKqHYcdgtUyk05WKYGVJNrbQESAInm0JyI0H/S8jQAlfkp+NNfuJ7BOQW+eLlzW4iQRSddkibyszm/XzuyPQeWElI6eLMniizlQ1nGx1UZGb5ta15ug8GzvJSxLXjC3nm6sYAvwZjr/2DLjDl2cZiKXn5sLe6Q/63H1zJVrUCByKOCjEDwMPdxmsUxa8EIxgk9fswBRnwBVefuI6fCavkAGL7M7s0God0wK8vQmhFQ6GKmsivqx0Xcw+nma2p4j6Hv9KZV7Xe0Zf6h1ak5areGukDyCQfqo6nBUxHiE7khP3+7mkkZvHVKbQVcZDHQ9mtePE3sw2ekd1i1t/9VjeZ/G7mhXBzIIVHT0FJ+7AESdQjE+QU7PdGH73VtT/Pz/4rHCLkd4v8P3qgl7lDCp192u8z1q5f6skwhtboKIfkKojveNfh9y2rnQncKQvcebnX4cNYfELg8MI+UPlV/ql+grf4V9/Njtufk= shreedabhat@Shreedas-MacBook-Air.local"
}

resource "vultr_instance" "my_instance" {
    plan = "vc2-1c-2gb"
    count = length(var.region)
    region = var.region[count.index]
    os_id = "270"
    user_data = "${file("k3s.sh")}"
    ssh_key_ids=[vultr_ssh_key.my_ssh_key.id]
    reserved_ip_id = "6c680e13-b5f8-4980-901d-cf810944fe54"
}