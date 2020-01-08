package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured

@Secured(["IS_AUTHENTICATED_ANONYMOUSLY"])
class SigninController {

    def index() { }
}
