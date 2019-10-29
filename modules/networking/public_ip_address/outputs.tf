output "result" {
  description = "The generated public ip address name."
  value       = regex("^[a-zA-Z0-9]{1}[a-zA-Z0-9-_.]*$", module.public_ip_address.result)
}