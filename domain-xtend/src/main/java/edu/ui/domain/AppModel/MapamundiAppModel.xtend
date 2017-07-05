package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.Repo.RepoMapamundi
import java.io.Serializable
import java.util.List
//import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.model.ObservableUtils
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Accessors
@Observable
class MapamundiAppModel implements Serializable{
	
	Pais itemSeleccionado
	List<LugarDeInteres> lugares
	
	/**
	 * Todos los application model deben anotarse con @Observable.
	 * También es conveniente que implementen la interfaz Serializable.
	 */
	
	new() {}
	
	def RepoMapamundi getPaisesRepo() 
	{
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def List<Pais> getTodosLosPaises(){
		paisesRepo.objects
	}
	
	def void setTodosLosPaises(List<Pais> paises) {}
	

	def getNombreCaracteristicas() {}
	
	def List<Pais> getTodasLasConexiones() {
		itemSeleccionado.paisesConexionAerea
	}
	
	def void setTodasLasConexiones(List<Pais> paises) {}
	
	def List<String> getNombreCoxiones() {
		itemSeleccionado.paisesConexionAerea.map[p| p.nombrePais]
	}
	
	def void setNombreCoxiones(List<String> nombresPaises) {}
	
	def void search() {
		paisesRepo.search(itemSeleccionado.nombrePais)
	}
		
	
	def eliminarPaisSeleccionado() {
		getPaisesRepo().delete(itemSeleccionado)
		this.search()
		itemSeleccionado = null
		ObservableUtils.firePropertyChanged(this,"todosLosPaises", todosLosPaises)
	}
	
}