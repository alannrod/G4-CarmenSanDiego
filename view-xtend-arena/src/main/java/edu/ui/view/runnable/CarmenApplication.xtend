package edu.ui.view.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import edu.ui.view.CarmenSan10.MenuWindow

class CarmenApplication extends Application{
	
	new(CarmenBootstrap bootstrap) {
		super(bootstrap)
	}
	
	override Window<?> createMainWindow() {
		new MenuWindow(this)
	}
 	
	/**
	 * cada vez que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication(new CarmenBootstrap).start()
	}
	
}