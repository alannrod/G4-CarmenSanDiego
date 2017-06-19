package edu.ui.domain.CarmenSan10;

import org.uqbar.commons.utils.TransactionalAndObservable;
import edu.ui.domain.CarmenSan10.LugarDeInteres;
import java.util.List;

@TransactionalAndObservable
public enum LugarDeInteres2 {

	BANCO("Banco"),BIBLIOTECA("Biblioteca"),CLUB("Club"),EMBAJADA("Embajada");
	
	//vacio?
	
	public String nombre;
	
	LugarDeInteres2(String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombreLugares() {
		return this.getNombre();
	}

}
