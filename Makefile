test: unit_test acceptance_test

unit_test:
	mix test

acceptance_test:
	MIX_ENV=acceptance_test mix test

.PHONY: test

.default: test

