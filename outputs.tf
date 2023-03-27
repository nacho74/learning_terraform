output "Hello" {
  value = "Hello Team!!"
}

# List availability domains
data "oci_identity_availability_domains" "my_availability_domains" {
  compartment_id = var.compartment_ocid
}

output "my_avs" {
  value = data.oci_identity_availability_domains.my_availability_domains.availability_domains[*].name
}

# List shapes (filtered)
data "oci_core_shapes" "my_shapes" {
    compartment_id = var.compartment_ocid
    filter {
      name = "name"
      values = [ "VM.Standard.B1.1" ]
    }  
}

output "my_sh" {
  value = data.oci_core_shapes.my_shapes.shapes[*].name
}