package edu.ui.domain.CarmenSan10

import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import junit.framework.Assert
import java.util.List
import org.omg.CORBA.UserException
import org.junit.Before

class TestCaso 
{
	List<Pais> planDeEscape
	
	String reporteDelCrimen
	
	String objetoRobado
	
	Pais argentina
	Pais bolivia
	Pais mexico
	Pais venezuela
	Pais brazil
	
	List<LugarDeInteres> lugaresArg
	List<LugarDeInteres> lugaresBo
	List<LugarDeInteres> lugaresMx
	List<LugarDeInteres> lugaresVe
	List<LugarDeInteres> lugaresBr
	
	List<Pais> conexionesArg
	List<Pais> conexionesBo
	List<Pais> conexioneMx
	List<Pais> conexionesVe
	List<Pais> conexionesBr
	
	Villano villano
	
	Caracteristicas senia1
	Caracteristicas senia2
	Caracteristicas senia3
	
	Caracteristicas hobbie1
	
	List<Caracteristicas> seniasParticulares
	List<Caracteristicas> hobbies
	
	Caso casoFeliz
	Caso casoInfeliz
	
	@Before
	def void setUp() {
		////////////////////////////////////////////////////////////////////////
		
		lugaresArg = new ArrayList<LugarDeInteres>()
		
		lugaresArg.add(LugarDeInteres.BIBLIOTECA)
		lugaresArg.add(LugarDeInteres.CLUB)
		lugaresArg.add(LugarDeInteres.EMBAJADA)
		
		lugaresBo = new ArrayList<LugarDeInteres>()
		lugaresBo.add(LugarDeInteres.BANCO)
		lugaresBo.add(LugarDeInteres.CLUB)
		lugaresBo.add(LugarDeInteres.EMBAJADA)
		
		lugaresMx = new ArrayList<LugarDeInteres>()
		lugaresMx.add(LugarDeInteres.BANCO)
		lugaresMx.add(LugarDeInteres.BIBLIOTECA)
		lugaresMx.add(LugarDeInteres.EMBAJADA)
		
		lugaresVe = new ArrayList<LugarDeInteres>()
		lugaresVe.add(LugarDeInteres.BANCO)
		lugaresVe.add(LugarDeInteres.CLUB)
		lugaresVe.add(LugarDeInteres.EMBAJADA)
		
		lugaresBr = new ArrayList<LugarDeInteres>()
		lugaresBr.add(LugarDeInteres.BANCO)
		lugaresBr.add(LugarDeInteres.CLUB)
		lugaresBr.add(LugarDeInteres.BIBLIOTECA)
		
		
		venezuela = new Pais("Venezuela", lugaresVe, conexionesVe)
		
		conexionesBr = new ArrayList<Pais>()
		conexionesBr.add(venezuela)
		brazil = new Pais("Brazil", lugaresBr, conexionesBr)
		
		conexionesBo = new ArrayList<Pais>()
		conexionesBo.add(brazil)
		bolivia = new Pais("Bolivia", lugaresBo, conexionesBo)
		
		conexioneMx = new ArrayList<Pais>()
		conexioneMx.add(bolivia)
		conexioneMx.add(brazil)
		mexico = new Pais("Mexico", lugaresMx, conexioneMx)

		conexionesArg = new ArrayList<Pais>()
		conexionesArg.add (brazil)
		conexionesArg.add (mexico)
		argentina = new Pais("Argentina", lugaresArg, conexionesArg)
		
		
		planDeEscape = new ArrayList<Pais>()
		planDeEscape.add(argentina)
		planDeEscape.add(brazil)
		planDeEscape.add(venezuela)
		
		
		senia1 = new Caracteristicas("Tiene el pelo rojo")
		senia2 = new Caracteristicas("Posee un collar de rubies")
		senia3 = new Caracteristicas("Maneja un convertible")
		
		hobbie1 = new Caracteristicas("Juega tenis")
		
		seniasParticulares = new ArrayList<Caracteristicas>()
		seniasParticulares.add(senia1)
		seniasParticulares.add(senia2)
		seniasParticulares.add(senia3)
		
		
		hobbies = new ArrayList<Caracteristicas>()
		hobbies.add(hobbie1)
		
		villano = new Villano("Carmen Sandiego", "Femenino", seniasParticulares, hobbies)
		
		//////////////////////////////////////////////////////////////////////
		
		reporteDelCrimen = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective es desifrar el responsable de tal crímen y apresarlo."
		objetoRobado = "Tumba del faraón"
		
		//casoFeliz = new Caso(villano, planDeEscape, reporteCrimen, objetoRobado, argentina)
		
		
	}
	
	/**
	 * Dado un Caso, le agrega un nuevo Pais al plan de escape,
	 * verifica si el mismo ya esta registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscape ()
	{	
		casoFeliz = new Caso(villano, planDeEscape, reporteDelCrimen, objetoRobado, argentina)
		
		casoFeliz.agregarPaisDeEscape(bolivia)
		
		Assert.assertTrue(casoFeliz.estaIncluidoEnElPlanDeEscape(bolivia))
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Rusia"...
	 * verifica que "Rusia" se haya registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscapeSiPuedeEnCasoPositivo ()
	{	
		var List<Pais> plan = new ArrayList()
		plan.add(paisMock1)
		var caso = new Caso (villanoMock, plan, "soy un reporte criminal", "", paisDelCrimenMock)
		
		when(paisMock1.nombrePais).thenReturn("Italia")
		when(paisMock2.nombrePais).thenReturn("Rusia")
		
		caso.agregarPaisDeEscapeSiPuede(paisMock2)
		
		Assert.assertTrue(caso.estaIncluidoEnElPlanDeEscape(paisMock2))
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Italia"...
	 * verifica que "Italia" ya está registrado...
	 * y devuelve un Exception.
	 */
	@Test (expected = UserException)
	def void testAgregarPaisDeEscapeSiPuedeEnCasoNegativo ()
	{	
		var List<Pais> plan = new ArrayList()
		plan.add(paisMock1)
		var caso = new Caso (villanoMock, plan, "soy un reporte criminal", "", paisDelCrimenMock)
		
		when(paisMock1.nombrePais).thenReturn("Italia")
		when(paisMock2.nombrePais).thenReturn("Italia")
		
		caso.agregarPaisDeEscapeSiPuede(paisMock2)
		
	}
}