
# migrate.rb


require 'flor/unit'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])

p unit.storage.db


puts
puts "  *** migrate flor tables..."
puts

fsi = unit.storage.db[:flor_schema_info]
p [ 0, :flor_schema_info, (fsi && fsi.all rescue nil) ]

unit.storage.migrate

fsi = unit.storage.db[:flor_schema_info]
p [ 1, :flor_schema_info, (fsi && fsi.all rescue nil) ]


puts
puts "  *** migrate florist tables..."
puts

fsi = unit.storage.db[:florist_schema_info]
p [ 0, :florist_schema_info, (fsi && fsi.all rescue nil) ]

# TODO
#Flor.migrate(unit.storage.db

fsi = unit.storage.db[:florist_schema_info]
p [ 1, :florist_schema_info, (fsi && fsi.all rescue nil) ]

puts

