variable "user_uuid" {
    description = "The UUID of the user"
    type = string
    validation {
        condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
        error_message = "The user_uuid value is not a valid UUID"
    }
}

#variable "bucket_name" {
#  description = "Name of the S3 bucket"
#  type        = string
#
#  validation {
#    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
#    error_message = "bucket_name must be between 3 and 63 characters long and can only contain lowercase letters, numbers, periods, and hyphens"
#  }
#}

variable "index_html_file_path" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_file_path)
    error_message = "The provided path is not a valid file path."
  }
}

variable "error_html_file_path" {
  description = "Path to the error.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_file_path)
    error_message = "The provided path is not a valid file path."
  }
}

variable "content_version" {
  description = "Version number for the content. Should be a positiv integer starting at 1."
  type        = number

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "Content version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}