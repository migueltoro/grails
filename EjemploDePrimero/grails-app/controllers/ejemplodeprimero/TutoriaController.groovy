package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TutoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tutoria.list(params), model:[tutoriaInstanceCount: Tutoria.count()]
    }

    def show(Tutoria tutoriaInstance) {
        respond tutoriaInstance
    }

    def create() {
        respond new Tutoria(params)
    }

    @Transactional
    def save(Tutoria tutoriaInstance) {
        if (tutoriaInstance == null) {
            notFound()
            return
        }

        if (tutoriaInstance.hasErrors()) {
            respond tutoriaInstance.errors, view:'create'
            return
        }

        tutoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tutoria.label', default: 'Tutoria'), tutoriaInstance.id])
                redirect tutoriaInstance
            }
            '*' { respond tutoriaInstance, [status: CREATED] }
        }
    }

    def edit(Tutoria tutoriaInstance) {
        respond tutoriaInstance
    }

    @Transactional
    def update(Tutoria tutoriaInstance) {
        if (tutoriaInstance == null) {
            notFound()
            return
        }

        if (tutoriaInstance.hasErrors()) {
            respond tutoriaInstance.errors, view:'edit'
            return
        }

        tutoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tutoria.label', default: 'Tutoria'), tutoriaInstance.id])
                redirect tutoriaInstance
            }
            '*'{ respond tutoriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tutoria tutoriaInstance) {

        if (tutoriaInstance == null) {
            notFound()
            return
        }

        tutoriaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tutoria.label', default: 'Tutoria'), tutoriaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tutoria.label', default: 'Tutoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
