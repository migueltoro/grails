package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CentroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Centro.list(params), model:[centroInstanceCount: Centro.count()]
    }

    def show(Centro centroInstance) {
        respond centroInstance
    }

    def create() {
        respond new Centro(params)
    }

    @Transactional
    def save(Centro centroInstance) {
        if (centroInstance == null) {
            notFound()
            return
        }

        if (centroInstance.hasErrors()) {
            respond centroInstance.errors, view:'create'
            return
        }

        centroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'centro.label', default: 'Centro'), centroInstance.id])
                redirect centroInstance
            }
            '*' { respond centroInstance, [status: CREATED] }
        }
    }

    def edit(Centro centroInstance) {
        respond centroInstance
    }

    @Transactional
    def update(Centro centroInstance) {
        if (centroInstance == null) {
            notFound()
            return
        }

        if (centroInstance.hasErrors()) {
            respond centroInstance.errors, view:'edit'
            return
        }

        centroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Centro.label', default: 'Centro'), centroInstance.id])
                redirect centroInstance
            }
            '*'{ respond centroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Centro centroInstance) {

        if (centroInstance == null) {
            notFound()
            return
        }

        centroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Centro.label', default: 'Centro'), centroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'centro.label', default: 'Centro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
