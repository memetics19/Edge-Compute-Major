variable "api_key" {
  description = "vultr API key"
  sensitive = true
}
  
variable "region"{
     type = list(string)

}