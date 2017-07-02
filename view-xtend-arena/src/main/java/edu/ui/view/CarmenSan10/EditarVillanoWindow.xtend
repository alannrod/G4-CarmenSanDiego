package edu.ui.view.CarmenSan10

import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.aop.windows.TransactionalDialog
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas

class EditarVillanoWindow extends TransactionalDialog<Villano>
{	
	new(WindowOwner parent, Villano model) 
	{
		super(parent, model)
		title = defaultTitle
	}
	
	def defaultTitle() 
	{
		"Expediente - Editar Villano"
	}
	
	override protected createFormPanel(Panel mainPanel) 
	{
		var generalPanel = new Panel(mainPanel) => [
			val editItem = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editItem) => [
				text = "Nombre:"
			]
			
			new TextBox(editItem) => [
				value <=> "nombre"
				width = 200
			]
			
			new Label(editItem) => [
				text = "Sexo:"
			]
			
			new TextBox(editItem) => [
				value <=> "sexo"
				width = 200
			]
			
			new Label(editItem) => [
				text = "Señas Particulares:"
			]
			
			new Button(editItem) => [
				caption = "Editar Señas Particulares"
				onClick([| new EditarSenia(this,this.modelObject).open])
			]
			
			val tableSenias = new Table<Caracteristicas>(it, typeof(Caracteristicas)) => [
				items <=> "seniasParticulares"
				new Column<Caracteristicas>(it) => [
					title = "Seña"
					bindContentsToProperty("nombre")
				]
			]
			
			val editItem2 = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editItem2) => [
				text = "Hobbies:"
			]
			
			new Button(editItem2) => [
				caption = "Editar Hobbies"
				onClick([| new EditarHobbies(this,this.modelObject).open])
			]
			
			val tableHobbies = new Table<Caracteristicas>(it, typeof(Caracteristicas)) => [
				items <=> "hobbies"
				new Column<Caracteristicas>(it) => [
					title = "Hobbie"
					bindContentsToProperty("nombre")
				]
			]
		]
	}
	
	override protected addActions(Panel actionsPanel) 
	{
		new Button(actionsPanel) => [
				caption = "Aceptar"
				onClick([| this.realizarCambios])
			]
	}
	
	def realizarCambios() 
	{
		// Guardar los cambios del villano seleccionado al mapamundi
		this.close()
	}
	
}