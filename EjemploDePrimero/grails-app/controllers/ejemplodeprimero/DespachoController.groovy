package ejemplodeprimero



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DespachoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Despacho.list(params), model:[despachoInstanceCount: Despacho.count()]
    }

    def show(Despacho despachoInstance) {
        respond despachoInstance
    }

    def create() {
        respond new Despacho(params)
    }

    @Transactional
    def save(Despacho despachoInstance) {
        if (despachoInstance == null) {
            notFound()
            return
        }

        if (despachoInstance.hasErrors()) {
            respond despachoInstance.errors, view:'create'
            return
        }

        despachoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'despacho.label', default: 'Despacho'), despachoInstance.id])
                redirect despachoInstance
            }
            '*' { respond despachoInstance, [status: CREATED] }
        }
    }

    def edit(Despacho despachoInstance) {
        respond despachoInstance
    }

    @Transactional
    def update(Despacho despachoInstance) {
        if (despachoInstance == null) {
            notFound()
            return
        }

        if (despachoInstance.hasErrors()) {
            respond despachoInstance.errors, view:'edit'
            return
        }

        despachoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Despacho.label', default: 'Despacho'), despachoInstance.id])
                redirect despachoInstance
            }
            '*'{ respond despachoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Despacho despachoInstance) {

        if (despachoInstance == null) {
            notFound()
            return
        }

        despachoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Despacho.label', default: 'Despacho'), despachoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'despacho.label', default: 'Despacho'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
