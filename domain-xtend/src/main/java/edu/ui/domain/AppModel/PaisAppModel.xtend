package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.LugarDeInteres
import edu.ui.domain.CarmenSan10.Caracteristicas

@Accessors
@Observable
class PaisAppModel implements Serializable{
	
	String featureSelected
	Pais paisSelected
	Pais itemSeleccionado
	Caracteristicas nueva = new Caracteristicas
	
	new(Pais pais) {
		paisSelected = pais
	}
	
	def paisesConexionAerea() {
		paisSelected.paisesConexionAerea
	}
	
	def lugares() {
		paisSelected.lugares
	}
	
	def nombrePais() {
		paisSelected.nombrePais
	}
	
}