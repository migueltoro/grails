package ejemplodeprimero

class Expediente {

	Alumno alumno
	static hasMany = [notas: Nota]
    static constraints = {
    }
	
	String toString(){
		"${id}"
	}
}
