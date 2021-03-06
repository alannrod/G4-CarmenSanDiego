package edu.ui.domain.Repo

import org.uqbar.commons.model.CollectionBasedRepo
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate
import java.util.List
import org.uqbar.commons.model.UserException
import edu.ui.domain.CarmenSan10.LugarDeInteres
import edu.ui.domain.CarmenSan10.Caracteristicas

@Observable
class RepoMapamundi extends CollectionBasedRepo<Pais>{
	
	/**
	 *  Altas y bajas
	 */
	 
	 def Pais create(String pNombre, List<Caracteristicas> pFeature, List<LugarDeInteres> pLugar, List<Pais> pConection) {
	 	val pais = new Pais => [
	 		nombrePais = pNombre
	 		caracteristicaPais = pFeature
	 		lugares = pLugar
	 		paisesConexionAerea = pConection
	 		]
	 	this.create(pais)
	 	pais
	 }
	 
	override protected validateCreate(Pais pais) {
		pais.validar()
		validarPaisesDuplicados(pais)
	}
	
	def validarPaisesDuplicados(Pais pais) {
		val nombre = pais.nombrePais
		
		if(!search(nombre).isEmpty)
			throw new UserException("Ya existe un pais con el nombre: " + nombre )
	}
	
	def search(String nombre) {
		allInstances.filter[pais| this.match(nombre, pais.nombrePais)].toList
	}
	
	def match(Object nombre, Object pNombre) {
		if (nombre == null) {
			return true
		}
		if (pNombre == null) {
			return false
		}
		pNombre.toString.toLowerCase.contains(nombre.toString.toLowerCase)
	}
	
	def List<Pais> getPaises() {
		allInstances	
	}
		
	override def getEntityType() {
		typeof(Pais)
	}
	
	override def createExample() {
		new Pais()
	}
	
	override def Predicate<Pais> getCriterio(Pais arg0) {
		null
	}
	
}