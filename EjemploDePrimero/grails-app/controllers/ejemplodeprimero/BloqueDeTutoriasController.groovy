package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BloqueDeTutoriasController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BloqueDeTutorias.list(params), model:[bloqueDeTutoriasInstanceCount: BloqueDeTutorias.count()]
    }

    def show(BloqueDeTutorias bloqueDeTutoriasInstance) {
        respond bloqueDeTutoriasInstance
    }

    def create() {
        respond new BloqueDeTutorias(params)
    }

    @Transactional
    def save(BloqueDeTutorias bloqueDeTutoriasInstance) {
        if (bloqueDeTutoriasInstance == null) {
            notFound()
            return
        }

        if (bloqueDeTutoriasInstance.hasErrors()) {
            respond bloqueDeTutoriasInstance.errors, view:'create'
            return
        }

        bloqueDeTutoriasInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bloqueDeTutorias.label', default: 'BloqueDeTutorias'), bloqueDeTutoriasInstance.id])
                redirect bloqueDeTutoriasInstance
            }
            '*' { respond bloqueDeTutoriasInstance, [status: CREATED] }
        }
    }

    def edit(BloqueDeTutorias bloqueDeTutoriasInstance) {
        respond bloqueDeTutoriasInstance
    }

    @Transactional
    def update(BloqueDeTutorias bloqueDeTutoriasInstance) {
        if (bloqueDeTutoriasInstance == null) {
            notFound()
            return
        }

        if (bloqueDeTutoriasInstance.hasErrors()) {
            respond bloqueDeTutoriasInstance.errors, view:'edit'
            return
        }

        bloqueDeTutoriasInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BloqueDeTutorias.label', default: 'BloqueDeTutorias'), bloqueDeTutoriasInstance.id])
                redirect bloqueDeTutoriasInstance
            }
            '*'{ respond bloqueDeTutoriasInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BloqueDeTutorias bloqueDeTutoriasInstance) {

        if (bloqueDeTutoriasInstance == null) {
            notFound()
            return
        }

        bloqueDeTutoriasInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BloqueDeTutorias.label', default: 'BloqueDeTutorias'), bloqueDeTutoriasInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bloqueDeTutorias.label', default: 'BloqueDeTutorias'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
