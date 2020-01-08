package com.nvrd.model

import com.nvrd.security.User
import com.nvrd.utilities.Utility

import java.text.SimpleDateFormat

class Vehicle {

    String model
    String make
    String chasisNumber
    String engine_no
    String vehicleColor
    String stateWhereRegistered
    String stateWhereStolen
    String status
    String ownerFirstName
    String ownerLastName
    String ownerPhoneNo
    String ownerEmail
    String ownerAddress
    String ownerAddressCity
    String ownerAddressState
    String vehicleFlag
    Date dateCreated
    Date lastUpdated

    transient String getVehicle() {
        def s = new StringBuilder()
        s << "BEGIN:VEHICLE\n"
        s << "VERSION:1.0\n"
        s << "MAKE:${model}\n"
        s << "MAKE: ${make}\n"
        s << "CHASIS NUMBER:${chasisNumber}\n"
        s << "ENGINE NUMBER:${engine_no}\n"
        s << "VEHICLE COLOR:${vehicleColor}\n"
        s << "STATE WHERE REGISTERED:${stateWhereRegistered}\n"
        s << "STATE WHERE STOLEN:${stateWhereStolen}\n"
        s << "STATUS:${status}\n"
        s << "OWNER FIRSTNME:${ownerFirstName}\n"
        s << "OWNER LASTNAME:${ownerLastName}\n"
        s << "OWNER PHONE NUMBER:${ownerPhoneNo}\n"
        s << "OWNER EMAIL:${ownerEmail}\n"
        s << "OWNER ADDRESS:${ownerAddress}\n"
        s << "OWNER ADDRESS CITY:${ownerAddress}\n"
        s << "OWNER ADDRESS STATE:${ownerAddressState}\n"
        s << "VEHICLE FLAG:${vehicleFlag}\n"
        s << ":${ownerLastName}\n"
        def timestampFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
        s << "REV:${timestampFormat.format(lastUpdated ?: dateCreated)}\n"
        s << "END:VEHICLE\n"
        return s.toString()
    }

    static belongsTo = [createdBy: User]

    static constraints = {
        chasisNumber blank: false, unique: true, matches: '[a-zA-Z0-9]{9}[a-zA-Z0-9-]{2}[0-9]{6}'
        make blank: false, unique: false
        model blank: false, unique: false
        engine_no blank: false, unique: true
        vehicleColor blank: false, unique: false
        stateWhereRegistered blank: false, unique: false, inList: Utility.states
        stateWhereStolen blank: false, unique: false, inList: Utility.states
        status blank: false, unique: false, inList: ['Verified', 'Reported Stolen', 'Unverified']
        ownerFirstName blank: false, unique: false
        ownerLastName blank: false, unique: false
        ownerPhoneNo blank: false, unique: false
        ownerEmail blank: false, unique: false
        ownerAddress blank: false, unique: false
        ownerAddressCity blank: false, unique: false
        ownerAddressState blank: false, unique: false, inList: Utility.states
        vehicleFlag blank: false, unique: false, inList: ['Reported ', 'Searched']

    }
}