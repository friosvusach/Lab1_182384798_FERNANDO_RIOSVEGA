;; Instrucciones de ejecución:
;;

;;1.	Abrir el archivo: Abrir el archivo script_base_182384798_FERNANDO_RIOSVEGA.rkt desde el IDE DrRacket en una version 8.16 o superior: 
;;2.	Correr el programa: Ejecutar el programa con el botón Run desde DrRacket
;;3.	Visualizar la simulación: Visualizar la simulación de un juego de monopoly, los turnos, movimientos de jugador, tiro de dados, entre otros, en la consola de interacción de DrRacket
;;4.	Identificar la finalización del juego: El juego finaliza cuando un jugador entra en bancarrota. La función jugador-esta-en-bancarrota verifica si esto ocurre.
;;5.	Testeo de nuevas simulaciones: Puede modificar el contenido del archivo script_base_182384798_FERNANDO_RIOSVEGA.rkt  para evaluar nuevos escenarios de juego:

;;Ejemplo de modificación:
;; A)	; Carlos construye casa en una propiedad que ya posee
;; (define g3.5 (juego-jugar-turno g3 (juego-lanzar-dados 0 0) #t #f #f #f))
;; g3.5
;; B)	Utilice (juego-lanzar-dados 0 0) para simular un turno sin movimiento
;; C)	#t activar la construcción de casa si se cumplen las condiciones

;; Requisitos:
;; - Racket version 8.16 o superior.
;; - No es necesario instalar librerías externas.