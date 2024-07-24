terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///session?socket=/Users/emiloszmanbegovity/.cache/libvirt/libvirt-sock"
}

resource "libvirt_domain" "terraform_test" {
    name = "terraform_test"
    memory = 512
    vcpu   = 1
    type   = "hvf"

    # Specify the path to the QEMU emulator
    emulator = "/opt/homebrew/bin/qemu-system-aarch64"

    # Specify the machine type suitable for your architecture
    machine = "virt"

    # Console configuration
    console {
      type = "pty"
      target_port = "0"
      target_type = "serial"
    }

    # Disk configuration
    disk {
      volume_id = libvirt_volume.terraform_test.id
    }

    # Network configuration
    network_interface {
      # network_name = "default"
    }
}

resource "libvirt_volume" "terraform_test" {
  name = "terraform_test.img"
  pool = "default"
  format = "qcow2"
  size = 10240 # Size in megabytes
}

