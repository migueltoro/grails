package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SeminarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Seminario.list(params), model:[seminarioInstanceCount: Seminario.count()]
    }

    def show(Seminario seminarioInstance) {
        respond seminarioInstance
    }

    def create() {
        respond new Seminario(params)
    }

    @Transactional
    def save(Seminario seminarioInstance) {
        if (seminarioInstance == null) {
            notFound()
            return
        }

        if (seminarioInstance.hasErrors()) {
            respond seminarioInstance.errors, view:'create'
            return
        }

        seminarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'seminario.label', default: 'Seminario'), seminarioInstance.id])
                redirect seminarioInstance
            }
            '*' { respond seminarioInstance, [status: CREATED] }
        }
    }

    def edit(Seminario seminarioInstance) {
        respond seminarioInstance
    }

    @Transactional
    def update(Seminario seminarioInstance) {
        if (seminarioInstance == null) {
            notFound()
            return
        }

        if (seminarioInstance.hasErrors()) {
            respond seminarioInstance.errors, view:'edit'
            return
        }

        seminarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Seminario.label', default: 'Seminario'), seminarioInstance.id])
                redirect seminarioInstance
            }
            '*'{ respond seminarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Seminario seminarioInstance) {

        if (seminarioInstance == null) {
            notFound()
            return
        }

        seminarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Seminario.label', default: 'Seminario'), seminarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'seminario.label', default: 'Seminario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
