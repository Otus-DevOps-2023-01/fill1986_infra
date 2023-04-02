variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
description = "Subnets for modules"
}

variable db_disk_image {
  description = "Disk image for db app"
  default = "fd8jrok1psa1ru2eg6d3"
}
