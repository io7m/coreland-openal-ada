tests:
	rm -rf TEST_RESULTS
	./tests-run-init TEST_DB TEST_RESULTS >/dev/null
	./tests-run TEST_DB TEST_RESULTS
	./tests-summary TEST_DB TEST_RESULTS

tests_clean:
	rm -rf TEST_RESULTS
	rm -f *.log_out *.log_error

clean: tests_clean
