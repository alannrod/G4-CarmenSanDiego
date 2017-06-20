package edu.ui.domain.CarmenSan10

import edu.ui.domain.CarmenSan10.LugarDeInteres

class Embajada extends LugarDeInteres {
	
	new(){
		nombreLugar = "Embajada"
	}
	
	override pistaDelLugar(Caso caso, LugarDeInteres unLugar, Pais paisActual) {
	// 2 pistas del destino del villano
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.dar2PistaDeSusCaracteristicas
	}
	
	
}