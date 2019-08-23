
# delete_tables.rb


require 'flor/unit'
require 'florist'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])

p unit.storage.db

puts '  *** deleting flor tables...'
unit.storage.delete_tables

puts '  *** deleting florist tables...'
Florist.delete_tables(unit.storage)

