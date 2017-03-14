require 'active_record'
require 'pg'
require 'json'

puts ENV['hub']

set :database_file, 'config/database.yml'

class Resource < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

puts json Resource.select('id', 'name').all
