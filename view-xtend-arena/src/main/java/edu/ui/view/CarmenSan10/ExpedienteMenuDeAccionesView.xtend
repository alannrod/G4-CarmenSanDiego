package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.ExpedienteAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import edu.ui.domain.CarmenSan10.Caracteristicas

class ExpedienteMenuDeAccionesView extends SimpleWindow<ExpedienteAppModel> {
	
	new(WindowOwner parent) {
		super(parent, new ExpedienteAppModel)
		title = tituloDeLaVentana
	}
	
	def tituloDeLaVentana() {
		"Expedientes"
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			crearPanelIzquierdo(it)
			crearPanelDerecho(it)
		]
		
	}
	
	
	def crearPanelIzquierdo(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelDeVillanos(it)
			crearPanelDeOpciones(it)
		]
		
	}
	
	def crearPanelDeVillanos(Panel panelIzq) {
		val table = new Table<Villano>(panelIzq, typeof(Villano)) => [
			items <=> "todosLosVillanos"
			value <=> "selectedVillano"
		]
		new Column<Villano>(table) => [
			title = "Villano"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	def crearPanelDeOpciones(Panel panelIzq) {
		new Panel(panelIzq) => [
			new Button(it) => [
				caption = "Nuevo"
				setAsDefault
				onClick[ | this.agregarNuevoVillano ]
			]
			new Button(it) => [
				caption = "Editar"
				onClick[ | this.editarVillano]
			]
			
		]
	}
	
	def editarVillano() 
	{
		this.openDialog(new EditarVillanoWindow(this, modelObject.selectedVillano))
	}
	
	def agregarNuevoVillano() 	{
		this.openDialog(new NuevoVillanoWindow(this))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}
	
	
	
	def crearPanelDerecho(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelDeDatos(it,"Nombre")
			crearPanelDeDatos(it,"Sexo")
			crearPanelDeSenias(it)
			crearPanelDeHobbies(it)
			]
	}
	
	def crearPanelDeDatos(Panel panelDer,String dato) {
		new Panel(panelDer) => [
			layout = new HorizontalLayout
			new Label(it) => [
				text = dato
				fontSize = 11				
			]	
			new Label(it) => [
				val valor = "selectedVillano.".concat( dato.toLowerCase)
				value <=> valor
				fontSize = 11				
			]	
		]
	}
	
	def crearPanelDeSenias(Panel panelDer) {
		new Panel(panelDer) => [
			new Label(it) => [
				text = "Señas Particulares"
				fontSize = 11				
			]
			tablaDeSenias(it)				
		]
	}
	
	def tablaDeSenias(Panel panelDer) {
		val table = new Table<Caracteristicas>(panelDer, typeof(Caracteristicas)) => [
			items <=> "selectedVillano.seniasParticulares"
			value <=> "selectedVillano"
		]
		new Column<Caracteristicas>(table) => [
			title = "Seña"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	def crearPanelDeHobbies(Panel panelDer) {
		new Panel(panelDer) => [
			new Label(it) => [
				text = "Hobbies"
				fontSize = 11				
			]
			tablaDeHobbies(it)				
		]
	}
	
	def tablaDeHobbies(Panel panelDer) {
		val table = new Table<Caracteristicas>(panelDer, typeof(Caracteristicas)) => [
			items <=> "selectedVillano.hobbies"
			value <=> "selectedVillano"
		]
		new Column<Caracteristicas>(table) => [
			title = "Caracteristica"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	










	
	
//	override protected createFormPanel(Panel mainPanel) {
//		val general = new Panel(mainPanel) => [
//			layout = new HorizontalLayout
//		]
//		
//		val ladoIzq = new Panel(general)
//		
//		var table = new Table<Villano>(ladoIzq, typeof(Villano)) => [
//			height = 200
//			width = 450
//			bindItemsToProperty("todosLosVillanos")
//			bindValueToProperty("selectedVillano")
//		
//		]
//			
//		new Column<Villano>(table) => [
//			title = "Villano"
//			fixedSize = 150
//			bindContentsToProperty("nombre")
//		]
//		
//		new Button(ladoIzq) => [
//			caption = "Nuevo"
//		]
//		
//		new Button(ladoIzq) => [
//			caption = "Editar"
//		]
//	}
//	
//	override protected addActions(Panel actionsPanel) {
//		
//	}
//	
	
}