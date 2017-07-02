package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import edu.ui.domain.AppModel.LugarInteresAppModel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import java.awt.Color

class FinDelJuegoWindow extends Dialog<LugarInteresAppModel>{
	
	new(WindowOwner owner, LugarInteresAppModel model) {
		super(owner, model)
		title = modelObject.nombreDelCaso + "- Resuelto"
		
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelNotificador(it)
			crearPanelDelPorque(it)
			botonParaCerrar(it)
		]
		
		}
	
	
	
	def crearPanelNotificador(Panel mainPanel) {
		if (this.modelObject.detective.ordenDeArresto == this.modelObject.caso.responsable.nombre){
			new Panel(mainPanel) => [
				new Label(it) => [
					text = "En Hora Buena!!!"
					fontSize = 11
				]
			]
		}
		else{
			new Panel(mainPanel) => [
				new Label(it) => [
					text = "Malas noticias :("
					fontSize = 11
					foreground = Color.RED
				]				
		]
		}
		
	}
	
	def crearPanelDelPorque(Panel mainPanel) {
		if (this.modelObject.detective.ordenDeArresto == this.modelObject.caso.responsable.nombre){
			new Panel(mainPanel) => [
				new Label(it) => [
					text = "ha detenido a "+ this.modelObject.detective.ordenDeArresto+ 
									 ",  y recuperado" +this.modelObject.caso.objetoDelRobo
					fontSize = 11
				]
				new Label(it)=>[
					text = "Felicitaciones!!!"
					fontSize = 11
					foreground = Color.GREEN
				]
			]
		}
		else{
			new Panel(mainPanel) => [
				new Label(it) => [
					text = "ha detenido a "+ this.modelObject.caso.responsable.nombre+ 
									 ",  pero usted tenia una orden de arresto contra "
									   +this.modelObject.detective.ordenDeArresto+
" Lamentablente este crímen quedará impune"
					fontSize = 11
					
				]				
		]
		}
	}
	 
	def botonParaCerrar(Panel mainPanel) {
		var leyenda =""
		
		if (this.modelObject.detective.ordenDeArresto == this.modelObject.caso.responsable.nombre){
			leyenda = "Disfrutar de nuestra victoria"
		}
		else{
			leyenda = "Aceptar el error cometido"
		}
		val comoDice = leyenda
		new Panel(mainPanel) => [
			new Button(it) => [
				caption = comoDice
				onClick[ | this.close]
			]
			
		]
	}
	
}