# test 3
#   - show connection to OCI
#   - get AVs from tenancy

# How to get it:
#   - click on the profile icon on the upper-right corner of OCI console
#   - select the tenancy name. On the next screen you should be able to copy the tenancy’s OCID
variable "tenancy_ocid" { }

# How to get it:
#   - click on the profile icon on the upper-right corner of OCI console 
#   - click your user name. On the next screen you should be able to copy the user’s OCID.
variable "user_ocid" {}

# How to get it:
#  NOTE: You need to have an API key already created. 
#  - click on the profile icon on the upper-right corner of OCI console 
#  - click your user name and scroll down to “API Keys” section
#  - copy the fingerprint associated to the API key
variable "fingerprint" {}

# How to get it:
#   This is the path to the local dir where you have the private key
variable "private_key_path" {}

# How to get it:
#  -  in order to get the region id, click on the region name on the upper-right corner of the cloud console
#  -  go to “Manage Regions”
#  -  on the next screen you should be able to copy the region id for your region
variable "region" {}

# How to get it:
#   - Go to the compartment in question (Identity & Security > Compartments)
#   - Copy the OCID
variable "compartment_ocid" {}

# Define provider
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}


