#LPP: Práctica 5 - Pruebas Unitarias
[![Build Status](https://travis-ci.org/DanielRamosAcosta/prct09.svg?branch=master)](https://travis-ci.org/DanielRamosAcosta/prct09)
##Enunciado
Se nos pide dos cosas principales en base a la anterior práctica

1. Añadir el módulo comparable y sobrecargarlo (<=>) para que las referencias sean comparables.
2. Añadir el módulo enumerable y sobrecargarlo (each) para que la lista sea enumerable.

Usaremos una metodología TDD. Además de usar las herramientas de anteriores prácticas (como Git, Guard, Rake, etc), se usará Travis de integracción Continua.

#Práctica
**Travis CI** nos sirve para poder comprobar que nuestro código supera las pruebas en las versiones que especifiquemos en el fichero `.travis.yml`. El contenido para esta práctica será:

    language: ruby
    rvm:
      - 2.2.1 # La versión de ruby de mi ordenador
      - 2.2.0
      - 1.9.3
      - jruby-19mode # JRuby in 1.9 mode
      - rbx-19mode
    before_install: gem install bundler -v 1.10.6

En la imagen de la cabecera se puede ver el estado de Travis CI.