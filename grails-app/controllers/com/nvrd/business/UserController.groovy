package com.nvrd.business

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class UserController extends grails.plugin.springsecurity.ui.UserController {
}
