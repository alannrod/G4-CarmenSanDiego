package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.layout.HorizontalLayout
import edu.ui.domain.AppModel.CasoAppModel

class InicioDelJuegoWindow extends SimpleWindow<CasoAppModel> 
{
	new(WindowOwner parent) 
	{
		super(parent, new CasoAppModel)
		title = this.modelObject.titulo
	}
	
	
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			//por defecto vertical layout
			crearPanelDeInvitacion(it)
			crearPanelDeDescripcion(it)
			crearPanelDeOpciones(it)
		]
		
	}

	def crearPanelDeInvitacion(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "Detective, tenemos un caso para usted!"
				fontSize = 11				
			]				
		]
	}
		
	def crearPanelDeDescripcion(Panel mainPanel) {
		new Panel(mainPanel) => [
			width  = 200
			new Label(it) => [
				text = this.modelObject.descripcion
				fontSize = 11		
			]		
		]
	}
	
	def crearPanelDeOpciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			new Button(it) => [
				caption = "Aceptar el caso"
				setAsDefault
				onClick[ 
					val nextModel = new ResolverMisterioAppModel(modelObject)
					val window = new ResolviendoMisterioWindow(this, nextModel)
					window.open()
				]
			]
			new Button(it) => [
				caption = "Cancelar"
				onClick[ | this.close]
			]
		]
	}
	
	
}