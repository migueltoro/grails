package ejemplodeprimero

class Alumno extends Persona {
	
	Expediente expediente
	
	static hasMany = [asignaturas:Asignatura]

    static constraints = {
		expediente nullable : true
    }
}
