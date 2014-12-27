(ql:quickload :lisp-unit)

(load "../src/salary.cl")

(defpackage :takehome-tests
  (:use :common-lisp :lisp-unit :takehome)
)

(in-package :takehome-tests)

(define-test test-tax
  (assert-equal 0 (tax 0))
  (assert-equal 0 (tax 1))
  (assert-equal 0 (tax 9999))
  (assert-equal 0 (tax 10000))
  (assert-equal 0 (tax 10000))
  (assert-equal 0 (tax 10000))
  (assert-equal 0 (tax 10000))
  (assert-equal 1/5 (tax 10001))
  (assert-equal 0.19999999 (tax 10001.0))
  (assert-equal 6000.0 (tax 40000.0))
  (assert-equal 9626.8 (tax 50000.0))
  (assert-equal 29626.8 (tax 100000.0))
  (assert-equal 53626.8 (tax 150000.0))
  (assert-equal 62626.8 (tax 170000.0))
)

(define-test test-ni
  (assert-equal 0 (ni 0))
  (assert-equal 0 (ni 7956))
  (assert-equal 0.12 (ni 7957.0))
  (assert-equal 485.27997 (ni 12000.0))
  (assert-equal 2165.28 (ni 26000.0))
  (assert-equal 4231.28 (ni 50000.0))
  (assert-equal 5631.2803 (ni 120000.0))
)

(run-tests)