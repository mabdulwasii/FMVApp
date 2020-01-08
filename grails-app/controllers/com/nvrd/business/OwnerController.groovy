package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN"])
class OwnerController {

    def index() { }
}
