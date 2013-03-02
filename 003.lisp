; Euler 3
; What is the largest prime factor of the number 600851475143 ?
; Solved with LOTS of help from http://wbruschi.blogspot.com/2008/05/project-euler-problem-3.html
; I had totally forgotten how to do prime factorizations O_o

; usage: (LARGEST-PRIME-FACTOR 600851475143)
(defun largest-prime-factor (num)
  (reduce #'max
    (labels ((prime-factors (num)
               (unless (<= num 1)
                 (do ((x 2 (1+ x)))
                       ((zerop (mod num x))
                        (cons x
                                 (prime-factors (/ num x))))))))
      (prime-factors num))))
