
# delete_tables.rb


require 'flor/unit'


unit = Flor::Unit.new(ENV['FLOR_ENV_DIR'] + '/etc/conf.json')

p unit.storage.db
unit.storage.delete_tables

