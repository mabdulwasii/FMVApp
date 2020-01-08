package com.nvrd.model

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoginOTPEmailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LoginOTPEmail.list(params), model:[loginOTPEmailCount: LoginOTPEmail.count()]
    }

    def show(LoginOTPEmail loginOTPEmail) {
        respond loginOTPEmail
    }

    def create() {
        respond new LoginOTPEmail(params)
    }

    @Transactional
    def save(LoginOTPEmail loginOTPEmail) {
        if (loginOTPEmail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loginOTPEmail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loginOTPEmail.errors, view:'create'
            return
        }

        loginOTPEmail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'loginOTPEmail.label', default: 'LoginOTPEmail'), loginOTPEmail.id])
                redirect loginOTPEmail
            }
            '*' { respond loginOTPEmail, [status: CREATED] }
        }
    }

    def edit(LoginOTPEmail loginOTPEmail) {
        respond loginOTPEmail
    }

    @Transactional
    def update(LoginOTPEmail loginOTPEmail) {
        if (loginOTPEmail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loginOTPEmail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loginOTPEmail.errors, view:'edit'
            return
        }

        loginOTPEmail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'loginOTPEmail.label', default: 'LoginOTPEmail'), loginOTPEmail.id])
                redirect loginOTPEmail
            }
            '*'{ respond loginOTPEmail, [status: OK] }
        }
    }

    @Transactional
    def delete(LoginOTPEmail loginOTPEmail) {

        if (loginOTPEmail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        loginOTPEmail.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'loginOTPEmail.label', default: 'LoginOTPEmail'), loginOTPEmail.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loginOTPEmail.label', default: 'LoginOTPEmail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
