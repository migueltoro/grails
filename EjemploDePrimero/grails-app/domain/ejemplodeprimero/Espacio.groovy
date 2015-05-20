package ejemplodeprimero

class Espacio {
		
	Integer capacidad
	String modulo
	Integer numero
	Centro centro
	Integer planta

    String getAcronimo(){
		"${modulo}.${numero}"
	}
	
	static constraints = {
		modulo matches : "[A-Z]"
		planta range : 0..4
    }
	
	String toString(){
		getAcronimo()
	}
}
