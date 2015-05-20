package ejemplodeprimero

class Becario extends Alumno {

    Beca beca
	
	static hasOne =[beca:Beca]
	static constraints = {
		beca unique:true
    }
}
