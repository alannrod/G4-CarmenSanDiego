package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElPaisYaFueAgregadoException
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Accessors
@Observable
class Mapamundi {
	
	List<Pais> paises
	int secuencia = 1
	
	new() {
		paises = new ArrayList<Pais> // dummy for XTrest
	}	
	
	def buscarPais(String nombreDelPaisABuscar) {
		
		paises.filter[pais | pais.nombrePais == nombreDelPaisABuscar].toList
		//paises.findFirst[pais | pais.nombrePais == nombreDelPaisABuscar]
		
	}
	
	def borrarPais(Pais paisABorrar) {
		paises.remove(paisABorrar)
	}
	
	def agregarPais(Pais paisAgregar) {
		paises.add(paisAgregar)
	}
	
	def agregarPaisSiPuede(Pais paisAgregar)
	{
		if (! elPaisYaEstaAgregado(paisAgregar))
			agregarPais(paisAgregar)
		else
			throw new ElPaisYaFueAgregadoException("No se puede agregar el mismo pais dos veces")
	}
	
	private def elPaisYaEstaAgregado(Pais paisAgregar) {
		paises.exists[pais | pais.nombrePais == paisAgregar.nombrePais]
	}
	
	def void setPaisMini(Pais mini) {
		
		mini.id = secuencia
		paises.add(mini)
		secuencia++
	}
	
	def eliminarPaisMini(int id) {
		paises.removeIf[ it.id == id ]
	}
	
	def getPais(int identi) {
		paises.findFirst[ id == identi]
	}
	
}
