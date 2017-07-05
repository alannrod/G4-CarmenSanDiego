package edu.ui.view.CarmenSan10

import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.AppModel.LugarInteresAppModel
import org.uqbar.arena.layout.ColumnLayout
import edu.ui.domain.CarmenSan10.LugarDeInteres
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout

class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel>
{
	new(WindowOwner parent, ResolverMisterioAppModel model) 
	{
		super(parent, model)
		title = tituloDelMisterio
	}
	
	def tituloDelMisterio() {
		"Resolviendo: ".concat(this.modelObject.caso.objetoDelRobo)
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelTareas(it)
			crearPanelInformacion(it)
		]
		
	}
	
	def crearPanelTareas(Panel panel) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)
			crearPanelIzquierdo(it)
			crearPanelDerecho(it)
		]
	}
	
	def crearPanelIzquierdo(Panel panelIzq) {
		new Panel(panelIzq) => [
			infoPais(it)
			new Button(it) => [
				caption = "Orden De Arresto"
				onClick ([|new OrdenArrestoWindow(this, modelObject).open])
			]
				
			infoOrden(it)
				
			new Button(it) => [
				caption = "Viajar"
				onClick ([|new ViajarWindow(this, modelObject).open])
				// Al viajar debe deshabilitarse los botones en caso de poder viajar o no.
			]
			
			new Button(it) => [
				caption = "Expedientes"
				onClick ([|new ExpedientesResolverMisterioView(this).open])
			]
			
		]
	}
	
	def infoPais(Panel panel) {
			new Panel(panel) => [
			new Label(it) => [
				fontSize = 10
				text = "Estas en: "
			]
			new Label(it) => [
				fontSize = 12
				text = this.modelObject.detective.nombreDelPaisActual.toUpperCase
			]
		]
	}
	
	def infoOrden(Panel panel) {
	
		new Panel(panel) => [
			layout = new HorizontalLayout()
			new Label(it) => [
				fontSize = 10
				text = "Orden ya emitida: "
				
				]
			new Label(it) => [
				fontSize = 10
				value <=> "buscado"
			
			]
			
		]
	}
	
	
	
	def crearPanelDerecho(Panel panel) {
		val losLugares = this.modelObject.detective.ubicacionActual.lugares
		new Panel(panel) => [
			new Label(it) => [
				fontSize = 10
				text = "Lugares"
			]
			botonLugar(it,losLugares.get(0))
			botonLugar(it,losLugares.get(1))
			botonLugar(it,losLugares.get(2))
		]
	}
	
	def botonLugar(Panel panel, LugarDeInteres interes) {
		new Panel(panel) => [
			new Button(it) => [
				caption = interes.nombreLugar
				onClick ([|var lugarApp = new LugarInteresAppModel(interes,modelObject.caso,this.modelObject.detective)
					new LugaresWindow(this,lugarApp ).open ])
			]
		]
	}
	

	
	def crearPanelInformacion(Panel panel) {
		new Panel(panel) => [
			new Label(it) => [
				fontSize = 10
				text = "Recorrido criminal:"
			]
			imprimirRecorrido(it)
			new Label(it) => [
				fontSize = 10
				text = "Destinos fallidos:"
			]
			tablaDeDestinos(it)
		]
	}
	
	def imprimirRecorrido(Panel panel) {
		val pavis =  modelObject.recorridoCriminal//this.modelObject.detective.paisesVisitados()
		val reco = ""
		for (p : pavis)
		{
			reco.concat(p.nombrePais.toUpperCase)
			reco.concat(" <- ")
		}
		
		new Panel(panel) => [
			new Label(it) => [
				fontSize = 10
				text = reco
			]
		]
	}
	
	def tablaDeDestinos(Panel panel){ 
		val table = new Table<Pais>(panel, typeof(Pais)) => [
			items <=> "paisesFallidos"
			value <=> "paisSeleccionado"
		]
		new Column<Pais>(table) => [
			title = "Pais"
			fixedSize = 150
			bindContentsToProperty("nombrePais")
		]
	
	}
	

	
	

}