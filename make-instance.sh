# Set up Juju
sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core
mkdir local/juju
ln -s ~/local/juju .juju
juju generate-config
cd local/juju
# edit environments.yaml

# Set up
# https://github.com/marcoceppi/discourse-charm
juju bootstrap --show-log
juju deploy --show-log cs:~marcoceppi/discourse
juju set discourse admins="ematsen" --show-log
juju set discourse release="v0.9.7.5"
juju deploy --show-log postgresql
juju add-relation discourse postgresql:db-admin
juju expose --show-log discourse
juju get discourse

juju status

# Admin
# https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md

# Tear down
# juju destroy-environment -y

