package ejemplodeprimero

class Centro {

	String nombre
	
	static hasMany = [grados:Grado,departamentos:Departamento,espacios:Espacio]
	
    static constraints = {
    }
	
	String toString(){
		nombre
	}
}
