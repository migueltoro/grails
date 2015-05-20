package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExpedienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expediente.list(params), model:[expedienteInstanceCount: Expediente.count()]
    }

    def show(Expediente expedienteInstance) {
        respond expedienteInstance
    }

    def create() {
        respond new Expediente(params)
    }

    @Transactional
    def save(Expediente expedienteInstance) {
        if (expedienteInstance == null) {
            notFound()
            return
        }

        if (expedienteInstance.hasErrors()) {
            respond expedienteInstance.errors, view:'create'
            return
        }

        expedienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expediente.label', default: 'Expediente'), expedienteInstance.id])
                redirect expedienteInstance
            }
            '*' { respond expedienteInstance, [status: CREATED] }
        }
    }

    def edit(Expediente expedienteInstance) {
        respond expedienteInstance
    }

    @Transactional
    def update(Expediente expedienteInstance) {
        if (expedienteInstance == null) {
            notFound()
            return
        }

        if (expedienteInstance.hasErrors()) {
            respond expedienteInstance.errors, view:'edit'
            return
        }

        expedienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Expediente.label', default: 'Expediente'), expedienteInstance.id])
                redirect expedienteInstance
            }
            '*'{ respond expedienteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Expediente expedienteInstance) {

        if (expedienteInstance == null) {
            notFound()
            return
        }

        expedienteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Expediente.label', default: 'Expediente'), expedienteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expediente.label', default: 'Expediente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
