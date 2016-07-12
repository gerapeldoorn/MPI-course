# Node classification
## site.pp
```
node 'master.puppetspecialist.nl' {
  include role::puppetmaster
}
```
## Web-interface in Puppet Enterprise or Foreman
* too easy to make a big mistake

## Hieradata
nodes/master.puppetspecialist.nl.yaml:
```
---
role: puppetmaster
```
in site.pp:
```
$role = hiera('role', 'none')
if $role != 'none' {
  include "role::${role}"
} else {
  include profile::base
  notify { "Node ${::fqdn} has no role set.": }
}
```

## External facts
/etc/puppetlabs/facter/facts.d/custom.txt (Make immutable)
```
role=puppetmaster
```
in site.pp:
```
if $::role {
  include "role::${::role}"
} else {
  include profile::base
  notify { "Node ${::fqdn} has no role set.": }
}
```
