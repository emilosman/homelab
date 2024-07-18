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
    type   = "kvm"

    # Specify the path to the QEMU emulator
    emulator = "/opt/homebrew/bin/qemu-system-aarch64"

    # Specify the machine type suitable for your architecture
    machine = "virt"

}

