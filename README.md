# Setup MonogoDB Atlast cluster M2 and/or M5

Provisioning a shared cluster of size M2 and/or M5 with Terraform.
This process is slightly different then M10 and up.
See below sample 

```
resource "mongodbatlas_cluster" "this" {

    ....

    # The provider name should be "TENANT"  
    # instead  if AWS, GCP or AZURE for shared instances.
    provider_name               = "TENANT"

    # Additionally a new attribute for the backing provider should be set
    # to the cloud provider: AWS, GCP or AZURE
    backing_provider_name       = "AWS"   
    provider_region_name        = "<YOUR REGION>"
    provider_instance_size_name = "M5"

    ...
}
```