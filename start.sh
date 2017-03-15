#!/bin/bash
cd /usr/src/app
rake db:setup
#echo "Starting migration..."
#rake db:migrate --trace
#echo "Starting seeding..."
#rake db:seed
ruby app.rb
ping -c 20 yahoo.com
