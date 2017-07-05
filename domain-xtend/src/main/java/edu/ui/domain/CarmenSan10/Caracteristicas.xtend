package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Caracteristicas {
	
	String nombre = ""
	
	new() {}
	
	new(String caracteristica) 
	{
		nombre = caracteristica
	}
	


}