package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EspacioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Espacio.list(params), model:[espacioInstanceCount: Espacio.count()]
    }

    def show(Espacio espacioInstance) {
        respond espacioInstance
    }

    def create() {
        respond new Espacio(params)
    }

    @Transactional
    def save(Espacio espacioInstance) {
        if (espacioInstance == null) {
            notFound()
            return
        }

        if (espacioInstance.hasErrors()) {
            respond espacioInstance.errors, view:'create'
            return
        }

        espacioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'espacio.label', default: 'Espacio'), espacioInstance.id])
                redirect espacioInstance
            }
            '*' { respond espacioInstance, [status: CREATED] }
        }
    }

    def edit(Espacio espacioInstance) {
        respond espacioInstance
    }

    @Transactional
    def update(Espacio espacioInstance) {
        if (espacioInstance == null) {
            notFound()
            return
        }

        if (espacioInstance.hasErrors()) {
            respond espacioInstance.errors, view:'edit'
            return
        }

        espacioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Espacio.label', default: 'Espacio'), espacioInstance.id])
                redirect espacioInstance
            }
            '*'{ respond espacioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Espacio espacioInstance) {

        if (espacioInstance == null) {
            notFound()
            return
        }

        espacioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Espacio.label', default: 'Espacio'), espacioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'espacio.label', default: 'Espacio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
