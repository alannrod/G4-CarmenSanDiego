package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.ACME
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarmenSandiegoAppModel 
{
	private Mapamundi mapamundi
	private ACME acme
	
	new () {
		mapamundi = new Mapamundi()
		acme = new ACME()
	}
	
	new (Mapamundi mapa, ACME a)
	{
		mapamundi = mapa
		acme = a
	}
	
	def getExpediente ()
	{
		acme.villanos
	}
	
	def getCaso()
	{
		acme.caso
	}
}