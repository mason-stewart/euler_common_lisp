; Euler 2
; By considering the terms in the Fibonacci sequence whose values
; do not exceed four million, find the sum of the even-valued terms.

; usage: (SUM-EVEN-FIBONACCI 4000000)
(defun sum-even-fibonacci (limit &optional (numbers '(1 2)))

  (cond ((< (car (last numbers)) limit)
          (sum-even-fibonacci limit (append numbers
                                            (list (apply '+ (last numbers 2))))))
        (t (print `(oh fun! the total was
              ,(apply '+ (mapcan (lambda (number)
                                   (if (eq (mod number 2) 0)
                                       (list number)
                                       nil))
                                 numbers)))))))