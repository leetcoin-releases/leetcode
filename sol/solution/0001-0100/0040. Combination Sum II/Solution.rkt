(define/contract (combination-sum2 candidates target)
  (-> (listof exact-integer?) exact-integer? (listof (listof exact-integer?)))
  (define sorted (sort candidates <))
  (define (backtrack start target path)
    (cond
      [(= target 0) (list path)]
      [(< target 0) '()]
      [else
       (let loop ([i start] [results '()])
         (if (>= i (length sorted))
             results
             (let ([num (list-ref sorted i)])
               (if (and (> i start) (= num (list-ref sorted (- i 1))))
                   (loop (+ i 1) results)
                   (loop (+ i 1)
                         (append results
                                 (backtrack (+ i 1) (- target num) (append path (list num)))))))))]))
  (backtrack 0 target '()))