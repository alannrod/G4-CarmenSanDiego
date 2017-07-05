package edu.ui.view.CarmenSan10

import edu.ui.view.CarmenSan10.EditorSuperConexion
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas

class EditorCaracteristicaWindow extends EditorSuperConexion {
	
	new(WindowOwner owner, Pais model) {
		super(owner, model)
	}
	
	override defaultTitle() {
		"Editar Características"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel)
		
		val table = new Table<Caracteristicas>(general, typeof(Caracteristicas)) => [
			
			items <=> "caracteristicaPais"
		]
		
		new Column<Caracteristicas>(table) => [
			title = "Caracteristicas"
			bindContentsToProperty("nombre")
		]
		
		new Button(general) => [
			caption = "Eliminar"
			//onClick([| modelObject.eliminarCaracteristicaSelecionada])
		]
		
		val editHor = new Panel(general) =>[
			layout = new HorizontalLayout
		]
		
//		new TextBox(editHor) => [
//					value <=> "nombre"
//					width = 200
//				]
		
		new Button(editHor) => [
			caption = "Agregar"
			//onClick([| this.agregar])
		]
		
		new Button(general) => [
			caption = "Aceptar"
			onClick([| this.accept])
		]
	}
	
}