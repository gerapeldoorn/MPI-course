# Supporting files for the Manageable Puppet Infrastructure course on Udemy
WIP

# Links
## Intro
Presentation intro: https://my.visme.co/projects/dmv33067-puppet-mpi-course

## Getting started
CentOS 7 image download: http://www.osboxes.org/centos/ (with GUI) *or* https://s3-eu-west-1.amazonaws.com/virtualboxes.org/CentOS7-base.ova.torrent

You might run into this error if you use the same image for the Master and Gitlab server:

    A hard disk with UUID {1234} or with the same properties is already registered.
    
Fix:

    VBoxManage internalcommands sethduuid [filename].vdi


## Install GitLab
https://about.gitlab.com/downloads/#centos7
