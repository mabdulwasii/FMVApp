<html>
<head>
	<title><g:message code='springSecurity.login.title'/></title>
	<meta name="layout" content="login">
</head>

<body >

<main>
	<center>
		<section class="row"></section>
		<h4><a href="/" class="indigo-text lighten-5"> NVRD </a></h4>
		<h5 class="white-text ">Please, login into your account</h5>

		<div class="container">
			<div class='row error_msg'  >
				<div class='col s12'>
					<section>
						<g:if test='${flash.message}'>
							<div id="error_message" class="red-text">${flash.message}</div>
						</g:if>
					</section>
				</div>
			</div>
			<div class="row white" style="display: inline-block; padding: 4px 16px 8px 16px; border: 1px solid #EEE;">

				<form class="col s12" action="${postUrl ?: '/login/authenticate'}" method="POST" autocomplete="off">

					<div class='row' style="margin-bottom: 0px">
						<div class='input-field col s12'>
							<input class='validate' type='text' min="6" id='username' name="${usernameParameter ?: 'username'}" />
							<label for='username'>Enter your username</label>
						</div>
					</div>

					<div class='row' style="margin-bottom: 0px">
						<div class='input-field col s12'>
							<input class='validate' type='password' min="8" name="${passwordParameter ?: 'password'}" id='password' />
							<label for='password'>Enter your password</label>
						</div>
					</div>

					<div class="row" >
						<p style="margin-bottom: 0px; margin-top: 0px">
							<input type="checkbox" class="yellow" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>  />
							<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label>
						</p>
					</div>

						<div class='row'>
							<button type='submit' name='btn_login' class='col s12 btn btn-flat waves-effect indigo white-text'>Login</button>
						</div>
					<div class='row'>
						<a href="/signin" type='submit' name='btn_loginOTP' class='col s12 btn btn-flat waves-effect yellow darken-3 white-text'>Use Otp to login</a>
					</div>

					<div style="font-size: 16px;">
						<g:link controller='register' ><g:message code='spring.security.ui.login.register'/></g:link>
						<span><b>|</b></span>
						<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
					</div>

				</form>
			</div>
		</div>
	</center>
	<div class="section"></div>
</main>


<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>

</body>
</html>