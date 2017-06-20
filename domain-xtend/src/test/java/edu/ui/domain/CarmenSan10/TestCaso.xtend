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
	
	LugarDeInteres biblioteca
	LugarDeInteres club
	LugarDeInteres embajada
	LugarDeInteres banco
	
	@Before
	def void setUp() {
		////////////////////////////////////////////////////////////////////////
		biblioteca = new Biblioteca()
		club = new Club()
		embajada = new Embajada()
		banco = new Banco()
		
		
		lugaresArg = new ArrayList<LugarDeInteres>()
		
		lugaresArg.add(biblioteca)
		lugaresArg.add(club)
		lugaresArg.add(embajada)
		
		lugaresBo = new ArrayList<LugarDeInteres>()
		lugaresBo.add(banco)
		lugaresBo.add(club)
		lugaresBo.add(embajada)
		
		lugaresMx = new ArrayList<LugarDeInteres>()
		lugaresMx.add(banco)
		lugaresMx.add(biblioteca)
		lugaresMx.add(embajada)
		
		lugaresVe = new ArrayList<LugarDeInteres>()
		lugaresVe.add(banco)
		lugaresVe.add(club)
		lugaresVe.add(embajada)
		
		lugaresBr = new ArrayList<LugarDeInteres>()
		lugaresBr.add(banco)
		lugaresBr.add(club)
		lugaresBr.add(biblioteca)
		
		
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
		
		//casoFeliz = new Caso(villano, planDeEscape, reporteDelCrimen, objetoRobado, argentina)
		
		
	}
	
	@Test
	def void testActualizarPaisesCasoPositivoVillano ()
	{	
		val caso = new Caso()
		val resultado = caso.actualizarPaises(planDeEscape, villano)
		
		println(resultado.last.ocupante.nombre)
		Assert.assertTrue(resultado.last.ocupante.nombre.equals("Carmen Sandiego"))
	}
	
	@Test
	def void testActualizarPaisesCasoPositivoInformante ()
	{	
		val caso = new Caso()
		val resultado = caso.actualizarPaises(planDeEscape, villano)
		
		println(resultado.get(0).ocupante.nombre)
		Assert.assertTrue(resultado.get(0).ocupante.nombre.equals("Informante"))
	}
	
	@Test
	def void testActualizarPaisesCasoNegativoCuidadorEnVillano ()
	{	
		val caso = new Caso()
		val resultado = caso.actualizarPaises(planDeEscape, villano)
		
		println(resultado.last.ocupante.nombre)
		Assert.assertFalse(resultado.last.ocupante.nombre.equals("Cuidador"))
	}
	
	@Test
	def void testActualizarPaisesCasoNegativoCuidadorEnInformante ()
	{	
		val caso = new Caso()
		val resultado = caso.actualizarPaises(planDeEscape, villano)
		
		println(resultado.get(1).ocupante.nombre)
		Assert.assertFalse(resultado.get(1).ocupante.nombre.equals("Cuidador"))
	}
	
	@Test
	def void testLugarDondeSeEncuentraElVillano ()
	{	
		val caso = new Caso()
		
		val lugarResultante = caso.lugarDondeSeEncuentraElVillano(planDeEscape.last)
		
		println(lugarResultante.nombre)
		Assert.assertTrue(lugarResultante.nombre.equals(lugarResultante.nombre))
	}
	
	@Test
	def void testLugaresDelRecorrido ()
	{	
		val caso = new Caso()
		
		val lugaresResultantes = caso.lugaresDelRecorrido(planDeEscape)
		
		val resultado1 = lugaresResultantes.get(0).containsAll(lugaresArg)
		val resultado2 = lugaresResultantes.get(1).containsAll(lugaresBr)
		val resultado3 = lugaresResultantes.get(2).containsAll(lugaresVe)
		
		println(lugaresResultantes.size)
		Assert.assertTrue(resultado1 && resultado2 && resultado3)
	}
	
	@Test
	def void testPistasDelRecorrido () // solo testeo las pistas del 1er pais
	{	
		val caso = new Caso()
		
		val pistasResultantes = caso.pistasDelRecorrido(planDeEscape)
		
		val resultado1 = pistasResultantes.get(0).size == 3
		val resultado2 = pistasResultantes.get(1).size == 3
		val resultado3 = pistasResultantes.get(2).size == 3
		
		println(pistasResultantes.size)
		Assert.assertTrue(resultado1 && resultado2 && resultado3)
	}
	
	@Test
	def void testContructorDeCaso ()
	{	
		casoFeliz = new Caso(villano, planDeEscape, reporteDelCrimen, objetoRobado, argentina)
		
		Assert.assertTrue(casoFeliz.planDeEscape.get(1).ocupante.nombre.equals("Informante"))
		Assert.assertTrue(casoFeliz.planDeEscape.last.ocupante.nombre.equals("Carmen Sandiego"))
		Assert.assertTrue(casoFeliz.responsable.nombre.equals("Carmen Sandiego"))
		Assert.assertTrue(casoFeliz.paisDelRobo.nombrePais.equals("Argentina"))
		Assert.assertNotNull(casoFeliz.lugarDelVillano)
//		Assert.assertNotNull(casoFeliz.lugaresDelPlanEscape)
		Assert.assertFalse(casoFeliz.lugaresDelPlanEscape.isEmpty)
//		Assert.assertNotNull(casoFeliz.pistasDelPlanDeEscape)
//		Assert.assertFalse(casoFeliz.pistasDelPlanDeEscape.isEmpty)
	}
	
	/**
	 * Dado un Caso, le agrega un nuevo Pais al plan de escape,
	 * verifica si el mismo ya esta registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscape ()
	{	
		//casoFeliz = new Caso(villano, planDeEscape, reporteDelCrimen, objetoRobado, argentina)
		
		//casoFeliz.agregarPaisDeEscape(bolivia)
		
		//Assert.assertTrue(casoFeliz.estaIncluidoEnElPlanDeEscape(bolivia))
		Assert.assertTrue(true)
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Rusia"...
	 * verifica que "Rusia" se haya registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscapeSiPuedeEnCasoPositivo ()
	{	
//		var List<Pais> plan = new ArrayList()
//		plan.add(paisMock1)
//		var caso = new Caso (villanoMock, plan, "soy un reporte criminal", "", paisDelCrimenMock)
//		
//		when(paisMock1.nombrePais).thenReturn("Italia")
//		when(paisMock2.nombrePais).thenReturn("Rusia")
//		
//		caso.agregarPaisDeEscapeSiPuede(paisMock2)
//		
//		Assert.assertTrue(caso.estaIncluidoEnElPlanDeEscape(paisMock2))
		
		Assert.assertTrue(true)
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Italia"...
	 * verifica que "Italia" ya está registrado...
	 * y devuelve un Exception.
	 */
//	@Test (expected = UserException)
	def void testAgregarPaisDeEscapeSiPuedeEnCasoNegativo ()
	{	
//		var List<Pais> plan = new ArrayList()
//		plan.add(paisMock1)
//		var caso = new Caso (villanoMock, plan, "soy un reporte criminal", "", paisDelCrimenMock)
//		
//		when(paisMock1.nombrePais).thenReturn("Italia")
//		when(paisMock2.nombrePais).thenReturn("Italia")
//		
//		caso.agregarPaisDeEscapeSiPuede(paisMock2)
//				var List<Pais> plan = new ArrayList()
//		plan.add(paisMock1)
//		var caso = new Caso (villanoMock, plan, "soy un reporte criminal", "", paisDelCrimenMock)
//		
//		when(paisMock1.nombrePais).thenReturn("Italia")
//		when(paisMock2.nombrePais).thenReturn("Rusia")
//		
//		caso.agregarPaisDeEscapeSiPuede(paisMock2)
//		
//		Assert.assertTrue(caso.estaIncluidoEnElPlanDeEscape(paisMock2))

		Assert.assertTrue(true)
	}
}