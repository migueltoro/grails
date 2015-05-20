package ejemplodeprimero

import groovy.lang.Range;

import java.time.DayOfWeek
import java.util.Date;
import java.util.Calendar


class BloqueDeTutorias {

	def tutoriaService
	
	Profesor profesor	
	Integer diaDeSemana
	Integer horaDeComienzo
	Integer horaDeFinalizacion
	
	static constraints = {
		profesor validator : {p,obj-> 
			!obj.tutoriaService.overlapsBloqueDeTutorias(p,obj)
		} 			
		diaDeSemana inList: [Calendar.MONDAY, Calendar.TUESDAY, Calendar.WEDNESDAY, Calendar.THURSDAY, Calendar.FRIDAY]
		horaDeComienzo range : 8..20 
		horaDeFinalizacion range : 8..20, validator : {f,obj-> f > obj.horaDeComienzo}
    }
	
	String toString(){
		"${diaDeSemana}, ${horaDeComienzo}-${horaDeFinalizacion}"
	}
}
