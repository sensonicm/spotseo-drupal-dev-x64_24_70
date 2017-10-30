### SDD cook-book

You can manually add your own recipe to the "SDD" cook-book. In the terminal go to the directory `/environment` and type the command:

``` html
chef generate recipe cookbooks/spotseo/SDD your_recipe_name
```

Templates for "SDD" cook-book recipes are located in the `/environment/cookbooks/spotseo/SDD/templates` folder.

After you have written your own recipe, add it to the "run-list" in `/environment/roles/local.json`

More detailed information can be obtained at: [LEARN CHEF docs](https://docs.chef.io).
