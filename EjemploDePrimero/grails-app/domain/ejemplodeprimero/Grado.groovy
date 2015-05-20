package ejemplodeprimero

class Grado {
	
	String nombre	
	Centro centro
	static hasMany = [asignaturas:Asignatura, profesores:Profesor]

    static constraints = {
    }
}
