package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.CarmenSandiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class MenuWindow extends SimpleWindow<CarmenSandiegoAppModel> {
	
	new(WindowOwner parent) {
		super(parent, new CarmenSandiegoAppModel)
		title = "¿Donde esta Carmen Sandiego?"
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			//por defecto vertical layout
			crearPanelDeConsulta(it)
			crearPanelDeOpciones(it)
		]
		
	}
		
	def crearPanelDeConsulta(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "¿Que haremos ahora detective?"
				fontSize = 18				
			]				
		]
	}
	
	def crearPanelDeOpciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			new Button(it) => [
				caption = "Resolver Misterio"
				setAsDefault
				onClick[ | new InicioDelJuegoWindow(this).open ]
			]
			new Button(it) => [
				caption = "Mapamundi"
				setAsDefault
				onClick[ | new MapamundiWindow(this).open]
			]
			new Button(it) => [
				caption = "Expedientes"
				setAsDefault
				onClick[ | new ExpedienteMenuDeAccionesView(this).open ]
			]
		]
	}
	
}