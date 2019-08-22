
RUBY=bundle exec ruby

serve:
	FLOR_DEBUG=dbg,colors CORPORATE_ENV=dev \
      $(RUBY) -S rackup -p 7080 -o 0.0.0.0 -s puma
s: serve

kills:
	ps aux | grep "rackup -p 7080" | awk '{ print $$2 }' | xargs kill -9
ks: kills

delete_tables:
	FLOR_DEBUG=sto,stdout,colors FLOR_ENV_DIR=env $(RUBY) mak/delete_tables.rb
migrate:
	FLOR_DEBUG=sto,stdout,colors FLOR_ENV_DIR=env $(RUBY) mak/migrate.rb

#migrate:
#	$(RUBY) -Ilib -e "require 'flor/unit'; Flor::Unit.new('envs/$(FLOR_ENV)/etc/conf.json').storage.migrate($(TO), $(FROM))"

.PHONY: \
  serve kills \
  delete_tables migrate

