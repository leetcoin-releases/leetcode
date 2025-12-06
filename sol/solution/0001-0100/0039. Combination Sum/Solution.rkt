(define/contract (combination-sum candidates target)
  (-> (listof exact-integer?) exact-integer? (listof (listof exact-integer?)))
  (define sorted-candidates (sort candidates <))
  (define (backtrack start remaining current)
    (cond
      [(zero? remaining) (list (reverse current))]
      [else
       (apply append
              (for/list ([i (in-range start (length sorted-candidates))])
                (let ([num (list-ref sorted-candidates i)])
                  (if (> num remaining)
                      '() ; prune
                      (backtrack i (- remaining num) (cons num current))))))]))
  (backtrack 0 target '()))