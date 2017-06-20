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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	override createFormPanel(Panel mainPanel) 
//	{
//		title = "Robo del Faraón"
//		// title = model.objetoDelRobo
//		val panelDelCaso = new Panel(mainPanel)
//		panelDelCaso.layout = new VerticalLayout()
//		new Label(panelDelCaso).text = "Detective, tenemos un caso para usted!"
//		val detalleDelCaso = new Panel(panelDelCaso)
//		detalleDelCaso.layout = new VerticalLayout
//		//new Label(detalleDelCaso).text = modelObject.reporteDelActoCriminal
//		new Label(detalleDelCaso).text = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del bla bla bla"
//	}
//	
//	override addActions(Panel actionsPanel) 
//	{
//		new Button(actionsPanel) => [
//			caption = "Aceptar el caso"
//			onClick [ | resolverMisterio ]
//			]
//	}
//	
//	def resolverMisterio() 
//	{
//		//val caso = modelObject.caso
//		//new DialogWindow(this, new Detective).open
//		new ResolviendoMisterioWindow(this, new ResolverMisterioAppModel()).open
//	}
}