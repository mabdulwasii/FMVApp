package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(["ROLE_ADMIN", "ROLE_POLICE_ADMIN", "ROLE_USER", "ROLE_POLICE"])
class DashboardController {

    String view

    def index() {
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            redirect controller: AdminController
        }
        else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect controller: OwnerController
        }
        else if (SpringSecurityUtils.ifAllGranted('ROLE_POLICE')) {
            redirect controller: PoliceController
        }
        else if (SpringSecurityUtils.ifAllGranted('ROLE_POLICE_ADMIN')) {
            redirect controller: AdminController
        }
        else {
            render "/notFound"
        }

    }
}
