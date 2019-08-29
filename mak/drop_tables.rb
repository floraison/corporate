
# delete_tables.rb


require 'flor/unit'
require 'florist'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'])

p unit.storage.db
tables = unit.storage.db.tables

puts
puts '  *** dropping flor tables...'
puts
tables.each do |t|
  unit.storage.db.drop_table(t) if t.to_s.match(/^flor_/)
end

puts
puts '  *** dropping florist tables...'
puts
tables.each do |t|
  unit.storage.db.drop_table(t) if t.to_s.match(/^florist_/)
end

puts

