# vagrant-compasscompile-hack

A simple script hack to get a good experience when working with `vagrant` and `compass watch`. 
This basically reimplements `compass watch` and executes `compass compile` inside the vagrant client on file change.

This is implemented with minial requirements in mind. This should work out of the box without any additional installation of any tools. `compass` and these tools should be installed inside the vagrant environment.

# Quickstart

Edit the `compass.sh` file and change the values for `SCSS_FOLDER` and `COMMAND` accordingly.
After `vagrant up` is finished, start `./compass.sh`.


# gitignore

Some files will get created which should not get commited again. Add these files to your `.gitignore`:

* .checkpoint
* .vagrant-ssh
