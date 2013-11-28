REPORTER = spec

.PHONY: test
test:
	@echo TRAVIS_JOB_ID $(TRAVIS_JOB_ID)
	@$(MAKE) core_test

core_test:
	./node_modules/.bin/mocha
	
.PHONY: lint
lint:
	./node_modules/.bin/jshint ./app ./test 

.PHONY: coveralls
test-coveralls:
	rm -rf coverage
	rm -rf app-cov

	mkdir coverage
	mkdir app-cov

	./node_modules/.bin/jscoverage app/index.js app-cov/index.js
	mv app app-orig
	mv app-cov app
	./node_modules/.bin/mocha -R mocha-lcov-reporter | ./node_modules/coveralls/bin/coveralls.js
	rm -rf app
	mv app-orig app