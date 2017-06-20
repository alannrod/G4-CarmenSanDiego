package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.Dummy.CarmenSan10Dummy

class CasoAppModel {
	private Caso caso
	
	new () {
		caso= new CarmenSan10Dummy().caso
	}
	
	
	def titulo ()
	{
		caso.objetoDelRobo
	}
	
	def descripcion()
	{
		caso.reporteDelActoCriminal
	}
}
