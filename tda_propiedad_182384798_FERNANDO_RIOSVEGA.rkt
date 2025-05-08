#lang racket
;;; TDA Propiedad

;; Constructor de propiedad
;; Dom: id (int) x nombre (string) x precio (int) x renta (int) x dueno (any) 
;;      x casas (int) x esHotel (bool) x estaHipotecada (bool)
;; Rec: propiedad (list)
;; Tipo de recursión: No aplica
;; Descripción: Crea una propiedad con los parámetros especificados, incluyendo su ID, nombre, precio, renta, dueño, cantidad de casas, si es un hotel y si está hipotecada.
(define (propiedad id nombre precio renta dueno casas esHotel hipotecada)
  (list id nombre precio renta dueno casas esHotel hipotecada))

(provide propiedad)
