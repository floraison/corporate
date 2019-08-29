
# migrate.rb


require 'flor/unit'
require 'florist'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])
worklist = Florist::Worklist.new(unit)

p unit.storage.db
p worklist.florist_db


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

worklist.migrate

fsi = unit.storage.db[:florist_schema_info]
p [ 1, :florist_schema_info, (fsi && fsi.all rescue nil) ]

puts

