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
	

	
}