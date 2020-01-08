package fmvapp

import com.nvrd.security.Role
import com.nvrd.security.User
import com.nvrd.security.UserRole

class BootStrap {

    def init = { servletContext ->

        /*===================
        *Creation of Role
        *===================
        */
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def policeRole = new Role(authority: 'ROLE_POLICE').save()
        def policeAdminRole = new Role(authority: 'ROLE_POLICE_ADMIN').save()

        println("ROLE =========== " + Role.count())

        /*===================
        *Creation of Role
        *===================
        */

        def adminUser = new User(username: 'admin', password: 'Admin123', phoneno: '07098787545', email: 'admin@nvrd.com', firstname: 'Bayo', lastname: 'Seyi' ).save()
        def guestUser = new User(username: 'user', password: 'User123', email: 'user@nvrd.com', phoneno: '090878776765', firstname: 'Bayo', lastname: 'Seyi' ).save()
        def policeUser = new User(username: 'police', password: 'Police123', phoneno: '0709876455545', email: 'police@nvrd.com', firstname: 'Bayo', lastname: 'Seyi').save()
        def policeAdminUser = new User(username: 'policeAdmin', password: 'PoliceAdmin123', phoneno: '07098765645', email: 'policeAdmin@nvrd.com', firstname: 'Bayo', lastname: 'Seyi').save()

        println("USER ROLE =========== " + User.count())

        /*===================
        *Creation of Role
        *===================
        */
        UserRole.create adminUser, adminRole, true
        UserRole.create guestUser, userRole, true
        UserRole.create policeUser, policeRole, true
        UserRole.create policeAdminUser, policeAdminRole, true

        println("USER AND ROLE =========== " + UserRole.count())

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 4
        assert Role.count() == 4
        assert UserRole.count() == 4

    }
    def destroy = {
    }
}