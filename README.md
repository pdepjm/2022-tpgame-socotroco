# Nombre del juego (<- borrar y completar)

## Equipo de desarrollo

- Alguien
- Persona
- etc.

## Capturas

(agregar)

## Reglas de Juego / Instrucciones

(Escribirlas)

## Conceptos Teóricos

**Polimorfismo: ¿Cuáles son los mensajes polimórficos? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?**
El mensaje “colisionarConPersonaje()” es polimórfico ya que es entendido por cualquier subclase de la clase personaje (tanto “personaje1”, como “personaje”). Es implementado por todos los objetos que deben ejecutar un método al colisionar con un personaje, como los que pertenecen a las clases “placa”, “puerta”, “caja” y “pared”.

**Colecciones: ¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?**
Se utilizan colecciones para establecer el comportamiento de las placas. Al requerir que todas las placas deben estar presionadas para abrir la puerta, fue necesario utilizar la función “all()”.Este mensaje no tiene efecto ya que se utiliza para validar que todas las placas estén presionadas, sin provocar ningún efecto en ellas como cerrarlas o abrirlas.
También se utiliza el mensaje “forEach()” en las colecciones de paredes y de placas para ejecutar el método “addVisual()”. Este mensaje sí tiene efecto colateral.

**Clases: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?**
Se utiliza la clase “personaje” para modelar a los personajes con sus métodos necesarios como “moverA()” y “colisionarConPersonaje()”. A partir de esta clase se crearon las subclases “personaje1” y “personaje2” para establecer el comportamiento individual de cada uno de los dos personajes y no repetir lógica al establecer los métodos “moverA()” y “colisionarConPersonaje()” previamente establecidos en la clase “personaje”. Estas dos clases son instanciadas en el archivo “main.wlk” como constantes al ejecutar el programa, en donde se crean los objetos “personajeFuerte” y “personajeDebil”.

**Herencia: ¿Entre quiénes y por qué? ¿Por qué no? ¿Qué comportamiento es común y cuál distinto?**
Hay relaciones de herencia entre las clases “personaje1” y “personaje2” con la superclase “personaje”. Esto se debe a que ambas clases, “personaje1” y “personaje2”, deben heredar los métodos “moverA()” y “colisionarConPersonaje()”. El método “moverA()” es común a todas las subclases de “personaje”, mientras que “colisionarConPersonaje()”se sobrescribe en cada una de las subclases.

**Delegación de responsabilidades: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Qué tan fácil sería de modificar o extender?**
El método “colisionarConPersonaje()” se delega a las clases “placa”, “puerta”, “caja” y “pared”, los cuales requieren que se les pase por parámetro al objeto (personaje) con el que colisionan. Podrían crearse fácilmente nuevos objetos que puedan colisionar con personajes, siempre que estos entiendan el mensaje “colisionarConPersonaje()”.


## Diagrama

![Diagrama](diagram.png)

## Otros

- Curso/Facultad
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado
