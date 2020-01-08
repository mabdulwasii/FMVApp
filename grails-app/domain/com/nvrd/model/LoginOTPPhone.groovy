package com.nvrd.model

class LoginOTPPhone {

    String phoneNumber

    static constraints = {
        phoneNumber blank: false, unique: true
    }
}
