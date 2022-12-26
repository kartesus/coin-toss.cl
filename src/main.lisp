(defpackage #:coin-toss
  (:use #:cl))

(in-package #:coin-toss)

(defun coin-toss ()
  (let ((coin (random 2 (make-random-state t))))
    (if (= coin 0) "h" "t")))


(defun prompt ()
  (format t "Please enter H or T: ")
  (force-output)
  (let ((guess (string-downcase (read-line))))
    (if (or (string= guess "h")
            (string= guess "t"))
        (let ((result (coin-toss)))
          (format t "The coin landed on ~a.~%" result)
          (if (string= guess result)
              (format t "You guessed correctly.~%")
              (format t "You guessed incorrectly.~%")))
        (progn (format t "Invalid input.~%")
               (prompt)))))

(prompt)