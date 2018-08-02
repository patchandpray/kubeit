# Setup cluster infra

prereqs:
create project in gcloud
create new service account
create service account (service account key)
get service account credentials file for gloud project
make service account editor (apply role)

terraform:
NOTE - use distinct user var naming( default user and ssh\_key default to your system vars and will fuck you up) - hence now using: gce\_ssh\_user and gce\_ssh\_pub\_key\_file
get ssh user from gcloud and configure in vars file
create ssh key file and configure in vars file
terraform init

ansible:
configure remote\_user
configure ansible ssh key in defaults
generate inventory
ping it! /ansible make ping
