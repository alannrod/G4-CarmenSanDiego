package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Pais

class NuevoPaisWindow extends EditarPaisWindows{
	
	new(WindowOwner parent) {
		super(parent, new Pais)
	}
	
	override defaultTitle() {
		"Mapamundi - Nuevo Pais"
	}
	

}