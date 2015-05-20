package ejemplodeprimero

class Profesor extends Persona {

    Despacho despacho
		
	static hasMany = [asignaturas:Asignatura, horarioDeTutorias: BloqueDeTutorias, tutorias :Tutoria]

	
	static constraints = {
    }
}
