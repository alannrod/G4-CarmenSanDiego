package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.Dialog
import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Caracteristicas
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox

class EditarHobbies extends Dialog<Villano> {
	
	new(WindowOwner owner, Villano model) {
		super(owner, model)
		title = "Editar Hobbies"
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelDeConsulta(it)
			crearPanelDeEliminar(it)
			crearPanelDeAgregar(it)
			crearPanelDeOpciones(it)
		]
		
	}
	
	def crearPanelDeConsulta(Panel panel) {
		val table = new Table<Caracteristicas>(panel, typeof(Caracteristicas)) => [
			items <=> "hobbies"
			//value <=> "selectedVillano"
		]
		new Column<Caracteristicas>(table) => [
			title = "Hobbie"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	def crearPanelDeEliminar(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Button(it) => [
				caption = "Eliminar"
				setAsDefault
				onClick[ | this.close ]
			]
			
		]
	}
	
	def crearPanelDeAgregar(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			new TextBox(it) => [
				 width = 200 
			]
			new Button(it) => [
				caption = "Agregar"
				setAsDefault
				onClick[ | this.close ]
			]				
		]
	}
	
	def crearPanelDeOpciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Button(it) => [
				caption = "Aceptar"
				setAsDefault
				onClick[ | this.close ]
			]
			
		]
	}
}