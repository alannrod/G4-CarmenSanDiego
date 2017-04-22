package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import edu.ui.domain.Exceptions.YaExisteLaSeniaParticularException
import edu.ui.domain.Exceptions.YaExisteElHobbieException
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Villano extends Ocupante {
	// extends Entity
	// @TransactionalAndObservable deberia estar aca? 
	// 		creo q en principio si
	
	String nombre
	String sexo
	List<String> seniasParticulares
	List<String> hobbies
	LugarInteres  dondeMeEncuentro
	
	new () {}
	
	/** PROPÓSITO: Crea un Villano con un nombre, sexo, señas particulares y hobbies. 
	 * 
	 * @param unNombre Es el nombre que tendrá el Villano.
	 * @param unSexo Es el sexo que tendrá el Villano.
	 * @param variasSenias Son las señas que caracterizan al Villanos.
	 * @param variosHobbies Son los hobbies que tendrá el Villano.
	 */
	new(String unNombre, String unSexo, ArrayList<String> variasSenias, ArrayList<String> variosHobbies, LugarInteres destinoFinal) 
	{
		nombre = unNombre
		sexo = unSexo
		seniasParticulares = variasSenias
		hobbies = variosHobbies
		dondeMeEncuentro= destinoFinal
	}
	
	/**
	 * PROPÓSITO: Pregunta si el Villano tiene el mismo nombre que se especifica por parámetro.
	 * 
	 * @param unNombre Es el nombre por el cual se hace la verificación
	 */
	def tieneElMismoNombreQue(String unNombre) 
	{
		nombre == unNombre
	}
	
	//como verifico si esta en el lugar ese? es una variable del villano??
	override responderAlDetective(LugarInteres unLugar) 
	{
		if (! seEncuentraEnVillanoEnElLugar(unLugar))
			"CUIDADO DETECTIVE!! Ah estado a punto de caer en una trampa... La persona que busca está en la ciudad"
		else
			"ALTO!! Detengase"
	}
	
	def Boolean seEncuentraEnVillanoEnElLugar(LugarInteres lugar)
	// Ademas de recibir un lugar, debería recibir el País de donde pertenece
	// los lugares no conocen a que pais pertenecen??
	{
		dondeMeEncuentro == lugar
	}
	
	/*Los villanos si están en el país pero no en el lugar al que visitamos intentan matarnos y fallan.
	 * En ese caso encontramos en cada uno de los LugarInteres un villano, el mismo
	 */
	
	/** PROPÓSITO: Agrega un hobbie al villano.
	 * 
	 * @param hobbie Es el hobbie al que se le agrega al villano.
	 */
	def agregarHobbie (String hobbie)
	{
		hobbies.add(hobbie)
	}
	
	/** PROPÓSITO: Agrega un hobbie al Villano solo si no fue agregada anteriormente.
	 * @param hobbie Es el hobbie que se quiere intentar agregar.
	 * */
	def agregarHobbieSiPuede (String hobbie)
	{
		if (! tieneElHobbie(hobbie))
			agregarHobbie (hobbie)
		else
			throw new YaExisteElHobbieException ("El hobbie ya fue cargado anteriormente")
	}
	
	/** PROPÓSITO: Pregunta si el Villano ya tiene el hobbie especificada por parámetro.
	 * @param hobbie Es el hobbie por el que se hace la verificación.
	 */
	def tieneElHobbie(String hobbie) 
	{
		hobbies.contains(hobbie)
	}
	
	/** PROPÓSITO: Saca un hobbie al villano.
	 * 
	 * @param hobbie Es el hobbie al que se le quita al villano.
	 */
	def borrarHobbie (String hobbie)
	{
		hobbies.remove(hobbie)
	}
	
	/** PROPÓSITO: Borra una senia particular del villano.
	 * 
	 * @param senia Es la senia que se le agrega al villano.
	 */
	def borrarSenia(String senia)
	{
		seniasParticulares.remove(senia)
	}
	
	/** PROPÓSITO: Agrega una senia particular al villano.
	 * 
	 * @param senia Es la senia que se le quita al villano.
	 */
	def agregarSenia(String senia)
	{
		seniasParticulares.add (senia)
	}
	
	/** PROPÓSITO: Agrega una senia particular al Villano solo si no fue agregada anteriormente.
	 * @param senia Es la senia particular que se quiere intentar agregar.
	 * */
	def agregarSeniaSiPuede (String senia)
	{
		if (! existeLaSenia(senia))
			agregarSenia(senia)
		else
			throw new YaExisteLaSeniaParticularException("La seña particular ya se encuentra agregada")
	}
	
	/** PROPÓSITO: Pregunta si el Villano ya tiene la senia particular especificada por parámetro.
	 * @param senia Es la senia particular por la que se hace la verificación.
	 * 
	 */
	def existeLaSenia(String senia) 
	{
		seniasParticulares.contains(senia)
	}
	
	override crearMiTipo(Pais p, Caso c) {
		if (p.esElFinalDelRecorrido(c.planDeEscape)){
			return this
		}
	}
	
}
