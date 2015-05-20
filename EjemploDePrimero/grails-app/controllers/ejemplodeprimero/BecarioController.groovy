package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BecarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Becario.list(params), model:[becarioInstanceCount: Becario.count()]
    }

    def show(Becario becarioInstance) {
        respond becarioInstance
    }

    def create() {
        respond new Becario(params)
    }

    @Transactional
    def save(Becario becarioInstance) {
        if (becarioInstance == null) {
            notFound()
            return
        }

        if (becarioInstance.hasErrors()) {
            respond becarioInstance.errors, view:'create'
            return
        }

        becarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'becario.label', default: 'Becario'), becarioInstance.id])
                redirect becarioInstance
            }
            '*' { respond becarioInstance, [status: CREATED] }
        }
    }

    def edit(Becario becarioInstance) {
        respond becarioInstance
    }

    @Transactional
    def update(Becario becarioInstance) {
        if (becarioInstance == null) {
            notFound()
            return
        }

        if (becarioInstance.hasErrors()) {
            respond becarioInstance.errors, view:'edit'
            return
        }

        becarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Becario.label', default: 'Becario'), becarioInstance.id])
                redirect becarioInstance
            }
            '*'{ respond becarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Becario becarioInstance) {

        if (becarioInstance == null) {
            notFound()
            return
        }

        becarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Becario.label', default: 'Becario'), becarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'becario.label', default: 'Becario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
