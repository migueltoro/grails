package ejemplodeprimero

class Tutoria {

	def tutoriaService
	
    Profesor profesor
	Alumno alumno
	Date fecha
	Integer horaDeComienzo
	Integer minutoDeComienzo
	Integer duracion

	static constraints = {
		profesor nullable:false, validator : {p,obj-> 
			obj.tutoriaService.incluyeTutoria(p,obj) &&
			!obj.tutoriaService.overlapsTutorias(p,obj)
		} 
		alumno nullable:false
		fecha min: new Date()
		horaDeComienzo range : 8..20
		minutoDeComienzo inList: [0,15,30,45]	
		duracion inList: [15,30,45,60]		
	}
}
