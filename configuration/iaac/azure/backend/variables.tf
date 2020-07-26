variable client_id {}
variable client_secret {}
variable subscription_id {}
variable tenant_id {}
variable ssh_public_key {}

variable resource_group {
  #default = "k8s_state_storage_resource_group"
  default = "terraform-backend-rg"
}

variable storage_account {
    default = "storageacctlaymui"
}

variable environment {
    default = "dev"
}

variable location {
    default = "southeastasia"
}
