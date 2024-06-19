import pacientes.*

class Aparato{
	const property color = blanco
}

class Magneto inherits Aparato{
	var imantacion = 800
	
	method disminuirDolor(persona) = persona.dolor() * 0.1
	method aumentarFortaleza(persona) = 0
	
	method puedeUsar(persona) = true
	
	method mantenimiento(){imantacion += 500}
	method desgastar(persona){imantacion -= 1}
	method necesitaMantenimiento() = imantacion < 100
}

class Bicicleta inherits Aparato{
	var tornillosDesajustados = 0
	var aceitePerdido = 0
	
	method disminuirDolor(persona) = 4
	method aumentarFortaleza(persona) = 3
		
	method puedeUsar(persona) = persona.edad() >= 8
	
	method mantenimiento(){
		tornillosDesajustados = 0
		aceitePerdido = 0
	}
	method desgastar(persona){
		if (persona.dolor()>30) tornillosDesajustados += 1
		if (persona.edad().between(30,50)) aceitePerdido += 1
	}
	method necesitaMantenimiento() = tornillosDesajustados >= 10 or aceitePerdido >= 5 
	
}

class Minitramp inherits Aparato{
	method disminuirDolor(persona) = 0
	method aumentarFortaleza(persona) = persona.edad() * 0.1
	
	method puedeUsar(persona) = persona.dolor() < 20
	
	method mantenimiento(){}
	method desgastar(persona){}
	method necesitaMantenimiento() = false
}

object centro{
	const aparatos = []
	const pacientes = []
	
	method colorAparatos() = aparatos.map({a => a.color()}).asSet()
	method pacientesMenores() = pacientes.count({ p => p.edad() < 8 })
	
	method pacientesSinSesion() = pacientes.count({ p => !p.puedeRealizarRutina() })
	
	method optimasCondiciones() = aparatos.all({ a => !a.necesitaMantenimiento() })
	
	method estaComplicado() = self.cantAparatosAveriados() > (aparatos.size() / 2)

	method cantAparatosAveriados() = aparatos.count({ a => a.necesitaMantenimiento() })
	
	method visitaTecnica(){
		aparatos.forEach({ a =>
			a.mantenimiento()
		})
	}
}

object blanco{}
object rojo{}
object verde{}
object negro{}