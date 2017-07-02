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
	
//	def validarFinDelJuego() {
//		if (modelObject.esElFinDelJuego)
//			abrirResultadoDelJuego()
//		this.close
//	}
//	
//	def abrirResultadoDelJuego() {
//		new FinDelJuegoWindow(this, modelObject).open
//	}
	
//	override protected createFormPanel(Panel mainPanel) {
//		title = "Resolviendo: " + modelObject.nombreDelCaso
//		
//		val form = new Panel(mainPanel)//.layout = new VerticalLayout
//		
//		form.width = 200
//		
//		new Label(form) =>[
//			text = "Estas visitando: " + modelObject.nombreDelLugar
//		]
//		
////		val hor = new Panel(form) => [
////			layout = new ColumnLayout(1)
////		]
//		
//		new Label(form) => [
//			//text = modelObject.preguntarAlOcupante
//			text = "El juego termina cuando llegamos al lugar que 
//tiene al delicuente (luego de haber dado la orden de alto).
//Cuando esto pasa al continuar nos informan los resultados, 
//que pueden ser buenas o malas noticias:"
//			//width = 200
//		]
//	}
//	
//	override protected addActions(Panel actionsPanel) {
//		new Button(actionsPanel) => [
//			caption = "Continuar"
//			onClick[| validacionParaContinuar ]
//		]
//	}
//	
//	def validacionParaContinuar() 
//	{
//		if (modelObject.esElFinDelJuego)
//			abrirResultadoDelJuego()
//			
//		this.close()
//	}
//	
//	def abrirResultadoDelJuego() 
//	{
//		//if ()
//			new FinDelJuegoWindow(this, modelObject).open
//		// if()
//	}
	
}