package ejemplodeprimero

import grails.transaction.Transactional
import groovy.time.TimeCategory

@Transactional
class TutoriaService {

    boolean overlapsBloqueDeTutorias(Profesor p, BloqueDeTutorias b) {
		def rs = p.horarioDeTutorias.any{x->overlapsBloques(x, b)}
		rs
    }
	
	boolean overlapsTutorias(Profesor p, Tutoria t) {
		def rs = p.tutorias.any{r-> overlapsTutorias(r,t)}
		rs
	}
	
	boolean incluyeTutoria(Profesor p, Tutoria t){
		def rs = p.horarioDeTutorias.any{b-> incluyeTutoria(b,t)}
		rs
	}
	
	
	def getRangeBloque(BloqueDeTutorias b){
		def comienzo = b.horaDeComienzo*60
		def fin = b.horaDeFinalizacion*60
		comienzo..fin
	}
	
	def getRangeTutoria(Tutoria t){	
		def comienzo = t.horaDeComienzo*60+t.minutoDeComienzo
		def fin = comienzo +t.duracion
		comienzo..fin
	}
	
	def overlapsTutorias(Tutoria t1, Tutoria t2){
		def r1 = getRangeTutoria(t1)
		def r2 = getRangeTutoria(t2)
		t1.fecha == t2.fecha && (r1.contains(r2.from) || r1.contains(r2.to))
	}
	
	def overlapsBloques(BloqueDeTutorias b1, BloqueDeTutorias b2){
		def r1 = getRangeBloque(b1)
		def r2 = getRangeBloque(b2)		
		def rs = b1.diaDeSemana == b2.diaDeSemana && (r1.contains(r2.from) || r1.contains(r2.to))
		rs			
	}
	
	def incluyeTutoria(BloqueDeTutorias b, Tutoria t){
		println "${b}, "
		def rt = getRangeTutoria(t)
		def rb = getRangeBloque(b)
		def rs = t.fecha[Calendar.DAY_OF_WEEK] == b.diaDeSemana
			println "${t.fecha[Calendar.DAY_OF_WEEK]}, ${b.diaDeSemana}, ${rs}"
		    rs = rs &&  rb.contains(rt.from) && rb.contains(rt.to)
		rs
	}
}
