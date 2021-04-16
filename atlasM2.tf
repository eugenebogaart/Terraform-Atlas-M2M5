provider "mongodbatlas" {
  # variable are provided via ENV
  # public_key = ""
  # private_key  = ""
  version = "~>0.8.2"
}

# Need a project
resource "mongodbatlas_project" "proj1" {
  name   = local.project_id
  org_id = var.atlas_org_id
}

resource "mongodbatlas_cluster" "this" {
  name                  = "exampleM5"
  project_id            = mongodbatlas_project.proj1.id
  # For M2 and M5 shapes, the version attribute is fixed.  
  # At the moment it is 4.4 
  # This changes when new major version(s) become available.
  # mongo_db_major_version      = "4.4"

  # The provider name should be "TENANT"  instead  if AWS, GCP or AZURE
  # for shared instances.
  provider_name               = "TENANT"

  # Additionally a new attribute for the backing provider should be set
  # to the cloud provider: AWS, GCP or AZURE
  backing_provider_name       = "AWS"   
  provider_region_name        = "EU_WEST_1"
  provider_instance_size_name = "M5"
  
  # Cannot set disk related attributes with M2/M5 version, 
  # Required to set to false for M2/M5, (??)
  auto_scaling_disk_gb_enabled  = false
  # provider_backup_enabled     = false
}
