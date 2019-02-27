(define (towers n from to spare) (begin (call_towers n from spare to) (print_move from to) (call_towers n spare to from)))
(define main (begin (= n 3) (print n) (towers n 1 2 3)))
	.data
