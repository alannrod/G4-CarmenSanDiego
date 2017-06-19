package edu.ui.domain.CarmenSan10


class Club extends LugarDeInteres {
	
	new(){
		nombre = "Club"
	}
	
	override pistaDelLugar(Caso caso, LugarDeInteres unLugar, Pais paisActual) {
		caso.responsable.dar2PistasSeniasParticulares + " " + informacionAdicional(caso, 70)
		// 2 señas particulares									// 70% 1 hobbie
	}
	
}
