package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GradoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Grado.list(params), model:[gradoInstanceCount: Grado.count()]
    }

    def show(Grado gradoInstance) {
        respond gradoInstance
    }

    def create() {
        respond new Grado(params)
    }

    @Transactional
    def save(Grado gradoInstance) {
        if (gradoInstance == null) {
            notFound()
            return
        }

        if (gradoInstance.hasErrors()) {
            respond gradoInstance.errors, view:'create'
            return
        }

        gradoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'grado.label', default: 'Grado'), gradoInstance.id])
                redirect gradoInstance
            }
            '*' { respond gradoInstance, [status: CREATED] }
        }
    }

    def edit(Grado gradoInstance) {
        respond gradoInstance
    }

    @Transactional
    def update(Grado gradoInstance) {
        if (gradoInstance == null) {
            notFound()
            return
        }

        if (gradoInstance.hasErrors()) {
            respond gradoInstance.errors, view:'edit'
            return
        }

        gradoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Grado.label', default: 'Grado'), gradoInstance.id])
                redirect gradoInstance
            }
            '*'{ respond gradoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Grado gradoInstance) {

        if (gradoInstance == null) {
            notFound()
            return
        }

        gradoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Grado.label', default: 'Grado'), gradoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
