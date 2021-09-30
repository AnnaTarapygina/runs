variable "run_id" {
  default = "run_id_0"
  sensitive = true
}
 
variable "sleep_time" {
  default = 120
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = <<EOT
      sleep 20
    EOT
  }
  triggers = {
    always_run = timestamp()
  }
}


resource "random_integer" "timeout" {
  min = 31
  max = 180

  keepers = {
    run_id = var.run_id
  }
}





output "very_long" {
  value = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"  
}

output "senc_out" {
  value = "secret data"
  description = "my sensitive output"
  sensitive = true
}
