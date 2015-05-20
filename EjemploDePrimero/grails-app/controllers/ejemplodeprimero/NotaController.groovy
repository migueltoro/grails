package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NotaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Nota.list(params), model:[notaInstanceCount: Nota.count()]
    }

    def show(Nota notaInstance) {
        respond notaInstance
    }

    def create() {
        respond new Nota(params)
    }

    @Transactional
    def save(Nota notaInstance) {
        if (notaInstance == null) {
            notFound()
            return
        }

        if (notaInstance.hasErrors()) {
            respond notaInstance.errors, view:'create'
            return
        }

        notaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nota.label', default: 'Nota'), notaInstance.id])
                redirect notaInstance
            }
            '*' { respond notaInstance, [status: CREATED] }
        }
    }

    def edit(Nota notaInstance) {
        respond notaInstance
    }

    @Transactional
    def update(Nota notaInstance) {
        if (notaInstance == null) {
            notFound()
            return
        }

        if (notaInstance.hasErrors()) {
            respond notaInstance.errors, view:'edit'
            return
        }

        notaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Nota.label', default: 'Nota'), notaInstance.id])
                redirect notaInstance
            }
            '*'{ respond notaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Nota notaInstance) {

        if (notaInstance == null) {
            notFound()
            return
        }

        notaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Nota.label', default: 'Nota'), notaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
