package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Caso
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Observable
@Accessors
class LugarInteresAppModel 
{
	LugarDeInteres lugar
	Caso caso
	Detective detective
	
	new(){}
	
	new(LugarDeInteres lugar, Caso elCaso)
	{
		this.lugar = lugar
		this.caso = elCaso
	}
	
	new(LugarDeInteres interes, Caso unCaso, Detective unDetective) {
		this.lugar = interes
		this.caso = unCaso
		this.detective = unDetective
	}
	
	def nombreDelCaso()
	{
		caso.objetoDelRobo
	}
	
	def nombreDelLugar()
	{
		lugar.nombreLugar
	}
	
	def preguntarAlOcupante()
	{
		lugar.responderAlDetective(detective.ubicacionActual, caso)
	}

	def ordenDeArresto()
	{
		detective.ordenDeArresto
	}
	
	def esElFinDelJuego() 
	{
		caso.esElFinDelCaso(detective.ubicacionActual) && lugar.seEncuentraElVillano(detective.ubicacionActual)
	}
	def habemusVillano(){
		this.lugar.seEncuentraElVillano(detective.ubicacionActual)
	}
	
}