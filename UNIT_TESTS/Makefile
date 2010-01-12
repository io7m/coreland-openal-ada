tests:
	rm -rf TEST_RESULTS tests-summary.log_out
	./tests-run-init TEST_DB TEST_RESULTS >/dev/null
	./tests-run TEST_DB TEST_RESULTS     2>&1 | tee -a tests-summary.log_out
	./tests-summary TEST_DB TEST_RESULTS 2>&1 | tee -a tests-summary.log_out

tests_clean:
	rm -rf TEST_RESULTS
	rm -f *.log_out *.log_error

clean: tests_clean
