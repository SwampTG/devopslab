# devopslab

Studying docker, vagrant and other devops tools.

## Tools

### Ansible

With Ansible we can maintain an infrastructure with scalability
and maintenability. It's possible to version control the infrastructure to
better management and integration with the projects.

That's IaC - Infrastructure as Code!

#### Ansible concepts

There are two types of machines: Control node and managed hosts.
So it's possible to define who is the controler machine and who are the machines
it manages through a Host inventory file.

They communicate through SSH protocol, so it's easy to configure.

#### Ansible architecture

Divided in modules:

- Core modules: Adm activities for the OS.
- Custom modules: Customized components to modify and extend functionalities
using Python.
- Playbooks: YAML config archives for modules.
- Plugins: Extended functionalities implemented by others.
- Host inventory: Define the controlled hosts.
