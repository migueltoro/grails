package ejemplodeprimero

class Despacho extends Espacio {

    static hasMany = [profesores:Profesor]
	
	static constraints = {
    }
}
