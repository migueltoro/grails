package ejemplodeprimero

import groovy.time.TimeCategory

class Persona {
	
	String nombre
	String primerApellido
	String segundoApellido
	String dni
	Date fechaDeNacimiento
	String email
	
	Integer getEdad(){
	    Integer r;
		use(groovy.time.TimeCategory){
			def now = new Date()
			def duration= now - fechaDeNacimiento
			r = duration.years
	    }
		r
	}
	

    static constraints = {
		nombre sizeMax: 8
		primerApellido sizeMax: 8
		segundoApellido sizemax: 8	
		dni matches: "[0-9]{8}([A-Za-z])",	unique : true	
		email  email:true
    }
	
	String toString(){
		"${primerApellido} ${segundoApellido}, ${nombre}"
	}
}
