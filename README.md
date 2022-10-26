# Pirámide de Maslow

## Equipo de desarrollo

- Jeremias Salomon
- Juan Ignacio Borda
- Ignacio Crusoe
- Facundo Malnero

## Capturas

![Nivel 1](screenshots/captura1.png)
![Nivel 2](screenshots/captura2.png)

## Reglas de Juego / Instrucciones

El juego consiste en hacer llegar a dos personajes, uno fuerte y otro inteligente, a uno de los objetos (un pancho) que les permitirá satisfacer el primer nivel de necesidades de la pirámide de Maslow. Para ello deben trabajar en conjunto y logrear abrir la puerta que los dirige hacia ese objetivo, debiendo pasar por diversos obstáculos. Al perder las 3 vidas que tienen, termina el juego. 
- Las *paredes* no pueden ser atravesadas por ningún personaje.
- Los *pinches* le quitan una vida a cualquiera que pise sobre ellos. También hay *super pinches* que quitan de a dos vidas.

El *personaje inteligente* puede activar *códigos*, los cuales se activan únicamente por 4 segundos. Su movimiento se ve determinado por las flechas del tecado (←↑→↓).
El *personaje fuerte* puede mover *cajas*, las cuales pueden posicionarse sobre placas y ser utilizadas para permitirle al personaje inteligente pasar por pinches. Para moverse, este utiliza las teclas WASD.

Para poder abrir la puerta:
- Deben estar todos los códigos activados.
- Deben estar todas las placas presionadas.

## Conceptos Teóricos

**Polimorfismo: ¿Cuáles son los mensajes polimórficos? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?**

El mensaje “colisionarConPersonaje()” es polimórfico ya que es entendido por cualquier subclase de la clase personaje (tanto “personaje1”, como “personaje”). Es implementado por todos los objetos que deben ejecutar un método al colisionar con un personaje, como los que pertenecen a las clases “placa”, “puerta”, “caja” y “pared”, así como el objeto "objetoGanador".

También hay polimorfismo en el método "moverA(dirección)". No solamente los personajes entienden el mensaje "moverA()", sino que este se beneficia ya que los objetos con los que puede colisionar entienden el mensaje. De esta forma, los personajes le pueden enviar este mensaje al objeto de la posición a la que quieren moverse (en caso de haber un objeto en esa dirección y no poder ellos ocupar ese lugar) y este puede moverse o no dependiendo de si es una pared o una caja. El personaje implementa unicamente su método "moverA(dirección)", sin importarle cómo lo implementan los objetos con los que puede colisionar, solamente les envía el mesaje.

Otro caso de polimorfismo es el de los niveles, los cuales entienden los mensajes "reiniciarse()", "siguienteNivel()" y "configuracionInicial()". En este caso, es el gestor de niveles el que se aprovecha del polimorfismo, ya que los mensajes son entendidos por todos los niveles. Al gestor de niveles no le importa cómo se implementa el método, sino que le delega la responsabilidad al nivel actual.

Los niveles también se aprovechan del polimorfismo de los objetos con los que pueden colisionar los personajes, ya que para poder insertarlos en la configuración inicial del nivel, primero hay que crearlos. Para ello crea una lista de paredes, códigos, placas, cajas y pinches (una lista para cada clase de objeto), así como referencias al objeto ganador y a la puerta, y les envía a todos (con el método forEach) el mensaje "crear()". Es decir que le delega la responsabilidad a cada objeto de crearse a sí mismo.

Otro objeto con polimorfismo son los piches. Tanto los pinches como su subclase de super pinches entienden el mensaje "danio()". La única diferencia es que los super pinches sobreescriben el método para causar un daño de 2, en lugar de que sea de 1. Los pinches también aprovechan el polimorfismo de los personajes ya que le envían el mensaje "pincharseCon(self)" al personaje que los toca sin importar como implementan el método ni quién sea ese personaje. Podría, de esta forma, crearse un personaje al que no le pase nada al picharse, sin necesidad de realizar demasiadas modificaciones. Simplemente este personaje no le enviaría el mensaje "perderVida()" al gestor de niveles. 

**Colecciones: ¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?**

Se utilizan colecciones para establecer el comportamiento de las placas. Al requerir que todas las placas deben estar presionadas para abrir la puerta, fue necesario utilizar la función “all()”.Este mensaje no tiene efecto ya que se utiliza para validar que todas las placas estén presionadas, sin provocar ningún efecto en ellas como cerrarlas o abrirlas.
También se utiliza el mensaje “forEach()” en las colecciones de paredes y de placas para ejecutar el método “addVisual()”. Este mensaje sí tiene efecto colateral.

**Clases: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?**

Se utiliza la clase “personaje” para modelar a los personajes con sus métodos necesarios como “moverA()” y “colisionarConPersonaje()”. A partir de esta clase se crearon las subclases “personaje1” y “personaje2” para establecer el comportamiento individual de cada uno de los dos personajes y no repetir lógica al establecer los métodos “moverA()” y “colisionarConPersonaje()” previamente establecidos en la clase “personaje”. Estas dos clases son instanciadas en el archivo “main.wlk” como constantes al ejecutar el programa, en donde se crean los objetos “personajeFuerte” y “personajeDebil”.

**Herencia: ¿Entre quiénes y por qué? ¿Por qué no? ¿Qué comportamiento es común y cuál distinto?**

Hay relaciones de herencia entre las clases “personaje1” y “personaje2” con la superclase “personaje”. Esto se debe a que ambas clases, “personaje1” y “personaje2”, deben heredar los métodos “moverA()” y “colisionarConPersonaje()”. El método “moverA()” es común a todas las subclases de “personaje”, mientras que “colisionarConPersonaje()”se sobrescribe en cada una de las subclases.
También hay herencia entre los pinches y los superPinches, que modifican el comportamiento del método pincharA(personaje).

**Delegación de responsabilidades: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Qué tan fácil sería de modificar o extender?**

El método “colisionarConPersonaje()” se delega a las clases “placa”, “puerta”, “caja” y “pared”, los cuales requieren que se les pase por parámetro al objeto (personaje) con el que colisionan. Podrían crearse fácilmente nuevos objetos que puedan colisionar con personajes, siempre que estos entiendan el mensaje “colisionarConPersonaje()”.

Otro caso de delegación de responsabilidades es en el gestor de niveles, quien le delega la responsabilidad al nivel actual de configurarse a sí mismo. El gestor de niveles tampoco se encarga de reiniciar el nivel actual, sino que lo hacen los niveles. El gestor de niveles les envía el mensaje "reiniciarse()". Estos niveles a su vez le delegan a cada objeto que tienen la responsabilidad de crearse mediante el método "crear()". 


## Diagrama

![Diagrama](diagram.png)

## Otros

- UTN FRBA
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado
