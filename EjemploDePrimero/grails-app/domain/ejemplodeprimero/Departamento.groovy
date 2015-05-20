package ejemplodeprimero

class Departamento {

	String nombre
	static hasMany = [asignaturas: Asignatura, profesores:Profesor, seminarios:Seminario]
	
    static constraints = {
    }
	
	String toString(){
		nombre
	}
}
