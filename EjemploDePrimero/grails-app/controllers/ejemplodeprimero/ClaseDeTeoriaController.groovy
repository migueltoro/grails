package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClaseDeTeoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClaseDeTeoria.list(params), model:[claseDeTeoriaInstanceCount: ClaseDeTeoria.count()]
    }

    def show(ClaseDeTeoria claseDeTeoriaInstance) {
        respond claseDeTeoriaInstance
    }

    def create() {
        respond new ClaseDeTeoria(params)
    }

    @Transactional
    def save(ClaseDeTeoria claseDeTeoriaInstance) {
        if (claseDeTeoriaInstance == null) {
            notFound()
            return
        }

        if (claseDeTeoriaInstance.hasErrors()) {
            respond claseDeTeoriaInstance.errors, view:'create'
            return
        }

        claseDeTeoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'claseDeTeoria.label', default: 'ClaseDeTeoria'), claseDeTeoriaInstance.id])
                redirect claseDeTeoriaInstance
            }
            '*' { respond claseDeTeoriaInstance, [status: CREATED] }
        }
    }

    def edit(ClaseDeTeoria claseDeTeoriaInstance) {
        respond claseDeTeoriaInstance
    }

    @Transactional
    def update(ClaseDeTeoria claseDeTeoriaInstance) {
        if (claseDeTeoriaInstance == null) {
            notFound()
            return
        }

        if (claseDeTeoriaInstance.hasErrors()) {
            respond claseDeTeoriaInstance.errors, view:'edit'
            return
        }

        claseDeTeoriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClaseDeTeoria.label', default: 'ClaseDeTeoria'), claseDeTeoriaInstance.id])
                redirect claseDeTeoriaInstance
            }
            '*'{ respond claseDeTeoriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClaseDeTeoria claseDeTeoriaInstance) {

        if (claseDeTeoriaInstance == null) {
            notFound()
            return
        }

        claseDeTeoriaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClaseDeTeoria.label', default: 'ClaseDeTeoria'), claseDeTeoriaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'claseDeTeoria.label', default: 'ClaseDeTeoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
