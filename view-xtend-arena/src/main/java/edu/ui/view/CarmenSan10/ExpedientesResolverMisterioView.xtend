package edu.ui.view.CarmenSan10

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ExpedientesResolverMisterioView extends ExpedienteMenuDeAccionesView {
	
	new (WindowOwner parent){
		super(parent)
	}
	
	override def String tituloDeLaVentana(){
		"Resolviendo el Misterio - expedientes"
	}
	
	override def crearPanelDeOpciones(Panel panelIzq) {
		//no hacer nada
	}

	
}