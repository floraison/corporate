
# delete_tables.rb


require 'flor/unit'
require 'florist'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])

p unit.storage.db

puts
puts '  *** deleting flor tables...'
puts
unit.storage.delete_tables

puts
puts '  *** deleting florist tables...'
puts
Florist.delete_tables(unit.storage)

puts

