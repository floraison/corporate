
# migrate.rb


require 'flor/unit'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'] + '/etc/conf.json')

p unit.storage.db
unit.storage.migrate

puts "\n:flor_schema_info"
p unit.storage.db[:flor_schema_info].all
puts

