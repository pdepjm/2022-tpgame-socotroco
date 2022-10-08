object reservaNatural{
	var property habitats = []
	
	method habitatMayorBiomasa() = habitats.max({habitat => habitat.biomasaTotal()})
	
	method biomasaTotal() = habitats.sum({habitat => habitat.biomasaTotal()})
	
	method habitatsSinEquilibrio() = habitats.filter({habitat => !habitat.estaEquilibrado()})
	
	method estaEnTodos(especie) =
		habitats.all({habitat => habitat.contieneEspecie(especie)})
}

class Habitat{
	var property flora = []
	var property fauna = []
	
	
	method floraYFauna() = flora + fauna
	
	method biomasaTotal() = 
		self.floraYFauna().sum({x => x.biomasa()})
		
	method estaEquilibrado() =
		self.cantEjemplaresGrandes() < self.cantEjemplaresPequenos() / 3 and self.hayAlgunoVivo()
	
	method cantEjemplaresGrandes() =
		self.floraYFauna().count({x => x.esGrande()})
	
	method cantEjemplaresPequenos() =
		self.floraYFauna().count({x => x.esChico()})
	
	method hayAlgunoVivo() =
		self.floraYFauna().any({x => x.vivo()})
	
	method contieneEspecie(especie) =
		self.floraYFauna().contains(especie)
		
	method incendio(){
		flora.filter({planta => planta.esChico()}).forEach({planta => planta.morir()})
		flora.filter({planta => planta.esGrande()}).forEach({planta => planta.altura(planta.altura() - 5)})
		fauna.filter({animal => animal.corre() and !animal.esMediano()}).forEach({animal => animal.morir()})
		fauna.filter({animal => animal.inmovil()}).forEach({animal => animal.morir()})
		fauna.forEach({animal => animal.peso(animal.peso() * 0.9)})
	}
	
	
		
	
}

class Planta{
	var property altura
	var property especie
	var property vivo = true
	
	method biomasa() = (altura*2).min(50)
	
	method morir(){vivo = false}
	
	method esChico() = altura < 10
	method esGrande() = !self.esChico()
}

class Animal{
	var property peso
	var property especie
	var property vivo = true
	
	method biomasa() = peso**2 / especie.coeficiente()
	
	method morir(){vivo = false}
	
	method esChico() = peso < especie.pesoReferencia() / 2
	method esGrande() = peso > especie.pesoReferencia() * 2
	method esMediano() = !self.esChico() and !self.esGrande()
	
	method nada() = especie.formaLocomocion() == nada
	method vuela() = especie.formaLocomocion() == vuela
	method corre() = especie.formaLocomocion() == corre
	method inmovil() = especie.formaLocomocion() == inmovil
}

// Objeto para cada especie

class EspecieAnimal{
	var property formaLocomocion
	var property pesoReferencia
	var property coeficiente
}

class EspeciePlanta{
	
}

class FormaLocomocion{
	
}

// FORMAS DE LOCOMOCION

const nada = new FormaLocomocion()
const vuela = new FormaLocomocion()
const corre = new FormaLocomocion()
const inmovil = new FormaLocomocion()


// ALGUNOS EJEMPLOS

// HABITATS

const llanura = new Habitat(flora = [girasol], fauna = [cebra])
const oceano = new Habitat(flora = [], fauna = [delfin])


// ANIMALES

const acuatico = new EspecieAnimal(formaLocomocion = nada, pesoReferencia = 10000, coeficiente = 1)
const cebraloide = new EspecieAnimal(formaLocomocion = corre, pesoReferencia = 40, coeficiente = 2)

const delfin = new Animal(peso = 10, especie = acuatico)
const cebra = new Animal(peso = 30, especie = cebraloide)

// PLANTAS

const girasolus = new EspeciePlanta()
const palmeritus = new EspeciePlanta()

const girasol = new Planta(altura = 5, especie = girasolus)




