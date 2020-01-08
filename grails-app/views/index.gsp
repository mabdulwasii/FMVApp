<!doctype html>
<html>
<head>
    %{--<meta name="layout" content="main"/>--}%
    <title>Welcome to NVRD Application</title>
    <asset:link rel="icon" href="favicon.png" type="image/x-ico"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="landing.css"/>

</head>

<body>

%{--NavBar--}%
<nav class=" lighten-0 transparent waves-teal waves-ripple">
    <div class="nav-wrapper">
        <a href="/" class="brand-logo ">NVRD</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="mdi mdi-menu"></i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <sec:ifLoggedIn>
                <li class="blue-text lighten-5">Welcome <sec:username /></li>
                <li class="disabled white-text" style="padding-left: 5px; padding-right: 5px">|</li>
                <li><a href="/dashboard">Dashboard</a></li>
            </sec:ifLoggedIn>
            <li><a href="#about"  class="modal-trigger">About</a></li>
            <li><a href="#faq"  class="modal-trigger">FAQ</a></li>
            <li><a href="#contact"  class="modal-trigger">Contact</a></li>
            <sec:ifLoggedIn>
                <li><a href="/logout" class="tooltipped" data-position="bottom" data-tooltip="Logout"><span
                        class="mdi mdi-logout"></span></a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li><g:link controller="login" class="white-text disabled">Login</g:link></li>
                <li><a href="#register" class="modal-trigger">Register</a></li>
            </sec:ifNotLoggedIn>
        </ul>
    </div>

</nav>

<ul class="sidenav" id="mobile-demo">
    <sec:ifLoggedIn>
        <li class="blue-text lighten-5">Welcome <sec:username/></li>
        <li class="disabled white-text" style="padding-left: 5px; padding-right: 5px">|</li>
        <li><a href="/dashboard">Dashboard</a></li>
    </sec:ifLoggedIn>
    <li><a href="#about" class="modal-trigger">About</a></li>
    <li><a href="#faq" class="modal-trigger">FAQ</a></li>
    <li><a href="#contact" class="modal-trigger">Contact</a></li>
    <sec:ifLoggedIn>
        <li><a href="/logout" class="tooltipped" data-position="bottom" data-tooltip="Logout"><span
                class="mdi mdi-logout"></span></a></li>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <li><g:link controller="login">Login</g:link></li>
        <li><a href="#register" class="modal-trigger">Register</a></li>
    </sec:ifNotLoggedIn>
</ul>

%{--End of NavBar--}%

%{--    Main Content--}%
<main class="white-text darken-5">
    <div class="row center-align center-align">
        <div class="col 12 headerTextContainer">
            <h1 class="headerText">Header Text</h1>
        </div>

        <div class="col s12 hide-on-med-and-down ">
            <h5 class="flow-text riderText">Rider text that explains the header text goes here for the page.
            Rider text that explains the header text goes here for the page.</h5>
            <br/>
            <br/>
        </div>
    </div>

    <div class="row">
        <div class="col s12">
            <g:form class="center-block" action="createNew" controller="vehicle" method="POST" autocomplete="off">
                <div class="row center-align">
                    <div class=' row value ${hasErrors(bean: vehicle, field: 'chasisNumber', 'errors')}'>
                    </div>

                    <div class="input-field col s12 inline-block">
                        <input id="chasis_no" placeholder="Chasis Number" autofocus
                               type="text" maxlength="17" minlength="17"
                               class="col s12 m8 validate white-text inline transparent"
                               name="${params.chasisNumber}">
                        <span class="helper-text inline-block" data-error="wrong chasis number"
                              data-success="valid chasis number"></span>
                    </div>
                </div>

                <div class="row center-align ">
                    <div class="col s8" style="display: inline-block">
                        <button type='submit' name='btn_search'
                                class='col s8 btn btn-large waves-effect indigo white-text roundBtn'>Report Missing Car</button>
                    </div>
            </g:form>
        </div>
    </div>
    </div>

    <!-- Modal Structure for FAQ Login -->
    <div id="faq" class="modal blue-grey darken-4 white-text  valign-wrapper phoneOTP">
        <div class="modal-content otpContent">
            <h1>FAQ</h1>

        </div>
    </div>
    <!-- Modal Structure for FAQ Login -->

    <!-- Modal Structure for contact Login -->
    <div id="contact" class="modal blue-grey darken-4 white-text  valign-wrapper phoneOTP">
        <div class="modal-content otpContent">
            <h1>CONTACT</h1>

        </div>
    </div>
    <!-- End of Modal Structure for Contact Login -->

    <!-- Modal Structure for About Login -->
    <div id="about" class="modal blue-grey darken-4 white-text  valign-wrapper phoneOTP">
        <div class="modal-content otpContent">
            <h1>ABOUT</h1>

        </div>
    </div>
    <!-- End of Modal Structure for About Login -->

    <!-- Modal Structure for Register-->
    <div id="register" class="modal blue-grey  darken-4 valign-wrapper phoneOTP">
        <div class="modal-content registerContent">
            <div class="container col s8">
                <nav class="transparent">
                        <div class="nav-wrapper transparent ">
                            <div class="col s8 rowCenter">
                                <h3 class="brand-logo center">Please Register</h3>
                            </div>
                        </div>
                    </nav>
                <form class="col s12 white-text" id="registerForm">
                    <g:if test='${emailSent}'>--}%
                        <br/>--}%
                           <g:message code='spring.security.ui.register.sent'/>--}%
                   </g:if>
                    <g:else>
                    <div class="row">
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">contacts</i>
                            <input id="first_name" type="text" class="validate">
                            <label for="first_name">First Name</label>
                        </div>
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">contacts</i>
                            <input id="last_name" type="text" class="validate">
                            <label for="last_name">Last Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">email</i>
                            <input id="email" type="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">phone</i>
                            <input id="phoneno" type="text" class="validate">
                            <label for="phoneno">Username</label>
                        </div>
                    </div>
                        <div class="row">
                            <div class="input-field hoverable col s12 rowCenter">
                                <i class="material-icons prefix white-text">account_circle</i>
                                <input id="username" type="text" class="validate">
                                <label for="username">Username</label>
                            </div>
                        </div>
                    <div class="row">
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">vpn_key</i>
                            <input id="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <div class="input-field hoverable col s6 rowCenter">
                            <i class="material-icons prefix white-text">replay</i>
                            <input id="password2" type="password" class="validate">
                            <label for="password2">Retype Password</label>
                        </div>
                    </div>
                    <a class="waves-effect waves-light btn right hoverable" id="registerBtn"><i class="large material-icons right">done</i>register</a>
                    </g:else>
                </form>

            </div>
        </div>
    </div>
    <!-- End of Modal Structure for About Login -->
</main>
<asset:javascript src="application.js"/>
<asset:javascript src="custom.js"/>
<asset:javascript src="style.js"/>

</body>
</html>
