package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.ACME
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caso
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ResolverMisterioAppModel 
{
	ACME acme
	Pais paisSeleccionado
	Villano villanoSeleccionado
	Caso casoSeleccionado
	
	new(){}
	
	
	new(ACME acme)
	{
		this.acme = acme
	}
	
	new(CasoAppModel model) {
		acme = new ACME (model.dummy.expediente,model.dummy.doc,model.dummy.caso)
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
		acme.detectiveEnviarOrdenDeArresto(villanoSeleccionado)
	}
	
	def regresarAlPaisAnterior() 
	{
		acme.detectiveRegresarAlPaisAnterior
	}
	
	def viajar()
	{
		acme.detectiveViajaA(paisSeleccionado)
	}
	
	
	def recorridoCriminal()
	{
		acme.caso.planDeEscape
	}
	
	def paisesFallidos(){
		this.detective.verDestinosFallidos
	}
	
	def villanos(){
		this.acme.villanos
	}
	
	def paisActual(){
		this.detective.recorrido.last
	}

	def misExpedientes(){
		this.acme.villanos
	}
	
}