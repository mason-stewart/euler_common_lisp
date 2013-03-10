; Euler 4
; Find the largest palindrome made from the product of two 3-digit numbers.
; NOTE: this stack overlows in CLISP when the digits argument is higher than 5 :(

(defun is-palindrome (number)
  (let ((string-num (format nil "~A" number)))
    (string= string-num (reverse string-num))))

; usage: (LARGEST-PALINDROME 3)
(defun largest-palindrome (digits)
  ; set a high, low, max, and a successful-y
  (let ((high (1- (expt 10 digits)))
        (low (expt 10 (- digits 1)))
        (max 0)
        (successful-y 0))
    (loop for x from high downto low do
      ; if x is lower than successful-y, we know we've already found the biggest palidrome
      ; so just break from the loop
      (if (< x successful-y)
        (return max))
      (loop for y from high downto low do
        (let ((current (* x y)))
          ; if its a palindrome and it's bigger than the previously found palindromes,
          ; set the new one as the max
          (cond ((and (is-palindrome (* x y)) (> current max))
                   (setf max current)
                   (setf successful-y y))))))
    max))