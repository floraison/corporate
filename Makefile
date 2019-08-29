
RUBY=bundle exec ruby

serve:
	FLOR_DEBUG=dbg,colors CORPORATE_ENV=dev \
      $(RUBY) -S rackup -p 7080 -o 0.0.0.0 -s puma
s: serve

kills:
	ps aux | grep "rackup -p 7080" | awk '{ print $$2 }' | xargs kill -9
ks: kills

drop_tables:
	FLOR_DEBUG=sto,stdout,colors FLOR_ENV_DIR=env $(RUBY) mak/drop_tables.rb
delete_tables:
	FLOR_DEBUG=sto,stdout,colors FLOR_ENV_DIR=env $(RUBY) mak/delete_tables.rb
migrate_tables:
	FLOR_DEBUG=sto,stdout,colors FLOR_ENV_DIR=env $(RUBY) mak/migrate.rb
migrate: migrate_tables

.PHONY: \
  serve kills \
  drop_tables delete_tables migrate

