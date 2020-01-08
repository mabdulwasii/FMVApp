package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN"])
class RegistrationCodeController extends grails.plugin.springsecurity.ui.RegistrationCodeController {
}
