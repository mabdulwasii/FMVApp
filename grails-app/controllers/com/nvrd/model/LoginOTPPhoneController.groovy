package com.nvrd.model

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoginOTPPhoneController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LoginOTPPhone.list(params), model:[loginOTPPhoneCount: LoginOTPPhone.count()]
    }

    def show(LoginOTPPhone loginOTPPhone) {
        respond loginOTPPhone
    }

    def create() {
        respond new LoginOTPPhone(params)
    }

    @Transactional
    def save(LoginOTPPhone loginOTPPhone) {
        if (loginOTPPhone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loginOTPPhone.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loginOTPPhone.errors, view:'create'
            return
        }

        loginOTPPhone.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'loginOTPPhone.label', default: 'LoginOTPPhone'), loginOTPPhone.id])
                redirect loginOTPPhone
            }
            '*' { respond loginOTPPhone, [status: CREATED] }
        }
    }

    def edit(LoginOTPPhone loginOTPPhone) {
        respond loginOTPPhone
    }

    @Transactional
    def update(LoginOTPPhone loginOTPPhone) {
        if (loginOTPPhone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loginOTPPhone.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loginOTPPhone.errors, view:'edit'
            return
        }

        loginOTPPhone.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'loginOTPPhone.label', default: 'LoginOTPPhone'), loginOTPPhone.id])
                redirect loginOTPPhone
            }
            '*'{ respond loginOTPPhone, [status: OK] }
        }
    }

    @Transactional
    def delete(LoginOTPPhone loginOTPPhone) {

        if (loginOTPPhone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        loginOTPPhone.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'loginOTPPhone.label', default: 'LoginOTPPhone'), loginOTPPhone.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loginOTPPhone.label', default: 'LoginOTPPhone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
