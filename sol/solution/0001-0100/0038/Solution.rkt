(define/contract (count-and-say n)
  (-> exact-integer? string?)
  (define (encode s)
    (define (helper lst count prev acc)
      (cond
        [(null? lst) (string-append acc (number->string count) (string prev))]
        [(equal? (car lst) prev)
         (helper (cdr lst) (add1 count) prev acc)]
        [else
         (helper (cdr lst) 1 (car lst)
                 (string-append acc (number->string count) (string prev)))]))
    (helper (cdr s) 1 (car s) ""))
  (define (iter i res)
    (if (= i n) res
        (iter (add1 i) (encode (string->list res)))))
  (iter 1 "1"))