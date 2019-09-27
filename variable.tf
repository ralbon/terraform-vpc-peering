variable "PROJECT_ID" {
  description = "The ID of the hub project"
  type        = string
}

variable "REGION" {
  description = "The region in which you want to create the VPN gateway"
  type        = string
  default     = "europe-west1"
}

variable "VPC_PEERS" {
  description = "List of vpc object to be peered"  
  type = list(object({
    vpc_name_a                  = string
    project_id_a                = string
    vpc_name_b                  = string
    project_id_b                = string
    is_transitive_to_on_premise = bool 
  }))
}