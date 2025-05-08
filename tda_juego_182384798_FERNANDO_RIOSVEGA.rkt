#lang racket
(require "tda_jugador_182384798_FERNANDO_RIOSVEGA.rkt")

;; Constructor del TDA Juego
;; Dom: jugadores (list) X tablero (list) X dineroBanco (int) X numeroDados (int) X turnoActual (int)
;;      X tasaImpuesto (int) X maximoCasas (int) X maximoHoteles (int)
;; Rec: juego (list)
(define (juego jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles)
  (list jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles))

;; Selectores del TDA Juego
(define (juego-jugadores j) 
  ;; Dom: j (juego)
  ;; Rec: (list) - Lista de jugadores
  (list-ref j 0))

(define (juego-tablero j) 
  ;; Dom: j (juego)
  ;; Rec: (list) - Tablero del juego
  (list-ref j 1))

(define (juego-dineroBanco j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Dinero disponible en el banco
  (list-ref j 2))

(define (juego-numeroDados j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Número de dados
  (list-ref j 3))

(define (juego-turnoActual j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Índice del jugador cuyo turno es actualmente
  (list-ref j 4))

(define (juego-tasaImpuesto j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Tasa de impuesto del juego
  (list-ref j 5))

(define (juego-maximoCasas j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Número máximo de casas permitidas
  (list-ref j 6))

(define (juego-maximoHoteles j) 
  ;; Dom: j (juego)
  ;; Rec: (int) - Número máximo de hoteles permitidos
  (list-ref j 7))

;; Agregar jugador al juego
(define (juego-agregar-jugador j nuevo-jugador)
  ;; Dom: j (juego), nuevo-jugador (jugador)
  ;; Rec: nuevo-juego (juego) - El juego con el nuevo jugador añadido
  (juego
   (cons nuevo-jugador (juego-jugadores j))
   (juego-tablero j)
   (juego-dineroBanco j)
   (juego-numeroDados j)
   (juego-turnoActual j)
   (juego-tasaImpuesto j)
   (juego-maximoCasas j)
   (juego-maximoHoteles j)))

;; Lanzar dados usando semillas dadas
(define (myRandom Xn)
  ;; Dom: Xn (int)
  ;; Rec: (int) - Resultado del generador pseudoaleatorio
  (modulo (+ (* 1103515245 Xn) 12345) 2147483648))

(define (getDadoRandom seed)
  ;; Dom: seed (int)
  ;; Rec: (int) - Número aleatorio entre 1 y 6
  (+ 1 (modulo (myRandom seed) 6)))

(define (juego-lanzar-dados seed1 seed2)
  ;; Dom: seed1 (int), seed2 (int)
  ;; Rec: (list int) - Lista con los dos resultados de los dados
  (list (getDadoRandom seed1) (getDadoRandom seed2)))

;; Obtener jugador del turno actual
(define (get-jugador juego)
  ;; Dom: juego (list)
  ;; Rec: jugador (list) - El jugador cuyo turno está activo
  (let* ((jugadores (juego-jugadores juego))
         (turno (juego-turnoActual juego)))
    (list-ref jugadores turno)))

;; Reemplaza un jugador en la lista por índice
(define (list-set lst index new-elem)
  ;; Dom: lst (list), index (int), new-elem (any)
  ;; Rec: (list) - Lista con el elemento reemplazado en la posición indicada
  (append (take lst index)
          (list new-elem)
          (drop lst (+ index 1))))

;; Simular turno (versión simplificada inicial)
(define (juego-jugar-turno el-juego dados comprarCasa construirHotel pagarMultaSalirCarcel usarTarjetaSalirCarcel)
  ;; Dom: el-juego (juego), dados (list int), comprarCasa (función), construirHotel (función), pagarMultaSalirCarcel (función), usarTarjetaSalirCarcel (función)
  ;; Rec: nuevo-juego (juego) - El juego con los jugadores actualizados después del turno
  (let* ((dado1 (first dados))
         (dado2 (second dados))
         (jugadores (juego-jugadores el-juego))
         (turno (juego-turnoActual el-juego))
         (num-jugadores (length jugadores))
         (siguiente-turno (modulo (+ turno 1) num-jugadores))
         (jugador-actual (list-ref jugadores turno))
         (nuevo-jugador (mover-jugador jugador-actual (+ dado1 dado2)))
         (jugadores-actualizados (list-set jugadores turno nuevo-jugador))
         (nuevo-juego
          (juego
           jugadores-actualizados
           (juego-tablero el-juego)
           (juego-dineroBanco el-juego)
           (juego-numeroDados el-juego)
           siguiente-turno
           (juego-tasaImpuesto el-juego)
           (juego-maximoCasas el-juego)
           (juego-maximoHoteles el-juego)))) 

    ;; Salida del turno
    (displayln (string-append "Turno de " (jugador-nombre nuevo-jugador) ":"))
    (displayln (string-append (jugador-nombre nuevo-jugador) " ha avanzado "
                               (number->string (+ dado1 dado2)) " pasos."))
    (displayln (string-append (jugador-nombre nuevo-jugador) " tiene $"
                              (number->string (jugador-dinero nuevo-jugador)) " en su cuenta."))
    nuevo-juego))

;; Proveer funciones y constructor
(provide
 juego
 juego-jugadores
 juego-tablero
 juego-dineroBanco
 juego-numeroDados
 juego-turnoActual
 juego-tasaImpuesto
 juego-maximoCasas
 juego-maximoHoteles
 juego-agregar-jugador
 juego-lanzar-dados
 get-jugador
 juego-jugar-turno)
