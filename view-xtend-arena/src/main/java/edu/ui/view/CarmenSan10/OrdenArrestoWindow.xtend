package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.widgets.Selector
import edu.ui.domain.CarmenSan10.Villano

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.ObservableProperty
import edu.ui.domain.Repo.RepoVillanos
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Spinner
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

class OrdenArrestoWindow extends SimpleWindow<ResolverMisterioAppModel>{
	
	new(WindowOwner parent, ResolverMisterioAppModel model) {
		super(parent, model)
		title = tituloDelMisterio
	}
	
	def tituloDelMisterio() {
		"Resolviendo: ".concat(this.modelObject.caso.objetoDelRobo)
	}
	
	override protected addActions(Panel mainPanel) {
		//dejado en blanco intencionalmente
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			crearPanelBuscado(it)
			crearPanelElegirVillano(it)
			crearPanelOrdenar(it)
		]
		
	}
	
	def crearPanelBuscado(Panel panel) {
		new Panel(panel) => [
			layout = new HorizontalLayout
			new Label(it) => [
			text = "Orden de arresto emitida contra: "
			]
			new Label(it) => [
			text = modelObject.detective.ordenDeArresto
			]
		]
	}
	
	def crearPanelElegirVillano(Panel panel) {
		new Panel(panel) => [
			layout = new HorizontalLayout
			new Label(it) => [
			text = "Villano: "
			]
			
//			new Selector(it) => [
//				(items <=> "acme.misVillanos").adapter = new PropertyAdapter(Villano, "nombre")
//				value <=> "villanoSeleccionado"
//				width = 200
//			
//			]
			tablaDeVillanos(it)


		]
	}
	
	def tablaDeVillanos(Panel panel) {
		val table = new Table<Villano>(panel, typeof(Villano)) => [
			items <=> "acme.misVillanos"
			value <=> "villanoSeleccionado"
		]
		new Column<Villano>(table) => [
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	
	}
	
	def crearPanelOrdenar(Panel panel) {
		new Button(panel) => [
			caption = "Generar orden de arresto"
			onClick ([|dosAcciones])
		]
	}
	
	def dosAcciones() {
		this.modelObject.ordenDeArresto
		this.close
	}
	
	
//	override protected createFormPanel(Panel mainPanel) {
//		
//		val form = new Panel(mainPanel)
//		
//		new Label(form) => [
//			text = "Orden de arresto emitida contra:" // + modelObject.ordenDeArresto
//		]
//		
//		val list = new Panel(form) => [
//			layout = new HorizontalLayout
//		]
//		
//		new Label(list) => [
//			text = "Villano:"
//		]
//		
//		// new SelectorPropio ADD
//		
//		/*
//		new Selector<Villano>(list) => [
//			allowNull(false)
//			value <=> "nombre"
//			val propiedadModelos = bindItems(new ObservableProperty(repoVillanos, "modelos"))
//			propiedadModelos.adaptWith(typeof(Villano), "descripcionEntera") // opción A
//			//propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera") // opción B
//		]
//		*/
//		
//	}
//	
//	override protected addActions(Panel actionsPanel) {
//		new Button(actionsPanel) => [
//			caption = "Generar orden de arresto"
//		]
//	}
//		
}