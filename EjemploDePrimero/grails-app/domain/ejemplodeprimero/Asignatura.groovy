package ejemplodeprimero

class Asignatura {
	
	enum TipoDeAsignatura {ANUAL, PRIMER_CUATRIMESTRE, SEGUNDO_CUATRIMESTRE}
	
	String nombre
	String acronimo
	Integer curso
	Departamento departamento
	Double creditos
	TipoDeAsignatura tipo
	
	
	static belongsTo = Profesor
	static hasMany = [profesores:Profesor]

    static constraints = {
		acronimo matches : "[A-Z]{2}\\d{7}"
		curso range : 1..4
		departamento nullable:false
    }
	
	String toString(){
		acronimo
	}
}
