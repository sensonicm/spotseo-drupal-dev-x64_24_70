# inifile_chef_gem Cookbook

inifile_chef_gem is a library cookbook. It provides custom resource, that can be used in recipes
## Requirements

### Chef

- Chef 12.0 or later

## Usage

Place a dependency in your cookbook's metadata.rb
```ruby
depends 'inifile_chef_gem'
```
Install gem using custom resource
```ruby
inifile_chef_gem 'default' do
  action :install
end
```
## Resource overview

### inifile_chef_gem

The resource installs inifile gem into Chef's Ruby enviroment

```ruby
inifile_chef_gem 'default' do
  gem_version '3.0.0'
  action :install
end
```

#### Parameters
- gem_version - The version of rubygem to be installed. Defaults to 3.0.0

#### Actions
- :install - build and install gem into Chef's Ruby enviroment
- :remove - Delete the gem from Chef's Ruby environment


## License and Authors

Authors: Dmitry Shestoperov

