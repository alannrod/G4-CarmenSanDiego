package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Repo.RepoVillanos
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import java.io.Serializable
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ExpedienteAppModel implements Serializable {
	//private Expediente expediente
	Villano selectedVillano
	
	new(){}
	
	def getNombreCaso() {
		
	}
	
	def RepoVillanos getVillanosRepo() 
	{
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
	def List<Villano> getTodosLosVillanos() {
		villanosRepo.objects
	}
	
	def void setTodosLosPaises(List<Villano> paises){
		
	}
	
	def search() {
		villanosRepo.search(selectedVillano.nombre)
	}
	
	def void setTodosLosVillanos(List<Villano> villanos) {}
	
	
	
}