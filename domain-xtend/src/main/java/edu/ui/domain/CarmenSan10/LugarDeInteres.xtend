package edu.ui.domain.CarmenSan10
import org.uqbar.commons.utils.TransactionalAndObservable;
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@TransactionalAndObservable
@Accessors
abstract class LugarDeInteres {

	String nombre
	String pista
	
	
	def abstract String pistaDelLugar(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	
	def informacionAdicional(Caso caso, int porcentaje) 
	{
		var Random rnd = new Random
		var int adicional = rnd.nextInt(99)
		
		var respuesta = ""
		
		if (adicional > (porcentaje-1))
		{
			respuesta = pistaSobreHobbie(caso.responsable)
		}
		respuesta
	}
	
	def pistaSobreHobbie(Villano villano) 
	{
		villano.pistaDeHobbies
	}
}
