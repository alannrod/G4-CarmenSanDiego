package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
//import java.util.Random
import java.util.List

@Observable
@Accessors
class Informante extends Ocupante {

	new(){
		// agregue nombre al informante cuando se crea uno nuevo
		nombre = "Informante"
	}	

	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual){	
		unLugar.pistaDelLugar(caso, unLugar, paisActual)
	}
	
	
	
	override actualizar(List<Pais> ps, Pais p, Villano v) 
	{

	}
	
}
