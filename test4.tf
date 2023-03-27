provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "block_count" { default = 2 }

data "oci_identity_availability_domains" "my_availability_domains" {
    compartment_id = var.compartment_ocid
}

resource "oci_core_volume" "test_volume_ac" {
  for_each = tomap ( {"small" = "50", "medium" = "60", "large" = "70"} )
  availability_domain = data.oci_identity_availability_domains.my_availability_domains.availability_domains[0]["name"]
  compartment_id = var.compartment_ocid
  freeform_tags = {"department"= "accountability"}
  display_name = "my-accountability-volume-${each.value}"
  size_in_gbs = each.value
}

resource "oci_core_volume" "my_volume" {
  availability_domain = data.oci_identity_availability_domains.my_availability_domains.availability_domains[0]["name"]
  compartment_id = var.compartment_ocid
  freeform_tags = {"department"= "test"}
  display_name = "test-volume"
}