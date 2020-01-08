package com.nvrd.model

class LoginOTPEmail {

    String email

    static constraints = {
        email email: true, blank: false, unique: true
    }
}
