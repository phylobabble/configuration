sudo apt-get install bundler
sudo apt-get install rubygems
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
sudo apt-get install postgresql postgresql-client postgresql-server-dev-all libpq-dev

# logged into heroku and started a cloudredis

heroku login
heroku create phylobabble
bundle install
rake secret
heroku config:add SECRET_TOKEN=REDACTED
heroku labs:enable user-env-compile
heroku addons:add heroku-postgresql:dev
heroku pg:promote HEROKU_POSTGRESQL_NAVY_URL
heroku config:set DISCOURSE_REDIS_HOST=pub-redis-19921.us-east-1-2.1.ec2.garantiadata.com
heroku config:set DISCOURSE_REDIS_PORT=19921
heroku config:set DISCOURSE_REDIS_PASSWORD=REDACTED

heroku config:set DISCOURSE_DB_HOST=ec2-174-129-197-200.compute-1.amazonaws.com
heroku config:set DISCOURSE_DB_PORT=5432
heroku config:set DISCOURSE_DB_NAME=d83ctn2nf23ors
heroku config:set DISCOURSE_DB_USERNAME=qzfwzjqdngxomm
heroku config:set DISCOURSE_DB_PASSWORD=REDACTED


git push heroku master
heroku run rake db:migrate db:seed_fu
