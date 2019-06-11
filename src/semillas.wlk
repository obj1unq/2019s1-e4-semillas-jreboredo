class Semillas {

	const property anoDeObtencion
	var property altura

	method hsDeSolToleradas() {
		return 0
	}

	method esFuerte() {
		return self.hsDeSolToleradas() > 10
	}

	method daNuevasSemillas() {
		return self.esFuerte()
	}
	method obtencionReciente(){
		return (self.anoDeObtencion() > 2007)
	}

}

class Menta inherits Semillas {

	override method hsDeSolToleradas() {
		return 6
	}

	override method daNuevasSemillas() {
		return self.altura() > 0.4
	}

	method espacioOcupado() {
		return self.altura() * 3
	}
	method parcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}

}

class Soja inherits Semillas{
	override method hsDeSolToleradas(){
		if(self.altura() < 0.5){
			return 6
		}else if(self.altura() < 1){
			return 7
		}else{
			return 9
		}
	}
	override method daNuevasSemillas(){
		return (self.obtencionReciente() && (self.altura() > 1))
	}
	method espacioOcupado(){return altura/2}
	method parcelaIdeal(unaParcela){
		return unaParcela.hsDeSolRecibidas() == self.hsDeSolToleradas()
	}
}

class Quinoa inherits Semillas{
	var property hsDeSolToleradas
	method espacioOcupado() {return 0.5	}
	override method daNuevasSemillas(){return anoDeObtencion < 2005}
	method parcelaIdeal(unaParcela){
		return unaParcela.plantas().map({planta => planta.altura()}).all({alturas => alturas <= 1.5})
	}
}

class SojaTrans inherits Soja{
	override method daNuevasSemillas(){return false}
	override method parcelaIdeal(unaParcela){
		return unaParcela.cantidadMaximaTolerada() == 1
	}
}
class Hierbabuena inherits Menta{
	override method espacioOcupado() {return (self.altura() * 3) * 2}
}
