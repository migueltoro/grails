package ejemplodeprimero

class Nota {

	enum TipoDeConvocatoria {PRIMERA,SEGUNDA,TERCERA}
	
	Integer fechaComienzoCurso
	TipoDeConvocatoria convocatoria
	Double valor
	Boolean mencionDeHonor
	Asignatura asignatura
	Expediente expediente
	
	String 	getCursoAcademico(){
		"${fechaComienzoCurso}-${fechaComienzoCurso+1}"
	}
	
	String getCalificacion(){
		def String r;
		switch(valor){
			case 0..<5 :  r = "Suspenso"
			break
			case 5..<7 :  r = "Aprobado"
			break
			case 7..<9 :  r = "Notable"
			break
			case 9..10 :  r = mencionDeHonor? "Sobresaliente" : "Matricula de Honor"			 
		}
		r
	}
	
    static constraints = {
		asignatura nullable:false
		expediente nullable:false
		valor range : 0..10
    }
}
