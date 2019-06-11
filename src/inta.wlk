import parcelas.*

object inta {
	var property parcelas = []
	
	method agregarParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	method promedioDePlantas(){
		return (self.cantidadDePlantasTotales() /self.cantidadDeParcelas())
	}
	method cantidadDeParcelas(){
		return self.parcelas().size()
	}
	method cantidadDePlantasTotales(){
		return self.parcelas().map({parcela => parcela.cantidadDePlantas()}).sum()
	}
	method cantidadDePlantasPorParcela(){
		return self.parcelas().map({parcela => parcela.cantidadDePlantas()})
	}
	method masAutosustentable(){
		return self.parcelasConMasDe4Plantas().max({parcela => parcela.porcentajeDeBienAsociadas()})
	}
	method parcelasConMasDe4Plantas(){
		return self.parcelas().filter({parcela => parcela.cantidadDePlantas() >= 4})
	}
}
