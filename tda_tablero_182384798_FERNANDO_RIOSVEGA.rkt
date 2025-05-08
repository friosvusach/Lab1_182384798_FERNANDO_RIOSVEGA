#lang racket
;;; TDA Tablero

;; Constructor del tablero
;; Dom: propiedades (list) x suerte (list) x comunidad (list) x especiales (list)
;; Rec: tablero (list)
;; Tipo de recursión: No aplica
;; Descripción: Crea un tablero con las listas de propiedades, suerte, comunidad y casillas especiales.
(define (tablero propiedades suerte comunidad especiales)
  (list propiedades suerte comunidad especiales))

;; Selectores

;; Obtiene las propiedades del tablero
;; Dom: tablero (list)
;; Rec: propiedades (list)
;; Tipo de recursión: No aplica
;; Descripción: Devuelve la lista de propiedades del tablero.
(define (tablero-propiedades t) (list-ref t 0))

;; Obtiene las cartas de suerte del tablero
;; Dom: tablero (list)
;; Rec: suerte (list)
;; Tipo de recursión: No aplica
;; Descripción: Devuelve la lista de cartas de suerte del tablero.
(define (tablero-suerte t) (list-ref t 1))

;; Obtiene las cartas de comunidad del tablero
;; Dom: tablero (list)
;; Rec: comunidad (list)
;; Tipo de recursión: No aplica
;; Descripción: Devuelve la lista de cartas de comunidad del tablero.
(define (tablero-comunidad t) (list-ref t 2))

;; Obtiene las casillas especiales del tablero
;; Dom: tablero (list)
;; Rec: especiales (list)
;; Tipo de recursión: No aplica
;; Descripción: Devuelve la lista de casillas especiales del tablero.
(define (tablero-especiales t) (list-ref t 3))

;; Modificadores

;; Agrega una propiedad al tablero
;; Dom: tablero (list) x propiedad (any)
;; Rec: tablero (nuevo) 
;; Tipo de recursión: No aplica
;; Descripción: Agrega una nueva propiedad a la lista de propiedades del tablero.
(define (tablero-agregar-propiedad t nueva-propiedad)
  (tablero
   (cons nueva-propiedad (tablero-propiedades t))
   (tablero-suerte t)
   (tablero-comunidad t)
   (tablero-especiales t)))

;; Agrega una carta de suerte al tablero
;; Dom: tablero (list) x nueva-carta (any)
;; Rec: tablero (nuevo) 
;; Tipo de recursión: No aplica
;; Descripción: Agrega una nueva carta de suerte a la lista de suerte del tablero.
(define (tablero-agregar-suerte t nueva-carta)
  (tablero
   (tablero-propiedades t)
   (cons nueva-carta (tablero-suerte t))
   (tablero-comunidad t)
   (tablero-especiales t)))

;; Agrega una carta de comunidad al tablero
;; Dom: tablero (list) x nueva-carta (any)
;; Rec: tablero (nuevo) 
;; Tipo de recursión: No aplica
;; Descripción: Agrega una nueva carta de comunidad a la lista de comunidad del tablero.
(define (tablero-agregar-comunidad t nueva-carta)
  (tablero
   (tablero-propiedades t)
   (tablero-suerte t)
   (cons nueva-carta (tablero-comunidad t))
   (tablero-especiales t)))

;; Agrega una casilla especial al tablero
;; Dom: tablero (list) x nueva-casilla (any)
;; Rec: tablero (nuevo) 
;; Tipo de recursión: No aplica
;; Descripción: Agrega una nueva casilla especial a la lista de casillas especiales del tablero.
(define (tablero-agregar-especial t nueva-casilla)
  (tablero
   (tablero-propiedades t)
   (tablero-suerte t)
   (tablero-comunidad t)
   (cons nueva-casilla (tablero-especiales t))))

(provide
 tablero
 tablero-propiedades
 tablero-suerte
 tablero-comunidad
 tablero-especiales
 tablero-agregar-propiedad
 tablero-agregar-suerte
 tablero-agregar-comunidad
 tablero-agregar-especial)
