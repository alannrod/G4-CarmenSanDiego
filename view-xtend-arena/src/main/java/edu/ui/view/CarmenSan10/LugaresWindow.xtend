package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import edu.ui.domain.AppModel.LugarInteresAppModel
import org.uqbar.arena.layout.ColumnLayout

class LugaresWindow extends Dialog<LugarInteresAppModel>{
	
	new(WindowOwner owner, LugarInteresAppModel model) {
		super(owner, model)
		title = "Resolviendo: " + modelObject.nombreDelCaso
	}
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			PanelDeLugarDeVisita(it)
			crearPanelDePista(it)
			crearPanelDeOpcion(it)
		]
		
	}
	
	def PanelDeLugarDeVisita(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "Estas visitando: " + modelObject.nombreDelLugar
				fontSize = 11				
			]				
		]
	}
	
	def crearPanelDePista(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = this.modelObject.preguntarAlOcupante
				fontSize = 11				
			]				
		]
	}
	
	def crearPanelDeOpcion(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			new Label(it) => [
				//en blanco, solo para hacer espacio a la izquierda
			]
			new Button(it) => [
				caption = "Continuar"
				onClick[ | validar]
				setAsDefault
				disableOnError		
			]
			
		]
	}
	
	def validar() {
		if(this.modelObject.preguntarAlOcupante.contains("Lo siento")){ //hay un cuidador
			this.modelObject.detective.agregarDestinosFallidos(this.modelObject.detective.ubicacionActual)
			}
			else{
				if(this.modelObject.habemusVillano){
					new FinDelJuegoWindow(this, modelObject).open
				}
			}
		this.close		
		
	}
	

}