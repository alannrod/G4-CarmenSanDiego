package edu.ui.domain.CarmenSan10


class Banco extends LugarDeInteres {
	
	new(){
		nombre = "Banco"
	}
	
	override pistaDelLugar(Caso caso, LugarDeInteres unLugar, Pais paisActual) {
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.pistaDeSusCaracteristicas + " " + caso.responsable.pistaDeSeniasParticulares
		// 1 pais destino								// 1 señas particulares
	}
	
}
