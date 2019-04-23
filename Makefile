
RUBY=bundle exec ruby

serve:
	FLOR_DEBUG=dbg,colors CORPORATE_ENV=dev \
      $(RUBY) -S rackup -p 7080 -o 0.0.0.0 -s puma
s: serve

kills:
	ps aux | grep "rackup -p 7080" | awk '{ print $$2 }' | xargs kill -9
ks: kills

.PHONY: serve kills

