require 'active_record'
require 'pg'
require 'json'

puts ENV['hub']

class Resource < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

puts JSON Resource.select('id', 'name').all
