require 'bundler'
Bundler.require
ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_relative "../db/seeds.rb"
require_all 'app'

