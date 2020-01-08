package com.nvrd.model

import com.nvrd.security.User

class Payment {

    String email;
    Double amount;
    String plan
    String firstname;
    String lastname;
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: User]

    static mapping = {
        id generator: 'uuid'
    }

    static constraints = {
        email blank: false, unique: false
        amount blank: false, unique: false
        plan blank: true, unique: false
        firstname blank: true, unique: false
        lastname blank: true, unique: false
    }
}
