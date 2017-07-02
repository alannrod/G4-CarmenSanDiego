package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.LugarDeInteres
import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.CarmenSan10.Detective
import java.util.List
import edu.ui.domain.CarmenSan10.Biblioteca
import edu.ui.domain.CarmenSan10.Club
import edu.ui.domain.CarmenSan10.Embajada
import edu.ui.domain.CarmenSan10.Banco

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente
	
	Detective doc
	Caso caso
	
	new ()
	{
		/**
		 * Mapamundi - Paises
		 */	
		mapamundi = new Mapamundi
		val biblioteca = new Biblioteca ()
		val club = new Club ()
		val embajada = new Embajada()
		val banco = new Banco()
		val lugares01 = new ArrayList<LugarDeInteres>() 
		lugares01.add(embajada)
		lugares01.add(biblioteca)
		lugares01.add(club)
		
		val lugares02 = new ArrayList<LugarDeInteres>() 
		lugares02.add(embajada)
		lugares02.add(banco)
		lugares02.add(club)
		
		val lugares03 = new ArrayList<LugarDeInteres>() 
		lugares03.add(embajada)
		lugares03.add(biblioteca)
		lugares03.add(banco)
		
		val lugares04 = new ArrayList<LugarDeInteres>() 
		lugares04.add(banco)
		lugares04.add(biblioteca)
		lugares04.add(club)
		
		
			
		val venezuela = new Pais("Venezuela",lugares01, new ArrayList<Pais>())
		venezuela.caracteristicaPais = #[new Caracteristicas("Maduro a la cabeza"), new Caracteristicas("Su lider cosmico supremo habla con los pajaritos")]
		
		
		val brazil = new Pais("Brazil",lugares02, #[venezuela]) => [
			caracteristicaPais = #[new Caracteristicas("Joga bonito"), new Caracteristicas("Su bandera es verde y amarilla")]
		]
		
		val argentina = new Pais("Argentina", lugares03, #[venezuela, brazil]) => [
			caracteristicaPais = #[new Caracteristicas("Bandera azul y blanca"), new Caracteristicas("Su arbol nacional es el Ceibo")]
		]
		
		val uruguay = new Pais("Uruguay", lugares04, #[venezuela, brazil, argentina]) => [
			caracteristicaPais = #[new Caracteristicas("A toda hora mate :D"), new Caracteristicas("Es una una provincia de Argentina")]
		]
		
		
		mapamundi.setPaisMini(venezuela) // id = 1
		mapamundi.setPaisMini(brazil)	 // id = 2
		mapamundi.setPaisMini(argentina) // id = 3
		mapamundi.setPaisMini(uruguay)	 // id = 4
		
		
		/**
		 * Expediente - Villanos
		 */
		
		val seniasParticularesCS = new ArrayList<Caracteristicas>()
		val seniaCS1 = new Caracteristicas("Pelo rojo")
		val seniaCS2 = new Caracteristicas("Maneja un convertible")
		seniasParticularesCS.add(seniaCS1)
		seniasParticularesCS.add(seniaCS2)
		
		val hobbiesCS = new ArrayList<Caracteristicas>()
		val hobbieCS = new Caracteristicas("Juega tenis")
		hobbiesCS.add(hobbieCS)
		
		//val villanoCS = new Villano("Carmen Sandiego", "Femenino", seniasParticularesCS, hobbiesCS)
		
		val villanoCS = new Villano => [
			nombre = "Carmen Sandiego"
			sexo = "Femenino"
			seniasParticulares = seniasParticularesCS
			hobbies = hobbiesCS
		]
		
		val seniasParticularesII = new ArrayList<Caracteristicas>()
		val seniaII1 = new Caracteristicas("Pelo rubio")
		val seniaII2 = new Caracteristicas("Maneja un descapotable")
		seniasParticularesII.add(seniaII1)
		seniasParticularesII.add(seniaII2)
		
		val hobbiesII = new ArrayList<Caracteristicas>()
		val hobbieII = new Caracteristicas("Juega tenis")
		hobbiesII.add(hobbieII)
		
		val villanoII = new Villano("Ivan Igorovich", "Masculino", seniasParticularesII, hobbiesII)
		
		expediente = new Expediente
		expediente.agregarVillano(villanoCS)
		expediente.agregarVillano(villanoII)
		
		
		/**
		 * Caso
		 */
		 
		 val reporteDelCrimen = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective es desifrar el responsable de tal crímen y apresarlo."
		 val objetoRobado = "Tumba del faraón"
		 
//		 caso = new Caso() => 
//		 [
//		 	id = 1
//		 	responsable = villanoCS
//		 	planDeEscape = #[argentina, brazil, venezuela]
//		 	reporteDelActoCriminal = reporteDelCrimen
//		 	objetoDelRobo = objetoRobado
//		 	paisDelRobo = argentina
//		 	lugarDelVillano = lugarDondeSeEncuentraElVillano(planDeEscape.last)
//		 	lugaresDelPlanEscape = lugaresDelRecorrido(planDeEscape)
//		 	pistasDelPlanDeEscape = new ArrayList<List<String>>()
//		 ]
//		 caso.pistasDelRecorrido(caso.planDeEscape) 
		 
//		 val plan = new ArrayList<Pais>()
//		 plan.add(argentina)
//		 plan.add(brazil)
//		 plan.add(venezuela)
		 caso = new Caso(villanoCS,	#[argentina, brazil, venezuela], reporteDelCrimen, objetoRobado, argentina)
		 caso.pistasDelPlanDeEscape = caso.pistasDelRecorrido(#[argentina, brazil, venezuela])
//		 ver que otra cosa puede ser... o dejar de usar
		 
		 /**
		  * Detective
		  */
		doc = new Detective()
		doc.recorrido.add(argentina)
		doc.ordenarArresto(villanoCS)

		
	}
	
	
}