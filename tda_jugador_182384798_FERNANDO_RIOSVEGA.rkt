#lang racket

;; Constructor de jugador
;; Dom: id (int), nombre (string), dinero (int), propiedades (list), posicion (int), carcel (bool), salir-carcel (int)
;; Rec: jugador (list)
(define (jugador id nombre dinero propiedades posicion carcel salir-carcel)
  (list id nombre dinero propiedades posicion carcel salir-carcel))

;; Selectores del jugador
(define (jugador-id jugador) (list-ref jugador 0))
(define (jugador-nombre jugador) (list-ref jugador 1))
(define (jugador-dinero jugador) (list-ref jugador 2))
(define (jugador-propiedades jugador) (list-ref jugador 3))
(define (jugador-posicion jugador) (list-ref jugador 4))
(define (jugador-en-carcel? jugador) (list-ref jugador 5))
(define (jugador-cartas-salir-carcel jugador) (list-ref jugador 6))

;; Predicado: ¿Está en bancarrota?
(define (jugador-esta-en-bancarrota jugador)
  (<= (jugador-dinero jugador) 0))

;; Modificadores
(define (mover-jugador jugador pasos)
  (let* ([pos (jugador-posicion jugador)]
         [nueva-pos (modulo (+ pos pasos) 16)])
    (list (jugador-id jugador)
          (jugador-nombre jugador)
          (jugador-dinero jugador)
          (jugador-propiedades jugador)
          nueva-pos
          (jugador-en-carcel? jugador)
          (jugador-cartas-salir-carcel jugador))))

(define (modificar-dinero jugador monto)
  (list (jugador-id jugador)
        (jugador-nombre jugador)
        (+ (jugador-dinero jugador) monto)
        (jugador-propiedades jugador)
        (jugador-posicion jugador)
        (jugador-en-carcel? jugador)
        (jugador-cartas-salir-carcel jugador)))

(define (añadir-propiedad jugador propiedad)
  (list (jugador-id jugador)
        (jugador-nombre jugador)
        (jugador-dinero jugador)
        (cons propiedad (jugador-propiedades jugador))
        (jugador-posicion jugador)
        (jugador-en-carcel? jugador)
        (jugador-cartas-salir-carcel jugador)))

(define (entrar-carcel jugador)
  (list (jugador-id jugador)
        (jugador-nombre jugador)
        (jugador-dinero jugador)
        (jugador-propiedades jugador)
        (jugador-posicion jugador)
        #t
        (jugador-cartas-salir-carcel jugador)))

(define (usar-carta-salir-carcel jugador)
  (list (jugador-id jugador)
        (jugador-nombre jugador)
        (jugador-dinero jugador)
        (jugador-propiedades jugador)
        (jugador-posicion jugador)
        #f
        (- (jugador-cartas-salir-carcel jugador) 1)))

(define (jugar-turno jugador)
  (cond
    [(jugador-esta-en-bancarrota jugador) 
     (displayln (string-append (jugador-nombre jugador) " está en bancarrota."))
     jugador]
    [(jugador-en-carcel? jugador) 
     (displayln (string-append (jugador-nombre jugador) " está en la cárcel."))
     jugador]
    [else
     (let* ([pasos (random 6)]
            [nuevo-jugador (mover-jugador jugador pasos)])
       (displayln (string-append (jugador-nombre nuevo-jugador) 
                                " ha avanzado " (number->string pasos) " pasos."))
       nuevo-jugador)]))

;; Ejemplo de jugadores
(define jugador1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define jugador2 (jugador 2 "Ana" 1500 '() 0 #f 0))

;; Simulación de un turno
(displayln "Turno de Carlos:")
(define jugador1-actualizado (jugar-turno jugador1))

(displayln "Turno de Ana:")
(define jugador2-actualizado (jugar-turno jugador2))

;; Provisión de las funciones
(provide 
  jugador
  jugador-id
  jugador-nombre
  jugador-dinero
  jugador-propiedades
  jugador-posicion
  jugador-en-carcel?
  jugador-cartas-salir-carcel
  jugador-esta-en-bancarrota
  jugar-turno
  mover-jugador
  modificar-dinero
  añadir-propiedad
  entrar-carcel
  usar-carta-salir-carcel)
