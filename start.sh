#!/bin/bash
cd /usr/src/app
rake db:migrate
rake db:seed
ruby app.rb
