class Parcela {
	var property ancho
	var property largo
	var property hsDeSolRecibidas
	var plantas
	method plantas(){
		return plantas
	}
	method cantidadDePlantas(){
		return plantas.size()
	}
	method superficie(){
		return self.ancho() * self.largo()
	}
	method cantidadMaximaTolerada(){
		if(self.ancho() > self.largo()){
			return (self.superficie() / 5)
		}else{
			return (self.superficie() / 3) + self.largo()
		}
	}
	method tieneComplicaciones(){
		return (self.plantas().map({planta => planta.hsDeSolToleradas()})).any({cant => cant < self.hsDeSolRecibidas()})
	}
	method plantarUnaPlanta(unaPlanta){
		if(self.superaCantidadMaxima() && ((self.hsDeSolRecibidas() + 2 ) > unaPlanta.hsDeSolToleradas())){
			plantas.add(unaPlanta)
		}else{
			error.throwWithMessage("No se puede agregar la planta, no cumple las precondiciones")
		}
	}
	method superaCantidadMaxima(){
		return self.cantidadMaximaTolerada() < plantas.size()
	}
	method porcentajeDeBienAsociadas(){
		return (self.plantas().filter({planta => self.leVaBien(planta)}).size() * 100) / self.plantas().size()
	}
	method leVaBien(unaPlanta){return true}
}
class ParcelaEcologica inherits Parcela{
	override method leVaBien(unaPlanta){
		return self.tieneComplicaciones() && unaPlanta.parcelaIdeal(self)
	}
}
class ParcelaIndustrial inherits Parcela{
	override method leVaBien(unaPlanta){
		return (self.plantas().size()<=2) && unaPlanta.esFuerte()
	}
}