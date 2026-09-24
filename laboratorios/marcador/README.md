# Laboratorio Marcador Deportivo
**Estudiante:** Sebastián André Orozco Orozco
**Carné:** 202308067
**Curso:** Programación de Dispositivos Móviles

## Capturas de Funcionamiento

equipo ganador
<img width="1012" height="747" alt="ganar" src="https://github.com/user-attachments/assets/6fded45f-dd04-4e9e-95da-f4a57921f052" />


empate 
<img width="1031" height="762" alt="empate" src="https://github.com/user-attachments/assets/ed13498c-8c47-41d3-bc9a-c7e031c529ab" />


## Comprensión de Estado Local
**¿Qué hace setState cuando presiona un botón y qué ocurriría si cambia los puntos sin llamarlo?**

Cuando se presiona un botón, `setState` actualiza el valor de la variable en memoria e inmediatamente notifica al framework de Flutter que el estado cambio. Esto obliga a Flutter a volver a ejecutar el método `build()` para redibujar la pantalla con los nuevos puntos.


Si se cambian los puntos matemáticamente sin envolver la operación en un `setState`, la variable en memoria sí se actualizaría correctamente, pero la interfaz gráfica quedaría congelada mostrando la puntuación anterior, ya que Flutter nunca recibiría la orden de refrescar la pantalla.
