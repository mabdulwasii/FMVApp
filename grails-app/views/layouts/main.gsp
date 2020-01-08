<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="NVRD"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application2.css"/>

    <g:layoutHead/>
</head>
<body>
<nav >
    <div class="nav-wrapper blue">
        <a href="/" class="brand-logo paddLeft" style="padding-left: 1em">FMCV</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="mdi mdi-menu"></i></a>
        <ul class="right hide-on-med-and-down">

            <sec:ifLoggedIn>
                <li class="yellow-text"><a href="/profile" class="yellow-text disabled">Welcome <sec:username/></a></li>
                <li class="disabled yellow-text">|</li>
            </sec:ifLoggedIn>
            <li><a href="#">About</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Contact</a></li>
            <sec:ifLoggedIn>
                <li class="disabled"><a href="/logout" class="white-text disabled">Logout</a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li><a href="/login" class="white-text disabled">Login</a></li>
            </sec:ifNotLoggedIn>

        </ul>
    </div>
</nav>

<ul class="sidenav" id="mobile-demo">
    <li><a href="/about">About</a></li>
    <li><a href="/faq">FAQ</a></li>
    <li><a href="/contact">Contact</a></li>
    <sec:ifLoggedIn>
        <li><a href="#"><i class="mdi mdi-logout">Logout</i></a></li>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <li><a href="#"><i class="mdi mdi-login">Login</i></a></li>
    </sec:ifNotLoggedIn>
</ul>
    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

<footer class="page-footer white">
    <div class="footer-copyright teal">
        <div class="container white-text ">
            © 2019 Copyright
            <a class="white-text right" href="/">MNCV</a>
        </div>
    </div>
</footer>

    <asset:javascript src="application2.js"/>

</body>
</html>
