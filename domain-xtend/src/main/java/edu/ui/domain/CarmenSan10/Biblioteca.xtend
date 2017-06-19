package edu.ui.domain.CarmenSan10

class Biblioteca extends LugarDeInteres{
	
	new(){
		nombre = "Biblioteca"
	}
	
	override pistaDelLugar(Caso caso, LugarDeInteres unLugar, Pais paisActual) {
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.pistaDeSusCaracteristicas + " " + caso.responsable.pistaDeSeniasParticulares +  " " + informacionAdicional(caso, 50)
		// 1 pais destino								// 1 señas particulares				         		// 50% 1 hobbies
	}
		
}
