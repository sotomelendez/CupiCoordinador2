class Materia < ActiveRecord::Base
#attr_accessible :id,:idu,:nombre

def lineamateria
	"#{idu} - #{nombre}"
end

end
