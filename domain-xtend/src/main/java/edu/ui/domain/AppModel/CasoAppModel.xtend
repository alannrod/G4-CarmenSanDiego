package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.Dummy.CarmenSan10Dummy
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CasoAppModel {
	Caso caso
	private CarmenSan10Dummy datos
	
	new () {
		datos= new CarmenSan10Dummy()
		caso = datos.caso
	}
	
	
	def titulo ()
	{
		caso.objetoDelRobo
	}
	
	def descripcion()
	{
		caso.reporteDelActoCriminal
	}
	
	def dummy() {
		datos
	}
	
}
