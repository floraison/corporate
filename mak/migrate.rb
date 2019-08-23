
# migrate.rb


require 'flor/unit'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])

p unit.storage.db


fsi = unit.storage.db[:flor_schema_info]
p [ 0, :flor_schema_info, fsi && fsi.all ]

puts "  *** migrate flor tables..."
unit.storage.migrate

fsi = unit.storage.db[:flor_schema_info]
p [ 1, :flor_schema_info, fsi && fsi.all ]


puts "  *** migrate florist tables..."
# TODO
#Flor.migrate(unit.storage.db

