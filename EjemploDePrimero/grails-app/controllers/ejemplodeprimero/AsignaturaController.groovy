package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsignaturaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Asignatura.list(params), model:[asignaturaInstanceCount: Asignatura.count()]
    }

    def show(Asignatura asignaturaInstance) {
        respond asignaturaInstance
    }

    def create() {
        respond new Asignatura(params)
    }

    @Transactional
    def save(Asignatura asignaturaInstance) {
        if (asignaturaInstance == null) {
            notFound()
            return
        }

        if (asignaturaInstance.hasErrors()) {
            respond asignaturaInstance.errors, view:'create'
            return
        }

        asignaturaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), asignaturaInstance.id])
                redirect asignaturaInstance
            }
            '*' { respond asignaturaInstance, [status: CREATED] }
        }
    }

    def edit(Asignatura asignaturaInstance) {
        respond asignaturaInstance
    }

    @Transactional
    def update(Asignatura asignaturaInstance) {
        if (asignaturaInstance == null) {
            notFound()
            return
        }

        if (asignaturaInstance.hasErrors()) {
            respond asignaturaInstance.errors, view:'edit'
            return
        }

        asignaturaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Asignatura.label', default: 'Asignatura'), asignaturaInstance.id])
                redirect asignaturaInstance
            }
            '*'{ respond asignaturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Asignatura asignaturaInstance) {

        if (asignaturaInstance == null) {
            notFound()
            return
        }

        asignaturaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Asignatura.label', default: 'Asignatura'), asignaturaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
