tests: list_tests run_tests
tests_clean:
	rm -f testlist *.log_succ *.log_fail *.log_out *.log_err
clean: tests_clean

list_tests:
	./list-tests > testlist

run_tests:
	./run-tests
