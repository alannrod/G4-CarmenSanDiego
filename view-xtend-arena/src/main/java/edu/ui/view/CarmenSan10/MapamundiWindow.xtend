package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
 import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.AppModel.MapamundiAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.bindings.NotNullObservable
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.arena.layout.ColumnLayout
import edu.ui.domain.CarmenSan10.LugarDeInteres

class MapamundiWindow extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MapamundiAppModel)
		title = "Mapamundi"
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
			crearPanelDePaises(it)
			crearPanelDeOpciones(it)
		]
		
	}
	
	def crearPanelDePaises(Panel panelIzq) {
		val table = new Table<Pais>(panelIzq, typeof(Pais)) => [
			items <=> "todosLosPaises"
			value <=> "itemSeleccionado"
		]
		new Column<Pais>(table) => [
			title = "Paises"
			fixedSize = 150
			bindContentsToProperty("nombrePais")
		]
	}
	
	def crearPanelDeOpciones(Panel panelIzq) {
		new Panel(panelIzq) => [
			new Button(it) => [
				caption = "Eliminar"
				onClick[ | modelObject.eliminarPaisSeleccionado ]
			]
			new Button(it) => [
				caption = "Editar"
				onClick[ | this.editarPais]
			]
			new Button(it) => [
				caption = "Nuevo"
				setAsDefault
				onClick[ | this.agregarNuevoPais ]
			]
		]
	}
	
	def editarPais() 
	{
		this.openDialog(new EditarPaisWindows(this, modelObject.itemSeleccionado))
	}
	
	def agregarNuevoPais() 	{
		this.openDialog(new NuevoPaisWindow(this))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}
	
	
	
	
	def crearPanelDerecho(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelDeNombre(it)
			crearPanelDeCaracteristicas(it)
			crearPanelDeConexiones(it)
			crearPanelDeLugares(it)
			]
	}
	
	def crearPanelDeNombre(Panel panelDer) {
		new Panel(panelDer) => [
			layout = new HorizontalLayout
			new Label(it) => [
				text = "Nombre: "
				fontSize = 11				
			]	
			new Label(it) => [
				value <=> "itemSeleccionado.nombrePais"
				fontSize = 11				
			]	
		]
	}
	
	def crearPanelDeCaracteristicas(Panel panelDer) {
		new Panel(panelDer) => [
			new Label(it) => [
				text = "Caracteristicas"
				fontSize = 11				
			]
			tablaDeCaracteristicas(it)				
		]
	}
	
	def tablaDeCaracteristicas(Panel panelDer) {
		val table = new Table<Caracteristicas>(panelDer, typeof(Caracteristicas)) => [
			items <=> "itemSeleccionado.caracteristicaPais"
			value <=> "itemSeleccionado"
		]
		new Column<Caracteristicas>(table) => [
			title = "Caracteristicas"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	def crearPanelDeConexiones(Panel panelDer) {
		new Panel(panelDer) => [
			new Label(it) => [
				text = "Conexiones"
				fontSize = 11				
			]
			tablaDeConexiones(it)				
		]
	}
	
	def tablaDeConexiones(Panel panelDer) {
		val table = new Table<Pais>(panelDer, typeof(Pais)) => [
			items <=> "itemSeleccionado.paisesConexionAerea"
			value <=> "itemSeleccionado"
		]
		new Column<Pais>(table) => [
			title = "Conexiones"
			fixedSize = 150
			bindContentsToProperty("nombrePais")
		]
	}
	
	def crearPanelDeLugares(Panel panelDer) {
		new Panel(panelDer) => [
			new Label(it) => [
				text = "Lugares de Interes"
				fontSize = 11				
			]
			tablaDeLugares(it)				
		]
	}
	
	def tablaDeLugares(Panel panelDer) {
		val table = new Table<LugarDeInteres>(panelDer, typeof(LugarDeInteres)) => [
			items <=> "itemSeleccionado.lugares"
			value <=> "itemSeleccionado"
		]
		new Column<LugarDeInteres>(table) => [
			title = "Lugares"
			fixedSize = 150
			bindContentsToProperty("nombreLugar")
		]
	}
	
	
	
//	override protected createFormPanel(Panel mainPanel) {
//		title = "Mapamundi"
//		
//		val general = new Panel(mainPanel) => [
//				layout = new HorizontalLayout
//		]
//				
//			val elementSelected = new NotNullObservable("itemSeleccionado")
//				
//			val ladoIzq = new Panel(general)
//				
//			var table = new Table<Pais>(ladoIzq, typeof(Pais)) => [
//				height = 600
//				width = 200 
//				items <=> "todosLosPaises"
//				value <=> "itemSeleccionado"
//			]
//				
//				new Column<Pais>(table) => [
//					title = "Paises"
//					fixedSize = 150
//					bindContentsToProperty("nombrePais")
//				]
//			
//				new Button(ladoIzq) => [
//					caption = "Eliminar"
//					onClick([|modelObject.eliminarPaisSeleccionado])
//					bindEnabled(elementSelected)
//					
//				]
//				
//				new Button(ladoIzq) => [
//					caption = "Editar"
//					onClick ([|editarPais])
//					bindEnabled(elementSelected)
//				]
//				
//				new Button(ladoIzq) => [
//					caption = "Nuevo"
//					onClick ([|this.agregarNuevoPais])
//				]
//			
//			val ladoDer = new Panel(general)
//				
//				val horPanel = new Panel(ladoDer) => [
//					layout = new HorizontalLayout
//				]
//				
//				new Label(horPanel) => [
//					text = "Nombre:"
//				]
//				
//				new Label(horPanel) => [
//					value <=> "itemSeleccionado.nombrePais"
//				]
//				
//			
//				new Label(ladoDer).text = "Características"
//				
//				/**
//				 * Es obligatorio definir(Table)
//				 * 	- la propiedad items contra una colección de elementos de tipo R
//				 *  - al menos una columna
//				 */
//				
//				var tableT = new Table<Caracteristicas>(ladoDer, typeof(Caracteristicas)) => [
//					items <=> "itemSeleccionado.caracteristicaPais"
//					value <=> "itemSeleccionado"
//				]
//				
//					new Column<Caracteristicas>(tableT) => [
//						title = "Caraterísticas"
//						fixedSize = 200
//						bindContentsToProperty("nombre")
//					]
//				
//				new Label(ladoDer).text = "Conexiones"
//				
//				var table2 = new Table<Pais>(ladoDer, typeof(Pais)) => [
//					items <=> "itemSeleccionado.paisesConexionAerea"
//					value <=> "itemSeleccionado"
//				]
//					
//					new Column<Pais>(table2) => [
//						title = "Conexiones"
//						fixedSize = 200
//						bindContentsToProperty("nombrePais")
//					]
//			
//				new Label(ladoDer).text = "Lugares De Interes"
//				
//				var table3 = new Table<Pais>(ladoDer, typeof(Pais)) => [
//					items <=> "itemSeleccionado.lugares"
//					value <=> "itemSeleccionado"
//				]
//				
//					new Column<Pais>(table3) => [
//						title = "Lugares"
//						fixedSize = 200
//						bindContentsToProperty("nombreLugares")
//					]
//	}
//	
//	def agregarNuevoPais() 
//	{
//		this.openDialog(new NuevoPaisWindow(this))
//	}
//	
//	def editarPais() 
//	{
//		this.openDialog(new EditarPaisWindows(this, modelObject.itemSeleccionado))
//	}
//	
//	def openDialog(Dialog<?> dialog) {
//		dialog.onAccept[|modelObject.search]
//		dialog.open
//	}
//	
//	override protected addActions(Panel actionsPanel) {}
	
}