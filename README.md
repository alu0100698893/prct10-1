#LPP: Práctica 10 - Programación Funcional
[![Build Status](https://travis-ci.org/DanielRamosAcosta/prct10.svg?branch=master)](https://travis-ci.org/DanielRamosAcosta/prct10) [![Coverage Status](https://coveralls.io/repos/DanielRamosAcosta/prct10/badge.svg?branch=master&service=github)](https://coveralls.io/github/DanielRamosAcosta/prct10?branch=master)
##Enunciado
Se nos pide cumplir con el formato del APA para representar las referencias bilbiográficas. Los requisitos son:

* **[R01]** - Nombres invertidos (apellidos, nombre).
* **[R02]** - La lista debe estar ordenada en base al apellido del autor.
* **[R03]** - Si el o los autores coiniden, hay que ordenar en base a la fecha de publicación (más antiguo primero).
* **[R04]** - Si un mismo autor apareza solo y además en un grupo y primero en éste, poner primero en el que salga solo (ordenar de menor a meyor tamaño).
* **[R05]** - Si el o los autores coiniden y la fecha también, ordenar en base al título. Asignar sufijo al año en este caso (A, B, C, ...).
* **[R06]** - Utilizar "&" para unificar varios autor-es de una misma referencia.
* **[R07]** - Después de la primera lína, añadir sangría francesa.
* **[R08]** - En mayúsculas la primera de las palabras principales de los títulos de las revista
* **[R09]** - Crear una clase que englobe a la clase lista y referencia

Usaremos la metodología TDD (*Test Driven Development*). Además de usar las herramientas de anteriores prácticas (como Git, Guard, Rake, Travis CI, etc), se usará Coveralls para poder comprobar que las pruebas se ejecutan sobre todo el código.

##Práctica
**Coveralls** nos sirve para poder comprobar que nuestro código tiene las pruebas necesarias como para comprobar todas y cada una de las líneas de nuestro código.

##Ejemplos
###Libro:

* **Autor**: Gabriel Garcia Marquez
* **Año de publicación**: 1981
* **Título**: Cronicas de una muerte anunciada.
* **Edición**: 4
* **Volumen**: 1
* **Lugar de publicación**: Colombia
* **Editorial**: La Oveja Negra
* **Resultado esperado**:

        García, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra.

###Artículo de un libro:

* **Autor 1**: Maria Persico Jimenez
* **Autor 2**: Pablo Perisco Jimenez
* **Año de publicación**: 1997
* **Título del artículo o capítulo**: El Estado
* **Editor 1**: Eduardo Villalba García
* **Editor 2**: Godalupe Magana Gonzáles
* **Título de la obra**: Acreditación en Chile: La experiencia de un lustro
* **Número de páginas del capítulo**: 27.
* **Edición**: 8
* **Volumen**: 2
* **Lugar de publicación**: Chile.
* **Editorial**: Creatividad, educacion y desarrollo
* **Resultado esperado**:

        Perisco, J. M. & Perisco, J. P. (1997). El Estado. En Villalba, G. E. & Magana, G. G. (Eds.), Acreditacion en Chile: la Experiencia de un Lustro (27) (8) (2). Chile: Creatividad, educacion y desarrollo.

###Artículo de periódico:

* **Autor 1**: Javier Palazón
* **Autor 2**: Laura Pajuelo
* **Fecha**: 15-11-2015
* **Título**: El primer movil con Android One
* **Periódico**: El Pais
* **Páginas del periódico**: 68
* **Resultado esperado**:

        Palazón, J. & Pajuelo, L. (15 de noviembre de 2015). El Primer Movil con Android One. El País, pp. 68.

###Documentos electrónicos:

* **Autor 1**: James Baker
* **Fecha**: 25-7-2000
* **Título**: Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.
* **Edición**: 6
* **Tipo de medio**: Web
* **Lugar de publicación**: España
* **Editor**: Banco Internacional de Reconstrucción y Fomento/BANCO MUNDIAL
* **Disponible en**: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf
* **Fecha de acceso**: 3-12-2015
* **Resultado esperado**:

        Backer. J. (25 de Julio de 2000). Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales (6), Web. Espana: Banco Internacional de Reconstrucción y Fomento/BANCO MUNDIAL. Disponible en: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf (3-12-2015).
