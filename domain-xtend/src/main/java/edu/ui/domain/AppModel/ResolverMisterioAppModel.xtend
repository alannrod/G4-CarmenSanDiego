package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.ACME
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.LugarDeInteres

class ResolverMisterioAppModel 
{
	ACME acme
	Pais paisSeleccionado
	Villano villanoSeleccionado
	
	new(){}
	
	new(ACME acme)
	{
		this.acme = acme
	}
	
	def getCaso()
	{
		acme.caso
	}
	
	def getDetective()
	{
		acme.resolvedorDeCasos
	}
	
	def getExpediente()
	{
		acme.villanos
	}
	
	def nombrePaisActual()
	{
		getDetective.nombreDelPaisActual
	}
	
	def nombreDelCaso()
	{
		acme.nombreDelCaso
	}
	
	def ordenDeArresto()
	{
		acme.detectiveEnviarOrdenDeArresto
	}
	
	def regresarAlPaisAnterior() 
	{
		acme.detectiveRegresarAlPaisAnterior
	}
	
	def viajar()
	{
		acme.detectiveViajaA(paisSeleccionado)
	}
	
	def LugarDeInteres el1erLugarDeInteres() {
		// devuelve el 1er lugar de interes
		paisSeleccionado.lugares.findFirst[]
	}
	
	def LugarDeInteres el2doLugarDeInteres() 
	{
		//accedo arbitrariamente al segundo lugar de interes
		paisSeleccionado.lugares.get(1)
	}
	
	def LugarDeInteres el3erLugarDeInteres() 
	{
		//busca el ultimo lugar de interes
		paisSeleccionado.lugares.findLast[]
	}
	
	def recorridoCriminal()
	{
		acme.caso.planDeEscape
	}
	
}