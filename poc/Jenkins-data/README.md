# Jenkins jobs backup

This folder is a backup of the Jenkins jobs created as part of the POC, as well as some of its required scripts.

Beside the common installation plugins, the following Jenkins plugins were utilized to run the jobs:
- [Vagrant](https://plugins.jenkins.io/vagrant/)
- [Valgrind](https://plugins.jenkins.io/valgrind/)

Some jobs use docker images, which are provided at the `Docker-*` directories located at [poc](../).

Each directory has the following content:
- [`jobs`](jobs): multiple directories, each one corresponds to a Jenkins job createad as part of this POC; inside each folder there's a `config.xml` file with the job itself.
- [`personal_data`](personal_data): some data utilized by some jobs at each build.
- [`vagrant_files`](vagrant_files): vagrant files utilized by the vagrant job.