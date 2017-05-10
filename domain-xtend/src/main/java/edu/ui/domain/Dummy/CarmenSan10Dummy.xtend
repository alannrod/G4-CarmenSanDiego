package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.PaisSimple

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente
	
	new ()
	{	
		val miniPaises = new ArrayList<PaisSimple>() // ya se instacio en el new
		
		miniPaises.add(new PaisSimple(1, "Venezuela"))
		miniPaises.add(new PaisSimple(6, "Brazil"))
		miniPaises.add(new PaisSimple(7, "Argentina"))
				
		//mapamundi.setPaisMini(new PaisSimple(4, "gop"))
		
		mapamundi = new Mapamundi => [
			paisesMini = miniPaises
		]
		
		val seniasParticularesCS = new ArrayList<Caracteristicas>()
		val seniaCS1 = new Caracteristicas("Pelo rojo")
		val seniaCS2 = new Caracteristicas("Maneja un convertible")
		seniasParticularesCS.add(seniaCS1)
		seniasParticularesCS.add(seniaCS2)
		
		val hobbiesCS = new ArrayList<Caracteristicas>()
		val hobbieCS = new Caracteristicas("Juega tenis")
		hobbiesCS.add(hobbieCS)
		
		val villanoCS = new Villano("Carmen Sandiego", "Femenino", seniasParticularesCS, hobbiesCS) => [
			id = 3
		]
		
		val seniasParticularesII = new ArrayList<Caracteristicas>()
		val seniaII1 = new Caracteristicas("Pelo rubio")
		val seniaII2 = new Caracteristicas("Maneja un descapotable")
		seniasParticularesII.add(seniaII1)
		seniasParticularesII.add(seniaII2)
		
		val hobbiesII = new ArrayList<Caracteristicas>()
		val hobbieII = new Caracteristicas("Juega tenis")
		hobbiesII.add(hobbieII)
		
		val villanoII = new Villano("Ivan Igorovich", "Masculino", seniasParticularesII, hobbiesII) => [
			id = 2
		]
		
		val villanosDummy = new ArrayList<Villano>()
		villanosDummy.add(villanoCS)
		villanosDummy.add(villanoII)
		
		expediente = new Expediente => [
			villanos = villanosDummy
		]
		
	}
	
	def getPais(int identi) {
		mapamundi.paisesMini.findFirst[ id == identi]
	}
	
}