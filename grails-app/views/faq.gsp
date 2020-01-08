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
                <li class="blue-text lighten-5">Welcome <sec:username/></li>
                <li class="disabled white-text" style="padding-left: 5px; padding-right: 5px">|</li>
                <li><a href="/dashboard">Dashboard</a></li>
            </sec:ifLoggedIn>
            <li><a href="/about">About</a></li>
            <li><a href="/faq">FAQ</a></li>
            <li><a href="/contact">Contact</a></li>
            <sec:ifLoggedIn>
                <li><a href="/logout" class="tooltipped" data-position="bottom" data-tooltip="Logout"><span
                        class="mdi mdi-logout"></span></a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li><g:link controller="login" class="white-text disabled">Login</g:link></li>
                <li><g:link controller="signup" class="white-text disabled">Register</g:link></li>
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
    <li><a href="/about">About</a></li>
    <li><a href="/faq" >FAQ</a></li>
    <li><a href="/contact" >Contact</a></li>
    <sec:ifLoggedIn>
        <li><a href="/logout" class="tooltipped" data-position="bottom" data-tooltip="Logout"><span
                class="mdi mdi-logout"></span></a></li>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <li><g:link controller="login" >Login</g:link></li>
        <li><g:link controller="signup">Register</g:link></li>
    </sec:ifNotLoggedIn>
</ul>

%{--End of NavBar--}%

%{--    Main Content--}%
<main class="white-text darken-5">
    <div class="row center-align center-align">
        <div class="col 12">
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
            <g:form class="center-block" action="create" controller="vehicle" method="POST" autocomplete="off">
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
</main>
<asset:javascript src="application.js"/>
<asset:javascript src="custom.js"/>
<asset:javascript src="style.js"/>

</body>
</html>
