import aparatos.*

class Paciente{
	var edad
	var fortaleza
	var dolor
	const rutina = []
	
	method fortaleza() = fortaleza
	method dolor() = dolor
	method edad() = edad
	
	method usar(aparato){
		if(aparato.puedeUsar(self)){
			dolor -= aparato.disminuirDolor(self)
			fortaleza += aparato.aumentarFortaleza(self)
			aparato.desgastar(self)
		}else{
			self.error("El paciente no puede usar este aparato")
		}
	}
	
	method realizarRutina(){rutina.forEach({ aparato => self.usar(aparato)})}
	
	method puedeHacerRutina() = rutina.all({ aparato => aparato.puedeUsar(self)})
}

class Resistente inherits Paciente{
	override method realizarRutina(){
		super()
		fortaleza += rutina.size()
		}  
}

class Caprichoso inherits Paciente{
	override method puedeHacerRutina() = super() and rutina.any({a => a.color() == rojo})
	
	override method realizarRutina(){
		super()
		super()
	}
}

class RapidaRecuperacion inherits Paciente{
		override method realizarRutina(){
		super()
		dolor = dolor - recuperacion.recuperacionAdicional()
		}
}

object recuperacion{
	var property recuperacionAdicional = 3
}
