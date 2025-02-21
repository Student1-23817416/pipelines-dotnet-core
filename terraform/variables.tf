variable "name" {
  description = "Name of the CosmosDB Account."
  default     = "my-cosmos-db"
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
  default = "my-cosmos-rgp"
}

variable "location" {
  description = "The Azure Region in which to create resource."
  default = "australiaeast"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "databases" {
  description = "List of databases"
  type = map(object({
    throughput     = number
    max_throughput = number
    collections = list(object({
      name           = string
      shard_key      = string
      throughput     = number
      max_throughput = number
    }))
  }))
  default = {}
}

variable "diagnostics" {
  description = "Diagnostic settings for those resources that support it. See README.md for details on configuration."
  type = object({
    destination   = string
    eventhub_name = string
    logs          = list(string)
    metrics       = list(string)
  })
  default = null
}

variable "ip_range_filter" {
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  type        = list(string)
  default     = []
}

variable "capabilities" {
  description = "Configures the capabilities to enable for this Cosmos DB account. Check README.md for valid values."
  type        = list(string)
  default     = null
}