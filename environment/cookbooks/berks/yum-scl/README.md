# yum-scl Cookbook

Configures softwarecollections yum repository

## Requirements

### Platforms

- Scientific Linux 6.0 or later
- CentoOS Linux 6.0 or later

### Chef

- Chef 12.0 or later

## Attributes

- default['yum-scl']['prefer_os_package'] - configure repository using package provided by OS (if available)
- default['yum-scl']['enable_testing'] = false - enable testing repositories of softwarecollections
- default['yum-scl']['enable_source'] = false - enable source repositories of softwarecollections
- default['yum-scl']['enable_debuginfo'] = false - enable debuginfo repositories of softwarecollections

## Recipes

### yum-scl::default

The default recipe tries to install package for softwarecollection repositories provided by OS then falls to 
installation using yum_repository resource

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yum-scl]"
  ]
}
```

### yum-scl::native_install

The recipe installs package for softwarecollection repositories provided by OS

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yum-scl::native_install]"
  ]
}
```

### yum-scl::chef_install

The recipe adds yum repositories using chef yum_repository resource

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yum-scl::chef_install]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Dmitry Shestoperov
