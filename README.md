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
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_duration"></a> [create\_duration](#input\_create\_duration) | Duration to sleep during create operation. Examples: '30s', '5m', '1h' | `string` | `"30s"` | no |
| <a name="input_destroy_duration"></a> [destroy\_duration](#input\_destroy\_duration) | Duration to sleep during destroy operation. Examples: '30s', '5m', '1h' | `string` | `"0s"` | no |
| <a name="input_triggers"></a> [triggers](#input\_triggers) | Arbitrary map of values that, when changed, will trigger a new sleep duration | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the sleep resource that can be used as an explicit dependency |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Map of trigger values that were provided |
<!-- END_TF_DOCS -->

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_duration"></a> [create\_duration](#input\_create\_duration) | Duration to sleep during create operation. Examples: '30s', '5m', '1h' | `string` | `"30s"` | no |
| <a name="input_destroy_duration"></a> [destroy\_duration](#input\_destroy\_duration) | Duration to sleep during destroy operation. Examples: '30s', '5m', '1h' | `string` | `"0s"` | no |
| <a name="input_triggers"></a> [triggers](#input\_triggers) | Arbitrary map of values that, when changed, will trigger a new sleep duration | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the sleep resource that can be used as an explicit dependency |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Map of trigger values that were provided |
<!-- END_TF_DOCS -->