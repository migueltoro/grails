package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BecaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Beca.list(params), model:[becaInstanceCount: Beca.count()]
    }

    def show(Beca becaInstance) {
        respond becaInstance
    }

    def create() {
        respond new Beca(params)
    }

    @Transactional
    def save(Beca becaInstance) {
        if (becaInstance == null) {
            notFound()
            return
        }

        if (becaInstance.hasErrors()) {
            respond becaInstance.errors, view:'create'
            return
        }

        becaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'beca.label', default: 'Beca'), becaInstance.id])
                redirect becaInstance
            }
            '*' { respond becaInstance, [status: CREATED] }
        }
    }

    def edit(Beca becaInstance) {
        respond becaInstance
    }

    @Transactional
    def update(Beca becaInstance) {
        if (becaInstance == null) {
            notFound()
            return
        }

        if (becaInstance.hasErrors()) {
            respond becaInstance.errors, view:'edit'
            return
        }

        becaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Beca.label', default: 'Beca'), becaInstance.id])
                redirect becaInstance
            }
            '*'{ respond becaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Beca becaInstance) {

        if (becaInstance == null) {
            notFound()
            return
        }

        becaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Beca.label', default: 'Beca'), becaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'beca.label', default: 'Beca'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
