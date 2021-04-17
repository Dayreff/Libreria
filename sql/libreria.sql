-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-10-2020 a las 04:23:22
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria.`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`) VALUES
(1, 'Stephen King'),
(3, 'Haruki Murakami'),
(6, 'Miguel de Cervantes'),
(7, 'Charles Dickens'),
(8, 'J. R. R. Tolkien'),
(9, 'Antoine de Saint-Exupéry'),
(10, 'Dan Brown'),
(11, 'Agatha Christie'),
(12, 'Lewis Carroll'),
(13, 'Henry Rider Haggard'),
(14, 'J. D. Salinger'),
(15, 'Paulo Coelho'),
(16, 'John Boyne'),
(17, 'Johanna Spyri'),
(18, 'Suzanne Collins'),
(19, 'Lucy Maud Montgomery'),
(20, 'Ana Swell'),
(21, 'Lucy Maud Montgomery”'),
(22, 'Umberto Eco'),
(23, 'Frank Baum'),
(24, 'E.B White'),
(25, 'James Dasher'),
(26, 'Carlos Cuahutemoc Sanchez'),
(27, 'Nikolai Ostrovsky'),
(28, 'Lev Tolstoi'),
(29, 'Carlo Collodi'),
(30, 'Judith Kerr'),
(31, 'E.L James'),
(32, 'Anna Frank'),
(33, 'Ernest Cline'),
(34, 'Harper Lee'),
(35, 'Rhonda Byrne'),
(36, 'Margaret Mitchell'),
(37, 'Gabriel Garcia Marquez'),
(38, 'Rick Warren'),
(39, 'Collen McCullough'),
(40, 'Julio Verne'),
(41, 'Jeff Kinney'),
(42, 'Jeff Kinney'),
(43, 'Cassandra Clare'),
(44, 'J.J Benitez'),
(45, 'Diana Wynne'),
(46, 'George Orwell'),
(47, 'C.S Lewis'),
(48, 'J.K Rowling');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE IF NOT EXISTS `carrito` (
  `id_stock` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  KEY `id_stock` (`id_stock`,`id_usuario`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `id_envio` int(11) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_envio`,`id_localidad`),
  KEY `id_forma_pago` (`id_forma_pago`),
  KEY `id_envio` (`id_envio`),
  KEY `id_localidad` (`id_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

DROP TABLE IF EXISTS `editorial`;
CREATE TABLE IF NOT EXISTS `editorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `nombre`) VALUES
(1, 'Del bolsillo'),
(2, 'Porrua'),
(3, 'MaxiTusquets'),
(4, 'Anagrama'),
(5, 'RM'),
(6, 'Planeta'),
(7, 'Destino'),
(8, 'EMU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

DROP TABLE IF EXISTS `envio`;
CREATE TABLE IF NOT EXISTS `envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `costo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `nombre`, `costo`) VALUES
(1, 'Fedex: 3 días', 120),
(2, 'Estafeta: 8 días', 60),
(3, 'UPS: 4 días', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadepago`
--

DROP TABLE IF EXISTS `formadepago`;
CREATE TABLE IF NOT EXISTS `formadepago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formadepago`
--

INSERT INTO `formadepago` (`id`, `nombre`) VALUES
(1, 'Credito'),
(2, 'Debito'),
(3, 'PayPal'),
(4, 'BitCoin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Romance'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Horror'),
(6, 'Historia'),
(7, 'Psicologico'),
(8, 'Infantil'),
(9, 'Fabula'),
(10, 'Fantasía'),
(11, 'Social'),
(12, 'Ciencia Ficción'),
(13, 'Aventura'),
(15, 'Misterio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(3000) NOT NULL,
  `imagen` text NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_editorial` int(11) NOT NULL,
  `id_genero_1` int(11) NOT NULL,
  `id_genero_2` int(11) NOT NULL,
  `id_genero_3` int(11) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_autor` (`id_autor`),
  KEY `id_editorial` (`id_editorial`),
  KEY `id_genero_1` (`id_genero_1`),
  KEY `id_genero_2` (`id_genero_2`),
  KEY `id_genero_3` (`id_genero_3`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `descripcion`, `imagen`, `id_autor`, `id_editorial`, `id_genero_1`, `id_genero_2`, `id_genero_3`, `precio`) VALUES
(1, 'It', 'Un macabro suceso azota las calles de Derry, una extraña ente se apodera de los niños cuyos padres han sido descuidados.', '../media/livres/it.jpg', 1, 1, 4, 5, 7, 499),
(2, 'Kafka en la orilla', 'Su mismo padre definió que su futuro sería el ocaso de Edipo, ahora con 15 años Kakka decide dejar su hogar y enfrentarse a la oscura realidad. Plagada de un viaje metafisico y romantico.', '../media/livres/kafka.jpg', 3, 3, 3, 7, 9, 499),
(3, 'Don Quijote', 'Don Quijote de la Mancha es una novela escrita por el español Miguel de Cervantes Saavedra. Publicada su primera parte con el título de El ingenioso hidalgo don Quijote de la Mancha a comienzos de 1605, es la obra más destacada de la literatura española y una de las principales de la literatura universal, además de ser la más leída después de la Biblia', '../media/livres/quijote.jpg', 6, 7, 3, 6, 7, 349),
(4, 'Historia de dos ciudades', 'Es una novela del escritor británico Charles Dickens. En esta novela histórica se narra la vida en el siglo XVIII, en la época de la Revolución francesa', '../media/livres/ciudades.jpg', 7, 2, 2, 3, 7, 350),
(5, 'El señor de los anillos', 'Su historia se desarrolla en la Tercera Edad del Sol de la Tierra Media, un lugar ficticio poblado por hombres y otras razas antropomorfas como los hobbits, los elfos o los enanos, así como por muchas otras criaturas reales y fantásticas.', '../media/livres/it.jpg', 8, 1, 9, 1, 10, 499),
(24, 'El principito', 'El principito es un cuento poético que viene acompañado de ilustraciones hechas con acuarelas por el mismo Saint-Exupéry. En él, un piloto se encuentra perdido en el desierto del Sahara después de que su avión sufriera una avería, pero para su sorpresa, es allí donde conoce a un pequeño príncipe proveniente de otro planeta. La historia tiene una temática filosófica.', '../media/livres/principito.jpg', 9, 5, 12, 10, 8, 80),
(25, 'El Hobbit', 'El reino enano de Erebor, también conocido como la Montaña Solitaria, fue fundado en el año 1999 de la Tercera Edad del Sol, por el rey Thráin I, quien acababa de huir con parte de su pueblo de Khazad-dûm tras la aparición de un balrog. Siete siglos después, el dragón Smaug llegó a Erebor.', '../media/livres/hobbitt.jpg', 8, 1, 12, 1, 9, 399),
(26, 'Inferno', 'El profesor de la Universidad de Harvard Robert Langdon se despierta en un hospital con una herida en la cabeza y no recuerda nada de los últimos días. Su último recuerdo es caminar en el campus de Harvard, pero rápidamente se da cuenta de que ahora está en Florencia. Sienna Brooks, una de las médicas que atienden, le dice que sufrió una conmoción cerebral por ser rozado por una bala, por lo que no tiene recuerdos de los últimos dos días. De repente, Vayentha, una asesina que ha estado siguiendo a Robert, irrumpe en el hospital, le dispara al médico encargado de la atención de Robert y se acerca a su habitación. Sienna agarra a Robert y huyen a su apartamento', '../media/livres/inferno.jpg', 10, 6, 1, 3, 12, 299),
(27, 'Diez Negritos', 'Ocho personas —el juez Lawrence Wargrave, la institutriz Vera Claythorne, el aventurero Philip Lombard, el general retirado John MacArthur, la solterona Emily Brent, el playboy Anthony Marston, el doctor Edward Armstrong y el detective privado y expolicía William Blore— reciben una invitación para pasar unas vacaciones en la isla del Negro (inspirada en la isla Burgh). Esta isla se encuentra en la costa inglesa, en la región de Devon. La invitación es sumamente atractiva, ya que se trata de una pequeña isla en la que solo existe una hermosa y gran mansión que fue construida por un millonario estadounidense, quien luego la vendió y nadie sabe hoy quién es el nuevo dueño. A cada uno de los invitados les llega la invitación por carta, firmada por una persona que dice haberlos conocido en el pasado en una situación que para todos es familiar, aunque no recuerdan bien a la persona en cuestión. Sin embargo, todos aceptan gustosos la invitación, ya que la persona que los invita describe detalladamente el lugar y las circunstancias en que los conoció.', '../media/livres/negritos.jpg', 11, 7, 11, 6, 3, 238),
(28, 'Las aventuras de Alicia en el país de las maravillas', 'La historia relatada en el libro tuvo tres fases. La primera y más importante comenzó durante un paseo en barco por el río Támesis el 4 de julio de 1862. En el barco viajaban el matemático y reverendo Charles L. Dodgson y las tres hermanas Liddell: Lorina Charlotte, Alice y Edith, de trece, dieciocho años, respectivamente. El viaje por el río había comenzado en el Puente Folly, cerca de Oxford, Inglaterra, y recorrería ocho kilómetros, hasta Godstow, antes de volver a Christ Church, en Oxford. Según el diario de Dodgson, el viaje era tan aburrido que las niñas pidieron al profesor.', '../media/livres/alicia.jpg', 12, 6, 12, 9, 5, 299),
(29, 'Ella', 'Ella (subtitulada Historia de aventuras) es la segunda novela de H. Rider Haggard, e inicia una tetralogía cuya protagonista principal es Ayesha, «la que debe ser obedecida». Según una encuesta contemporánea, fue considerada por el público la mejor novela fantástica del siglo XIX.', '../media/livres/ella.jpg', 13, 6, 3, 2, 11, 199),
(30, 'El león, la bruja y el ropero', 'La trama transcurre durante la Segunda Guerra Mundial. Para protegerlos de los bombardeos, cuatro hermanos: Peter, Susan, Edmund y Lucy Pevensie son llevados a la casa rural del profesor Digory Kirke.', '../media/livres/leon.jpg', 47, 6, 9, 10, 12, 500),
(31, 'El código Da Vinci', 'El libro narra los intentos de Robert Langdon, Profesor de Iconografía Religiosa de la Universidad Harvard, para resolver el misterioso asesinato de Jacques Saunière ocurrido en el Museo del Louvre en París. El cuerpo de Saunière fue encontrado en el ala Denon del Louvre en la postura del Hombre de Vitruvio (dibujo realizado por Leonardo da Vinci) con un mensaje críptico escrito a su costado y un pentáculo dibujado en el pecho con su propia sangre. La interpretación que realiza tanto Langdon como la agente francesa Sophie Neveu, nieta de Saunière, los llevan a analizar otras obras como la Mona Lisa.', '../media/livres/codigo.jpg', 10, 1, 12, 3, 1, 550),
(32, 'El guardián entre el centeno', 'La novela cuenta la historia de Holden Caulfield, un joven neoyorquino de 16 años que acaba de ser expulsado de Pencey Prep, su escuela preparatoria. Está narrada en la voz de Holden, un joven que se ha caracterizado por tener malos resultados en sus estudios (ya había sido expulsado de varios colegios) y quien cree que la mayoría de la gente es «falsa», salvo algunas excepciones (se destaca el gran amor que siente hacia sus hermanos, uno de los cuales está muerto).', '../media/livres/guardian.jpg', 14, 1, 3, 2, 6, 200),
(34, 'El Alquimista', 'En Andalucía, un joven pastor pasea por las llanuras contemplando la naturaleza. El joven Santiago tiene un sueño repetido mientras descansa con sus ovejas en un pasto andaluz, por lo que decide acudir a una gitana para que le interprete el sueño. Después de quedar descontento con la respuesta que recibe, se sienta en un banco de la plaza a leer un libro y conoce a un anciano que dice ser el rey de Salem. Tras tener una conversación con él, en la que le deja claro que es alguien muy especial, Santiago decide emprender un viaje por el norte de África en busca de un tesoro. En su camino conocerá a un sinfín de personas que, como él, buscan su propia Leyenda Personal.', '../media/livres/alquimista.jpg', 15, 1, 13, 1, 12, 300),
(35, 'El niño con el pijama de rayas', 'La acción se narra desde el punto de vista de Bruno, el hijo de ocho años  de un militar de alto rango nazi. Él y su familia se ven obligados a abandonar Berlín cuando a su padre lo destinan para trabajar en el campo de concentración de Auschwitz. La familia acepta el cambio pero no de buen grado', '../media/livres/pijama.jpg', 16, 1, 8, 3, 7, 299),
(36, 'Heidi', 'Heidi es una niña huérfana (y cuyo nombre verdadero es igual al de su madre, Adelheid [Adelaida]), queda al cuidado de su joven tía Dette. Apenas la mujer encuentra una buena oportunidad de trabajo, lleva a la niña a vivir a la aldea de Dörfli (literalmente en el dialecto suizo alemán “pueblito”), en la comuna suiza de Maienfeld con su abuelo, a quien no conocía, y a quien los habitantes llamaban El Viejo de los Alpes', '../media/livres/heidi.jpg', 17, 2, 8, 3, 9, 89),
(37, 'Los juegos del hambre', 'Los juegos del hambre se desarrolla en un país llamado Panem, lo que es en realidad una civilización postapocalíptica ubicada en lo que antes era América del Norte. El territorio se comprende de El Capitolio, que es la central del país, y trece estados que están bajo su control, los cuales son llamados distritos. Hace cerca de 100 años, el Distrito 13 inició una rebelión ante El Capitolio, donde se perdieron una enorme cantidad de vidas, además de la destrucción total de dicho distrito. Como castigo para evitar otros futuros levantamientos, El Capitolio creó un evento llamado «Los Juegos del Hambre», en donde anualmente los doce distritos sobrantes deben enviar dos tributos, un chico y una chica con edades entre los doce y los dieciocho para que lucharan a muerte en una arena hasta que solamente quedara uno, mientras todo Panem los observa a través de televisión.', '../media/livres/jeugos.jpg', 18, 1, 1, 3, 12, 200),
(38, 'Ana de las Tejas Verdes', 'Marilla Cuthbert y Matthew Cuthbert, dos hermanos de mediana edad que viven juntos en Tejas Verdes, una granja en un pueblecito llamado Avonlea, en la Isla del Príncipe Eduardo, deciden adoptar a un muchacho huérfano de un orfanato de Nueva Escocia para que les ayude con la granja. Debido a una serie de desgracias y malentendidos, la que termina en Tejas Verdes es una precoz e inteligente chica de once años llamada Anne Shirley. Anne es brillante y perspicaz, impaciente por ser complaciente, pero descontenta con su nombre, su piel pálida llena de pecas, y sobre todo con sus largas trenzas de pelo rojo. Anne es una niña con una imaginación muy fértil, que llenará de alegría las vidas de los dos hermanos así como del resto de habitantes de Avonlea.', '../media/livres/anne.jpg', 21, 4, 8, 3, 11, 100),
(42, 'Belleza Negra', 'La obra es narrada en primera persona como una memoria autobiográfica contada por un caballo llamado Azabache (en inglés original, Black Beauty) -partiendo con sus alegres días como potranco en una granja inglesa siguiendo con su difícil vida en Londres tirando cabriolés, hasta su feliz retirada en el país. Durante su camino, se encuentra con muchas dificultades y cuenta muchas historias de crueldad y amabilidad.', '../media/livres/belleza.JPG', 20, 4, 7, 3, 9, 150),
(43, 'El nombre de la rosa', 'En su anterior obra teórica, Lector in fabula, Eco ya reseñaba en una llamada a pie de página la «polémica sobre la posesión de bienes y la pobreza de los apóstoles que se planteó en el siglo xiv entre los franciscanos espirituales y el pontífice». En dicha polémica destacó el polémico pensador franciscano Guillermo de Ockham, quien estudió la controversia entre los espirituales y el papado sobre la doctrina de la pobreza apostólica, principal para los franciscanos, pero considerada dudosa y posiblemente herética tanto por el papado como por los dominicos.', '../media/livres/hombre.jpg', 22, 4, 15, 6, 3, 150),
(44, 'El mago de Oz', 'Este libro, que narra las aventuras de una muchacha llamada Dorothy Gale en la tierra de Oz, constituye una de las historias más conocidas de la cultura popular norteamericana y ha sido traducido a muchos idiomas. Gracias al gran éxito de El maravilloso mago de Oz, L. Frank Baum escribió trece libros más sobre la tierra de Oz.”,”$179”); ”Lyman Frank Baum,”George Company', '../media/livres/mago.jpg', 23, 2, 8, 13, 1, 350),
(45, 'La telaraña de Charlotte', 'La novela narra la historia de un cerdo llamado Wilbur y su amistad con una araña llamada Charlotte. Cuando Wilbur va a sufrir la matanza, Charlotte escribe mensajes alabando Wilbur en su telaraña para convencer al granjero que le permitiera vivir.', '../media/livres/tela.jpg', 24, 4, 8, 13, 9, 180),
(46, 'Maze Runner', 'Thomas y sus amigos, no tiene recuerdos del mundo exterior, más que sueños acerca de una organización conocida como C.R.U.E.L. Solo uniendo los fragmentos de su pasado, junto a las pistas que descubre en el laberinto, Thomas puede descubrir su propósito y una manera de escapar', '../media/livres/maze.jpg', 25, 6, 1, 3, 12, 480),
(47, 'Harry Potter y las Reliquias de la Muerte', 'Harry Potter cumple la mayoría de edad, por lo que la protección mágica que tenía en casa de los Dursley se pierde. Luego de que lord Voldemort intentara emboscarlos, los tres protagonistas se refugian en La Madriguera, donde reciben la herencia que les dejó Albus Dumbledore: una snitch, el desiluminador, un libro de cuentos escrito en runas (Los cuentos de beedle el bardo, donde encuentran el cuento de las reliquias de la Muerte) y la espada de Godric Gryffindor que también les había sido heredada en el testamento, pero el ministro de magia se negó a dárselas por no ser algo de lo que Dumbledore pudiera disponer.', '../media/livres/reliquias.jpg', 48, 6, 13, 12, 1, 300),
(48, 'El simbolo secreto', 'Robert Langdon, profesor de simbología en la Universidad de Harvard, recibe un encargo del asistente de su amigo Peter Solomon: dar una conferencia sobre masonería en la sala más importante del Capitolio de los Estados Unidos. Además, Robert debe traer consigo un pequeño objeto que Solomon, masón de grado 33 y director del Smithsonian, le pidió que guardara hace tiempo. Para su sorpresa, cuando el profesor llega a dicha sala se encuentra con que ésta está vacía.', '../media/livres/simbolo.jpg', 10, 6, 15, 1, 12, 680),
(49, 'Sangre de campeon', 'El libro está compuesto de varios capítulos, que son directrices para formar a la persona en valores como el respeto, el manejo de la libertad, la forma correcta para tomar decisiones, la responsabilidad, la sinceridad, la solidaridad, entre otros.,\r\nEl objetivo del autor es mostrar, mediante la vida de Felipe y su familia, y de como trata de superarse a sí mismo para convertirse en una mejor persona.', '../media/livres/sangre.jpg', 26, 7, 11, 13, 11, 99),
(50, 'Ángeles y demonios', 'El profesor de simbología Robert Langdon, recibe una misteriosa llamada a las tantas de la madrugada y se ve envuelto en una persecución en la que tratará de evitar la destrucción de la Ciudad del Vaticano. Acompañado de la científica Vittoria Vetra, ambos deberán encontrar la guarida de los Illuminati para detener a un hombre cuyo propósito es hacer explotar la antimateria y destruir el altar principal de la Iglesia junto a todas las personas que estén a su alrededor.', '../media/livres/angel.jpg', 10, 6, 7, 15, 12, 599),
(51, 'Así se templó el acero', 'Así se templó el acero narra la vida del joven Pavka Korchaguin, quien sufre en su infancia las vicisitudes y la pobreza de la mayoría del pueblo ruso, viéndose obligado a dejar la escuela y comenzar a trabajar. El triunfo de la Revolución de Octubre constituye un cambio trascendental en la vida de Pavka, quien se entrega con toda su voluntad a las tareas de la Revolución, y no desfallece por difíciles que sean las circunstancias y continúa la lucha aun cuando se quebrante su salud.', '../media/livres/acero.jpg', 27, 2, 15, 6, 1, 189),
(52, 'Guerra y paz', 'En esta novela hay tres personajes centrales, incluyendo: el príncipe Andréi Bolkonsky, inteligente y erudito aunque descontento; el conde Pierre Bezújov, el cual es el heredero de una fortuna vasta y que acarrea los problemas de ser una persona importante en la sociedad rusa además de un amigo del príncipe Andréi; y la condesa Natasha Rostova, una joven bellísima y simpática, de una familia con muchas deudas.”,”$249”); ”Lev Tolstoi”,”El mensajero ruso', '../media/livres/guerra.JPG', 27, 7, 2, 3, 11, 170),
(53, 'Las aventuras de Pinocho', 'El carpintero Geppetto es un humilde hombre que siempre había deseado tener un hijo. Un buen día se le ocurre la genial idea de tallar una marioneta de madera con la forma de un niño de verdad. Antes de estar terminada, esta cobra vida inesperadamente y se convierte en un niño travieso y desobediente al que Geppetto llama Pinocho (o Pinocchio en la versión original).', '../media/livres/pinocho.jpg', 29, 6, 8, 12, 10, 570),
(54, 'Cuando Hitler robo el conejo rosa', 'Los protagonistas, Max y Anna, son dos niños alemanes que viven en Berlín con sus padres durante el acceso de Adolf Hitler al poder. Desde un principio sabemos que son judíos, pues su padre les ha explicado recientemente que proceden del pueblo hebreo. Tienen 9 y 12 años, respectivamente, y su familia vive en una gran casa de Berlín, donde también viven Bertha, empleada de la familia, y Heimpi, ama de llaves y gobernanta, cuyo verdadero nombre es Heimpel, y cuyo cometido no es otro que cuidar de Anna y Max. Los niños tienen varios amigos. La mejor amiga de Anna se llama Elsbeth; el mejor amigo de Max es Gunther. El padre de los dos niños es un famoso escritor alemán que saca adelante a la familia con sus artículos en la prensa y sus libros. La madre pasa las jornadas tocando el piano y los niños asisten a los mejores colegios berlineses.', '../media/livres/Hitler.jpg', 30, 5, 6, 12, 3, 420),
(55, 'Kane y Abel', 'William Lowell Kane es hijo de un millonario de Boston. Abel Rosnovski es un inmigrante polaco sin un quinto. Dos hombres, nacidos el mismo día en extremos opuestos del mundo; sus caminos destinados a cruzarse en su lu cha sin cuartel para amasar una fortuna', '../media/livres/kane.jpg', 41, 4, 6, 11, 3, 130),
(56, '50 sombras de Grey', 'Cincuenta sombras de Grey narra la historia de Anastasia «Ana» Steele, una joven estudiante de 21 años que cursa la carrera de Literatura en la Universidad de Washington, y que vive con su mejor amiga, Katherine «Kate» Kavanagh, quien escribe para el periódico estudiantil de su universidad. Debido a un resfriado, Katherine persuade a Ana para que tome su lugar en la entrevista que le haría a Christian Grey, un joven empresario de veinticuatro años, apuesto y exitoso. Ana se ve atraída inmediatamente por él, pero también lo encuentra intimidante. Como resultado, la entrevista no sale del todo bien y le deja a Grey una mala impresión —o al menos eso es lo que ella cree—. Ana trata de consolarse a sí misma con la idea de que lo más probable es que no lo volverá a ver. Sin embargo, se sorprende cuando Grey aparece en la ferretería donde ella trabaja. Durante la compra de varios artículos, incluyendo ataduras de cables y cuerdas, Ana le informa a Grey que Katherine quiere fotografías de él para el artículo. Grey le da a Ana su número de teléfono, lo que hace pensar a Ana que ella le gusta. Katherine presiona a Ana para que llame a Grey y organice una sesión de fotos con su amigo el fotógrafo José Rodríguez.', '../media/livres/sombras.jpg', 31, 3, 15, 3, 2, 500),
(57, 'Diario de Ana Frank', 'Oculta con su familia, otra familia judía (los van Pels) y un dentista (Dussel), en una buhardilla de unos almacenes de Ámsterdam durante la ocupación nazi de Países Bajos, Ana Frank con trece años, cuenta en su diario, al que llamó «Kitty», la vida del grupo. Ayudados por varios empleados de la oficina, permanecieron durante más de dos años en el achterhuis (conocido como «la casa de atrás») hasta que, finalmente, fueron delatados y detenidos. Ana escribió un diario entre el 12 de junio de 1942 y el 1 de agosto de 1944. El 4 de agosto de 1944, unos vecinos (se desconocen los nombres) delatan a los ocho escondidos. Estos últimos fueron llevados a diferentes campos de concentración. Además del Diario, escribió varios cuentos que han sido publicados paulatinamente desde 1960. Su hermana, Margot Frank, también escribió un diario, pero nunca se encontró ningún rastro de este.', '../media/livres/ana.jpg', 32, 1, 6, 3, 1, 100),
(58, 'Ready player One', 'En el año 2044 el mundo es un desastre. Las fuentes de energía están prácticamente agotadas, hay superpoblación y el precio del combustible está por las nubes. En medio de una enorme depresión económica a nivel mundial la mayoría de la gente subsiste como puede. Sin embargo, un videojuego de realidad virtual llamado OASIS proporciona la vía de escape que las personas necesitan. La gente dedica más tiempo al juego que a la vida real misma. El juego ofrece todas las posibilidades imaginables y cualquier cosa es posible, tanto jugar como trabajar.', '../media/livres/radio.JPG', 33, 6, 1, 12, 3, 399),
(59, 'Matar a un ruiseñor', 'La historia transcurre a lo largo de un período de tres años durante la Gran Depresión en el pueblo ficticio de Maycomb, Alabama. La narradora es Scout Finch, de seis años de edad, quien vive con su hermano mayor Jem y su padre Atticus, un abogado viudo de mediana edad. Jem y Scout entablan amistad con un niño llamado Dill que está de visita en Maycomb durante el verano y que se hospeda en la casa de su tía.', '../media/livres/matar.JPG', 34, 2, 3, 2, 11, 599),
(60, 'El secreto', 'El libro comienza introduciendo y explicando los mecanismos de la ley de la atracción, y luego describe ejemplos históricos de su aplicación incluyendo personajes históricos que supuestamente se beneficiaron con su aplicación.\r\nSe destacan la gratitud y la visualización como los dos procesos más poderosos para ayudar a hacer que los deseos se manifiesten. La autora ofrece varias técnicas para el proceso de visualización, así como ejemplos de personas que se dice que la han utilizado con éxito para lograr que sus sueños se manifiesten.', '../media/livres/secreto.jpg', 35, 3, 2, 3, 15, 120),
(61, 'Lo que el viento se llevó', 'Scarlett está enamorada del heredero de otra familia aristócrata, Ashley Wilkes, del mismo condado de Georgia donde vive su familia; pero éste se casa con otra mujer, Melanie Hamilton (que paradójicamente terminará siendo la mejor amiga de Scarlett). Al mismo tiempo, Rhett Butler, un aventurero cínico y desvergonzado expulsado del seno de su familia (otra familia aristócrata, pero de Carolina del Sur); se enamora de ella y la trama se desarrolla en medio de la lucha de Rhett por conquistarla y el empeño de Scarlett por negar su creciente atracción por él, obstinándose en seguir enamorada de Ashley.', '../media/livres/viento.jpg', 36, 2, 2, 3, 7, 170),
(62, 'Cien años de soledad', 'El libro narra la historia de la familia Buendía a lo largo de siete generaciones en el pueblo ficticio de Macondo. José Arcadio Buendía y Úrsula Iguarán son un matrimonio de primos que se casaron llenos de presagios y temores por su parentesco y el mito existente en la región de que su descendencia podía tener cola de cerdo.', '../media/livres/cien.jpg', 37, 6, 15, 7, 10, 300),
(63, 'Una vida con proposito', 'El libro está destinado a ser leído como una inspiración diaria, con cada uno de los 40 capítulos cortos leídos en días consecutivos. Cada capítulo contiene una sección de aplicación personal al final, un versículo para recordar, y una pregunta a considerar en el transcurso de ese día. Rick Warren describió su libro. La primera oración, y el resto del capítulo continúa explicando cómo la búsqueda de realización personal, satisfacción y significado sólo puede encontrarse en comprender y hacer aquello para lo que Dios te puso en la Tierra. Las 5 secciones principales del libro son adoración, Iglesia, discipulado, ministerio y la Misión. En las últimas versiones del libro, 2 capítulos adicionales fueron añadidos sobre las 2 razones más grandes por las que los cristianos no viven vidas con propósito, la envidia y el ', '../media/livres/vida.jpg', 38, 1, 13, 11, 7, 190),
(64, 'El pájaro espino', 'En esta inolvidable novela, McCullough narra una historia que comienza en 1915 y está llena de sueños, secretos, pasiones oscuras y amor prohibido en el interior de Australia.', '../media/livres/espino.jpg', 39, 2, 3, 1, 2, 15),
(65, 'La orre oscura', 'En la historia, Roland Schain es el último miembro electo de una prestigiosa orden de caballería conocido como pistoleros y el último de la línea de , el análogo del mundo del Rey Arturo. Políticamente organizada entre las líneas de una sociedad feudal, comparte características tecnológicas y sociales con el viejo oeste americano pero es también mágica. Muchos de los aspectos mágicos se desvanecieron de Mundo Medio, pero quedan restos, al igual que reliquias de una sociedad tecnológicamente avanzada.', './media/livres/torre.jpg', 1, 1, 5, 12, 1, 300),
(66, '1922', '1922 es un relato en primera persona de Wilfred James, el narrador no fiable de nuestra historia. Escribe una larga confesión del asesinato de su esposa, Arlette, en Hemingford Home, Nebraska en 1922. Wilfred posee treinta y dos hectáreas de cultivo que han estado en posesión de su familia por generaciones. Su esposa posee otras cuarenta hectáreas contiguas que su padre le dejó en herencia.', '../media/livres/1922.jpg', 1, 1, 4, 5, 15, 190),
(67, 'El resplandor', 'Al escritor Jack Torrance le es ofrecido un empleo como cuidador del hotel Overlook durante el invierno junto a su familia. Este trabajo parece ser una oportunidad perfecta para demostrar que está totalmente curado de su alcoholismo. El hotel está situado en lo alto de las montañas de Colorado y el pueblo más cercano es Sidewinder, aproximadamente a 65 kilómetros del lugar. Los caminos son intransitables por el invierno, por lo que el lugar está prácticamente aislado del mundo, especialmente durante las fuertes tormentas.', '../media/livres/resplandor.jpg', 1, 1, 4, 5, 15, 350),
(68, 'Viaje al centro de la tierra', 'El personaje principal de la historia, el joven Axel, reside en una vieja casa situada en la Königstrasse, en Hamburgo, junto a su tío Otto Lidenbrock, un prestigioso profesor de mineralogía, a quien describe como un hombre temido por su fuerte carácter pero muy original, su pareja Gräuben y su sirvienta, Marta. Un día el profesor le llama a su despacho, donde le enseña un manuscrito de gran valor del Heimskringla, de Snorri Sturluson.', '../media/livres/viaje.jpg', 40, 5, 12, 13, 1, 150),
(69, 'El diario de Greg', 'Ser casi adolescente puede resultar muy fastidioso. Nadie lo sabe mejor Greg Heffley, inmerso en el duro ambiente del instituto, donde los chicos bajitos que aún no han pegado el estirón tienen que compartir los pasillos con grandullones que ya se afeitan dos veces al día. En Diario de Greg, el escritor y dibujante Jeff Kinney nos presenta a su antihéroe. Como éste dice en su diario: *No crean que voy a estar todo el tiempo. Por suerte para todos, lo que Greg Heffley dice que va a hacer y lo que realmente hace son cosas muy diferentes.', '../media/livres/greg.jpg', 41, 2, 8, 11, 13, 180),
(70, 'Princesa mecánica', 'Tessa Gray debería ser feliz - ¿no lo son todas las novias? Mientras se va preparando para su boda, una red de sombras empieza a ceñirse sobre los cazadores de sombras del Instituto de Londres. Un nuevo demonio aparece, uno ligado por sangre y a los secretos de Mortmain, el hombre que planea usar a su ejército de autómatas despiadados, los Artefactos Infernales, para destruir a los cazadores de sombras. Mortmain necesita solo un último objeto para completar su plan. ', '../media/livres/princesa.jpg', 43, 6, 2, 3, 1, 680),
(71, 'El caballo de Troya', 'El libro se presenta como si fuera el testimonio de un oficial estadounidense que participa en un proyecto secreto. Dicha misión consiste en un viaje en el tiempo para conocer alguno de los momentos considerados importantes en el pasado de la Humanidad, entre ellos la época de Jesús de Nazaret.', '../media/livres/troya.jpg', 44, 1, 1, 3, 13, 399),
(72, 'El castillo ambulante', 'El castillo ambulante explora diversos temas habituales en la literatura. Estos incluyen el destino, la juventud, el valor y el amor. Los dos primeros son centrales en el desarrollo de Sophie, la protagonista. Desde el principio, su idea del destino le hace creer que está condenada a fracasar por ser la mayor de tres hermanas.', '../media/livres/castillo.JPG', 45, 3, 13, 12, 8, 300),
(73, '1984', 'La novela se desarrolla en el año 1984 y siguientes en un futuro Londres, parte de una región llamada Franja Aérea 1, «... que alguna vez fue llamada Inglaterra o Britania» integrada, a su vez, en un inmenso estado colectivista: Oceanía.La sociedad de Oceanía está dividida en tres grupos. Los miembros del Partido Único, los miembros del Consejo dirigente o círculo interior del partido y una masa de gente, a la que el Partido mantiene pobre y entretenida para que no puedan ni quieran rebelarse, los proles (proletarios).', '../media/livres/1984.JPG', 46, 8, 15, 11, 7, 89),
(86, 'Tokyo Blues', 'En esta novela, Haruki Murakami sugiere que no sólo es posible distraerse o resignarse al dolor de la existencia. Después de un largo periplo, Watanabé llega esta conclusiónNi la verdad ni la sinceridad, ni la fuerza.', '../media/livres/tokio.jpg', 3, 3, 7, 3, 12, 199),
(87, 'Los años de peregrinación del chico sin color', 'Cuando Tsukuru Tazaki era adolescente, le gustaba sentarse en las estaciones a ver pasar los trenes. Ahora, con treinta y seis años, es un ingeniero que diseña y construye estaciones de tren, pero en el fondo no ha dejado de ver pasar los trenes.', '../media/livres/chico.jpg', 3, 3, 7, 3, 12, 299);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`) VALUES
(1, 'Guadalajara'),
(2, 'San Luis Potosi'),
(3, 'Chiapas'),
(4, 'Colima'),
(5, 'Campeche'),
(6, 'Guanajuato'),
(7, 'Morelia'),
(8, 'Tepic'),
(9, 'Puebla de Zaragoza'),
(10, 'Cheumal'),
(11, 'CDMX'),
(12, 'Hermosillo'),
(13, 'Villahermosa'),
(14, 'Ciudad Victoria'),
(15, 'Tlaxcala'),
(16, 'Xalapa'),
(17, 'Merida'),
(18, 'Zacatecas'),
(19, 'Mexicali'),
(20, 'Aguascalientes'),
(21, 'La paz'),
(22, 'Tuxlta Gutierres'),
(23, 'Saltillo'),
(24, 'Victoria Durango');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` tinyint(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `no_tarjeta` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`id_forma_pago`) REFERENCES `formadepago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libros_ibfk_3` FOREIGN KEY (`id_genero_1`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libros_ibfk_4` FOREIGN KEY (`id_genero_2`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libros_ibfk_5` FOREIGN KEY (`id_genero_3`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
