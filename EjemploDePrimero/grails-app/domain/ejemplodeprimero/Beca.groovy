package ejemplodeprimero

class Beca {

	enum TipoDeBeca {ORDINARIA, MOVILIDAD, EMPRESA}
	
	
	Becario becario
	Double importe
	Integer duracion
	TipoDeBeca tipo
	String codigo

	static constraints = {
		becario nullable :false
		importe validator : {it>0}
		duracion range: 0..12
		codigo unique: true
	}
}
