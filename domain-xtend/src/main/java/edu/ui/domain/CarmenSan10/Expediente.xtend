package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException
import org.uqbar.commons.utils.Observable
import edu.ui.domain.Exceptions.VillanoIncompletoException
import edu.ui.domain.Exceptions.FaltaAgregarSeniasParticulares
import edu.ui.domain.Exceptions.FaltaAgregarHobbiesException
import java.util.ArrayList

@Observable
@Accessors
class Expediente 
{
	private var List<Villano> villanos
	private var Integer secuencia = 1
	
	new()
	{
		villanos = new ArrayList<Villano>()
	}
	
	new(List<Villano> villanosACargar)
	{
		villanos = villanosACargar
	}
	
	/**
	 * @Propósito Agrega un Villano solo si no fue cargado anteriormente.
	 * @param VillanoAAgregar Es el Villano que se intenta agregar.
	 */
	def void agregarVillanoSiPuede (Villano villanoAAgregar)
	{
		if (! elVillanoYaExiste(villanoAAgregar.nombre))
			agregarVillano (villanoAAgregar)
		else
			throw new ElVillanoYaEstaCargadoException ("El villano ya existe en la base de datos")
	}
	
	/**
	 * @Propósito Pregunta si el villano existe.
	 * @param unNombre Es el nombre del Villano por el que se hace la verificacion.
	 */
	def elVillanoYaExiste (String unNombre) 
	{
		villanos.exists[v | v.tieneElMismoNombreQue(unNombre)]
		// Que es lo mismo que escribir...
		// expedientes.exists[| it.nombre == villano.nombre]
	}
	
	/**
	 * @Propósito Agrega un villano.
	 * @param villanoAAgregar Es el Villano que se agrega.
	 */
	def void agregarVillano (Villano villanoAAgregar)
	{
		villanoAAgregar.id = secuencia
		villanos.add(villanoAAgregar)
		secuencia++
	}
	
	/**
	 * @Propósito Busca un villano.
	 * @param unNombre Es el nombre del Villano que se busca.
	 */
	def buscarVillano (String unNombre)
	{
		villanos.filter[v | v.tieneElMismoNombreQue(unNombre)].toList
	}
	
	def nombreDeLosVillanos() 
	{
		villanos.map[v | v.nombre].toList
	}
	
	def obtenerVillanoDeId(Integer idABuscar) 
	{
		villanos.findFirst[v|v.tieneLaId(idABuscar)]
	}
	
	def eliminarVillanoDeId(Integer id) 
	{
		val villano = obtenerVillanoDeId(id)
		villanos.remove(villano)
	}
	
	def void editarVillanoSiPuede(Villano villano, Integer id) 
	{	
		validarEdicion(villano, id)
		obtenerVillanoDeId(id).actualizarInformacion(villano.nombre, villano.sexo, villano.seniasParticulares, villano.hobbies)
	}
	
	def agregarVillanoNuevo(Villano villano) 
	{	
		validarVillano(villano)
		agregarVillano(villano)
	}
	
	def validarEdicion(Villano villano, Integer id)
	{
		if (!villano.estaCompleto) 
		{
			throw new VillanoIncompletoException("El villano debe estar completo")
		}
		
		if (elNombreYaFueUtilizado(villano, id))
		{
			throw new ElVillanoYaEstaCargadoException("Ya existe un villano con ese nombre")
		}
		
		if (faltaAgregarSeniasParticulares(villano))
		{
			throw new FaltaAgregarSeniasParticulares("El villano debe tener al menos 2 senias particulares")
		}
		
		if (faltaAgregarElHobbie(villano))
		{
			throw new FaltaAgregarHobbiesException("El villano debe tener al menos 1 hobbie")
		}
	}
	
	def validarVillano(Villano villano)
	{
		if (!villano.estaCompleto) 
		{
			throw new VillanoIncompletoException("El villano debe estar completo")
		}
		
		if (elVillanoYaExiste(villano.nombre))
		{
			throw new ElVillanoYaEstaCargadoException("Ya existe un villano con ese nombre")
		}
		
		if (faltaAgregarSeniasParticulares(villano))
		{
			throw new FaltaAgregarSeniasParticulares("El villano debe tener al menos 2 senias particulares")
		}
		
		if (faltaAgregarElHobbie(villano))
		{
			throw new FaltaAgregarHobbiesException("El villano debe tener al menos 1 hobbie")
		}
	}
	
	def elNombreYaFueUtilizado(Villano villano, Integer id) 
	{
		villanos.exists[v|v.tieneElMismoNombreQue(villano.nombre) && (v.id != id)]
	}
	
	def faltaAgregarElHobbie(Villano villano) 
	{
		villano.faltaAgregarHobbie
	}
	
	def faltaAgregarSeniasParticulares(Villano villano) 
	{
		villano.faltanSeniasParticulares
	}
	
	def idDelVillano(String nombre) 
	{
		var villano = buscarVillano(nombre).get(0)
		villano.id
	}
	
	def malotes(){
		this.villanos
	}
	
	
}