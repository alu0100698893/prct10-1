require 'linkedRef/referencia'

# Se sigue la siguiente convención de nombre:
# Autor[,...]. (año).
# Título.
# Disponible en {url}

# Baker, J. (2000).
# Evaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.
# Disponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf

# Martínez, E. (2005).
# Estudio de la integración de los medios informáticos en los currículos de educación infantil y primaria.
# Disponible en http://site.ebrary.com/lib/interpuertoricosp

# Michael, S. (2008).
# Programming Language Pragmatics
# Disponible en http://infoman.teikav.edu.gr/~stpapad/ScottCompilers.pdf

module LinkedRef
	class DocumentoElectronico < Referencia
		def initialize()
		end
	end
end