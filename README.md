# ansible-hubot

Ansible role for creating and managing a [Hubot](https://hubot.github.com/) powered chat robot. 

## Dependencies and Requirements

### Ansible
[ansible-apt](https://github.com/cspicer/ansible-apt)  
[ansible-nodejs](https://github.com/cspicer/ansible-nodejs)  
[ansible-runit](https://github.com/cspicer/ansible-runit)  

## Variables

See [`defaults/main.yml`](defaults/main.yml) for default values.

### Hubot

These variables are used for setting up and deploying Hubot, such as specifying specific packages to be installed. These are less likely to require changes or overrides.

Variable        | Type      | Description
--------        | ----      | -----------
hubot_apt_pkg   | List      | List of apt packages to be installed
hubot_npm_pkg   | List      | List of npm packages to be installed

### Robot

These variables are used for creating and configurating a unique Hubot-powered robot, and are more likely be customized.

Variable        | Type      | Description
--------        | ----      | -----------
robot_name      | String    | Name of your robot
robot_author    | String    | Author/maintainer of the robot
robot_desc      | String    | Desciption of the robot
robot_user      | String    | User account to run the robot as
robot_dir       | String    | Directory to create robot in
robot_env_dir   | String    | Directory to write config as env vars
robot_adapter   | String    | Hubot adapter used by the robot
robot_scripts   | List      | Hubot scripts to be installed via npm
robot_env       | Dict      | Key/value config pairs to be exported to env

### runit_service

This role uses [`runit`](http://smarden.org/runit/) and a [corresponding role](https://github.com/cspicer/ansible-runit)) to manage the Hubot process. The `run` and `log` scripts used by runit are defined here as variables.

Variable        | Type          | Description
--------        | ----          | -----------
runit_service   | Nested Dict   | A list with a nested dictionary containing the contents of `run_script` and `log_script`

## Testing

A [Makefile](Makefile) is included to test this role via [Vagrant](https://github.com/mitchellh/vagrant), using the included [Vagrantfile](Vagrantfile) and `ansible-galaxy` [`requirements.yml`](requirements.yml) file to resolve any external dependencies.

External role dependencies are copied into the Vagrant Ansible provisioner directory (`.vagrant/provisioners/ansible/roles`) which is specified in the[`ansible.cfg`](ansible.cfg) file as a `roles_path`.

### Makefile

* `make all` to resolve dependencies and bring up a test VM
* `make clean` to destroy the test VM and remove external dependencies once finished testing

## Examples

Add to your playbook as a role include:

    ---
    - hosts: all
      roles:
        - role: ansible-hubot

## Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Created and maintained by [Chris Spicer][cspicer] (<github@cspicer.ca>).

## License

MIT License (see [LICENSE][license])

[cspicer]: https://github.com/cspicer
[repo]: https://github.com/cspicer/ansible-hubot
[issues]: https://github.com/cspicer/ansible-hubot/issues
[license]: https://github.com/cspicer/ansible-hubot/blob/master/LICENSE
