package edu.ui.view.CarmenSan10

import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.aop.windows.TransactionalDialog
import edu.ui.domain.AppModel.PaisAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas
import edu.ui.domain.CarmenSan10.LugarDeInteres

class EditarPaisWindows extends TransactionalDialog<PaisAppModel>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, new PaisAppModel(model))
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Mapamundi-Editar Pais"		
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelNombre(it)
			crearPanelCaracteristicas(it)
			crearPanelConexiones(it)
			crearPanelLugaresDeInteres(it)
			crearPanelDeOpciones(it)
		]
		
	}
	
	def crearPanelNombre(Panel mainPanel) {
		new Panel (mainPanel)=>[
			layout = new HorizontalLayout
			
				new Label(it) => [
					text = "Nombre:"
				]
				
				new TextBox(it) => [
					value <=> "nombrePais"
					width = 200
				]
		]
	}
	
	def crearPanelCaracteristicas(Panel mainPanel) {
		new Panel (mainPanel) => [
			new Panel (it)=>[
				layout = new ColumnLayout(2)
				new Label(it) => [
				text = "Caracteristicas "
				fontSize = 11
				]
				new Button(it) => [
				caption = "Editar Caracteristicas"
				onClick[ |new EditorCaracteristicaWindow(this, modelObject.paisSelected).open]
				]
			]
			tablaDeCaracteristicas(it)				
		]
	}
	
	def tablaDeCaracteristicas(Panel panelDer) {
		val table = new Table<Caracteristicas>(panelDer, typeof(Caracteristicas)) => [
			items <=> "paisSelected.caracteristicaPais"
			value <=> "itemSeleccionado"
		]
		new Column<Caracteristicas>(table) => [
			title = "Caracteristicas"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	
	def crearPanelConexiones(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Panel (it)=>[
				layout = new ColumnLayout(2)
				new Label(it) => [
				text = "Conexiones "
				fontSize = 11
				]
				new Button(it) => [
				caption = "Editar Conexiones"
				onClick[ |new EditorSuperConexion(this, modelObject.paisSelected).open]
				]
			]
			tablaDeConexiones(it)				
		]
	}
	
	def tablaDeConexiones(Panel panelDer) {
		val table = new Table<Pais>(panelDer, typeof(Pais)) => [
			items <=> "paisSelected.paisesConexionAerea"
			value <=> "itemSeleccionado"
		]
		new Column<Pais>(table) => [
			title = "Conexiones"
			fixedSize = 150
			bindContentsToProperty("nombrePais")
		]
	}
	
	def crearPanelLugaresDeInteres(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Panel (it)=>[
				layout = new ColumnLayout(2)
				new Label(it) => [
				text = "Lugares de Interes"
				fontSize = 11
				]
				new Button(it) => [
				caption = "Editar Lugares"
				onClick[ |new EditorLugarInteresWindow(this, modelObject.paisSelected).open]
				]
			]
			tablaDeLugares(it)				
		]
	}
	
	
	def tablaDeLugares(Panel panelDer) {
		val table = new Table<LugarDeInteres>(panelDer, typeof(LugarDeInteres)) => [
			items <=> "paisSelected.lugares"
			value <=> "itemSeleccionado"
		]
		new Column<LugarDeInteres>(table) => [
			title = "Lugar De Interes"
			fixedSize = 150
			bindContentsToProperty("nombreLugar")
		]
	}
	
	
	
	
	def crearPanelDeOpciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			new Button(it) => [
				caption = "Aceptar"
				setAsDefault
				onClick[ |this.accept]
			]
		]
	}
	

}