package edu.ui.domain.Repo

import org.uqbar.commons.model.CollectionBasedRepo
import edu.ui.domain.CarmenSan10.Villano
import org.apache.commons.collections15.Predicate
import java.util.List
import edu.ui.domain.CarmenSan10.Caracteristicas

class RepoVillanos extends CollectionBasedRepo<Villano>{
	
	def Villano create(String nombreVi, String sexoVi, List<Caracteristicas> senias, List<Caracteristicas> hobbiesVi) {
		// devolver un villano no va servir en el bootstrap
		val villano = new Villano => [
			nombre = nombreVi
			sexo = sexoVi
			seniasParticulares = senias
			hobbies = hobbiesVi
		]
		this.create(villano)
		villano
	}
	
	def List<Villano> getVillanos() {
		allInstances
	}
	
	override createExample() {
		new Villano
	}
	
	override def Class<Villano> getEntityType() {
		typeof(Villano)
	}
	
	override def Predicate<Villano> getCriterio(Villano example) {
		null
	}
	
	def search(String nombre) {
		allInstances.filter[villano| this.match(nombre, villano.nombre)].toList
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
	
}