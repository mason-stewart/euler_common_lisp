; Euler 1
; Find the sum of all the multiples of 3 or 5 below 1000.

; usage: (SUM-MULTIPLES 0 1000 '(3 5))
(defun sum-multiples (start end multiples &optional (sum 0)) 
  (cond ((< start end)
           (cond ((mapcan (lambda (multiple) (if (eq (mod start multiple) 0) (list T) nil)) multiples)
                    (sum-multiples (1+ start) end multiples (+ sum start)))
                  (t (sum-multiples (1+ start) end multiples sum))))
        (t (princ `(cool job ,sum is the total)))))