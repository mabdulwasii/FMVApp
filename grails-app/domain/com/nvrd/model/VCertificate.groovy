package com.nvrd.model

class VCertificate {

    Byte[] vCertificate
    static constraints = {
        vCertificate maxSize: 102400, type: byte
    }
}
