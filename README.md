# Truefoundry Terraform Sleep Module

This Terraform module provides a way to add delays/sleep during resource creation or destruction. This can be useful in scenarios where you need to wait for eventual consistency or when you need to introduce delays between resource provisioning.

## Features

- Configurable sleep duration for resource creation
- Configurable sleep duration for resource destruction
- Support for triggers to force new sleep durations

## Usage

```hcl
module "sleep" {
  source = "path/to/module"

  create_duration  = "30s"    # Sleep for 30 seconds during creation
  destroy_duration = "10s"    # Sleep for 10 seconds during destruction
  triggers = {
    # Changes to these values will trigger a new sleep duration
    version = "1.0.0"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| time | ~> 0.9.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create_duration | Duration to sleep during create operation. Examples: '30s', '5m', '1h' | `string` | `"30s"` | no |
| destroy_duration | Duration to sleep during destroy operation. Examples: '30s', '5m', '1h' | `string` | `"0s"` | no |
| triggers | Arbitrary map of values that, when changed, will trigger a new sleep duration | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the sleep resource that can be used as an explicit dependency |
| triggers | Map of trigger values that were provided |

## Examples

### Basic Usage

```hcl
module "sleep" {
  source = "path/to/module"
  
  create_duration = "1m"
}
```

### With Triggers

```hcl
module "sleep" {
  source = "path/to/module"
  
  create_duration = "30s"
  triggers = {
    deployment_id = "v1.2.3"
    environment  = "production"
  }
}
```

### As a Dependency

```hcl
module "sleep" {
  source = "path/to/module"
  
  create_duration = "2m"
}

resource "aws_instance" "example" {
  # ... instance configuration ...
  
  depends_on = [module.sleep]
}
```

## License

MIT Licensed. See LICENSE for full details.
