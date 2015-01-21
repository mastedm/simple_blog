# Simple Blog

## Create and fill files

### On local machine

* `config/deploy.rb`
Change `set :deploy_to` for correct path

* config/deploy/production.rb

### On remote machine

* `config/secrets.yml`
* `config/database.yml`

## Create admin user

`RAILS_ENV=production rake casein:users:create_admin email=EMAIL password=PASS
`