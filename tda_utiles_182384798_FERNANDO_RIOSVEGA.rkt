#lang racket
; Descripción: Funciones de utilidad como generador de dados

;; Función que implementa un generador de números aleatorios basado en una semilla
;; Dom: semilla (int)
;; Rec: entero (int)
;; Tipo de recursión: No aplica
;; Descripción: Genera un número pseudo-aleatorio usando una semilla y una fórmula matemática
(define (myRandom Xn)
  (modulo (+ (* 1103515245 Xn) 12345) 2147483648))

;; Función que genera un valor aleatorio entre 1 y 6, representando un dado
;; Dom: semilla (int)
;; Rec: entero entre 1 y 6 (int)
;; Tipo de recursión: No aplica
;; Descripción: Usa la semilla para generar un valor entre 1 y 6 simulando el lanzamiento de un dado.
(define (getDadoRandom seed)
  (+ 1 (modulo (myRandom seed) 6)))

(provide myRandom getDadoRandom)
