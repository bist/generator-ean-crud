REPORTER = spec
test: 
	@echo TRAVIS_JOB_ID $(TRAVIS_JOB_ID)
	@$(MAKE) core_test

core_test:
	@NODE_ENV=test ./node_modules/.bin/mocha -b --require blanket --reporter $(REPORTER)

lint:
	./node_modules/.bin/jshint ./app ./test

test-cov:
	$(MAKE) test REPORTER=spec
	$(MAKE) core_test REPORTER=html-cov > coverage.html

test-coveralls:
	$(MAKE) test REPORTER=spec
	$(MAKE) core_test REPORTER=mocha-lcov-reporter | ./node_modules/coveralls/bin/coveralls.js --verbose
	rm -rf lib-cov

.PHONY: test