#lang racket
;;; TDA Carta

;; Constructor de carta
;; Dom: id (num) x tipo (simbolo) x descripcion (string) x accion (simbolo o funcion)
;; Rec: carta (list)
;; Tipo de recursión: No aplica
;; Descripción: Crea una carta representada como una lista con su id, tipo, descripción y acción asociada.
(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))

(provide carta)
