package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_POLICE, ROLE_ADMIN"])
class PoliceController {

    def index() {
    }


}
