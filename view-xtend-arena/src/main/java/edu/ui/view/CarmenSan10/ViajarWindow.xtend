package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.layout.ColumnLayout

class ViajarWindow extends SimpleWindow<ResolverMisterioAppModel>{
	
	new(WindowOwner parent, ResolverMisterioAppModel model) {
		super(parent, model)
		title = "Viajar"
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelOndeToy(it)
			crearPanelElegirPais(it)
			crearPanelOpciones(it)
		]
		
	}
	
	def crearPanelOndeToy(Panel panel) {
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
	
	def crearPanelElegirPais(Panel panel) {
		val table = new Table<Pais>(panel, typeof(Pais)) => [
			items <=> "paisActual.paisesConexionAerea"
			value <=> "paisSeleccionado"
		]
		new Column<Pais>(table) => [
			title = "Posibles Destinos"
			fixedSize = 150
			bindContentsToProperty("nombrePais")
		]
	}
	
	def crearPanelOpciones(Panel panel) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)
			new Button(it) => [
				caption = "Volver al Pais anterior"
				onClick ([|dosAcciones("Volver")])
			]
			new Button(it) => [
				caption = "Viajar"
				onClick ([|dosAcciones("Viajar")])
			]
			
		]
	}
	
	def dosAcciones(String accion) {
		if (accion == "Viajar"){
			this.modelObject.viajar
		}
		else{
			if (accion == "Volver"){
				this.modelObject.regresarAlPaisAnterior
			}
		}
		this.close
	}
	
//	override protected addActions(Panel actionsPanel) {
//		
//		val elementSelected = new NotNullObservable("paisSeleccionado")
//		
//		
//		new Button(actionsPanel) => [
//			caption = "Volver al Pais anterior"
//			onClick[|regresarAlPaisAnterior]
//			setAsDefault // se asocia con el <Enter> del usuario
//		]
//		
//		new Button(actionsPanel) => [
//			caption = "Viajar"
//			onClick [| viajar]
//			bindEnabled(elementSelected)
//			setAsDefault
//		]
//	}
//	
//	def viajar() 
//	{
//		// modelObject.viajar
//		this.close()
//	}
//	
//	def regresarAlPaisAnterior() 
//	{
//		// modelObject.regresarAlPaisAnterior
//		this.close()
//	}
//	
//	override protected createFormPanel(Panel mainPanel) {
//		val form = new Panel(mainPanel)
//		
//		new Label(form) => [
//			text = "Estas en: " // + modelObject.nombrePaisActual
//		]
//		
//		// Add Table componente propio
//		val table = new Table<Pais>(mainPanel, typeof(Pais)) => [
//			
//			items <=> "paisesConexionAerea" // método que contiene la lista de paises
//			value <=> "paisSeleccionado" // asocia el valor seleccionado con la propiedad paisSeleccionado
//			
//			new Column<Pais>(it) => [
//					title = "Posibles destinos"
//					//background = Color.GRAY
//					fixedSize = 200
//					//bindContentsToProperty("nombrePais") // nombre de la propiedad con la que bindea en cada Pais
//			]
//		]
//	}
	
}