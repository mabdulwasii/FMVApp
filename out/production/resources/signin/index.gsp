<%--
  Created by IntelliJ IDEA.
  User: Totago_User3
  Date: 7/25/2019
  Time: 10:43 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Welcome to NVRD Application</title>
    <asset:link rel="icon" href="favicon.png" type="image/x-ico"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="signin.css"/>
</head>

<body>

<main>
    <div class="row container valign-wrapper valign-wrapper absolute-Center">
        <div class="col s12 m8 center-block">
            <div class="card blue-grey darken-4 hoverable">
                <div class="card-content white-text  ">
                    <span class="card-title left-align"><h4>OTP Login</h4></span>
                    <hr/>
                    <br/>
                    <br/>

                    <div class="row center-align">
                        <button data-target="phoneOTP"
                                class="btn btn-small indigo roundBtn hoverable btnWidth modal-trigger">Use Phone Number</button>
                    </div>

                    <div class="row center-align">
                        <p class="center-align">OR</p>
                    </div>

                    <div class="row center-align">
                        <button data-target="emailOTP"
                                class="btn btn-small yellow darken-3 roundBtn modal-trigger hoverable btnWidth">Use Email</button>
                    </div>
                </div>

                <div class="card-action right-align ">
                    <a href="/register/index.gsp">Register</a>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Modal Structure for phone OTP Login -->
    <div id="phoneOTP" class="modal blue-grey darken-4 white-text valign-wrapper phoneOTP">
        <div class="modal-content" id="otpContent">
            <g:form class="center-align" method="post" controller="OTP" action="generateOTPSms">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phoneNumber" type="text" class="validate white-text"
                               placeholder="Eg.- 07064907684" data-length="10" min="10" max="11">
                        <label for="phoneNumber">Please enter your phone number</label>
                        <span class="helper-text" data-error="wrong" data-success="right"></span>
                    </div>
                    <button type="submit" name="phoneOTPBtn"
                            class="btnWidth btn roundBtn modal-close waves-effect waves-green white-text btn-flat center-align indigo">Get password</button>
                </div>
            </g:form>
        </div>
    </div>

    <!-- Modal Structure for phone OTP Login -->
    <div id="emailOTP" class="modal blue-grey darken-4 white-text  valign-wrapper phoneOTP">
        <div class="modal-content otpContent">
            <g:form class="center-align" method="post" controller="OTP" action="generateOTPEmail">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate white-text"
                               placeholder="example@outlook.com" data-length="10" min="10" max="11">
                        <label for="phoneNumber">Please enter your email</label>
                        <span class="helper-text" data-error="email address is not valid" data-success="right"></span>
                    </div>
                    <button type="submit" name="phoneOTPBtn"
                            class="btnWidth btn roundBtn modal-close waves-effect waves-green white-text btn-flat center-align yellow darken-3">Get password</button>
                </div>
            </g:form>
        </div>
    </div>


    <!-- Modal Structure for register page-->
    <div id="register" class="modal blue-grey darken-4 white-text valign-wrapper registerOTP">
        <div class="modal-content" id="registerContent">
            <g:form class="center-align" method="post" controller="register" action="register" >
                <div class="row">
                    <div class="input-field col s12">
                        <input id="registerPhoneNumber" type="text" class="validate white-text"
                               placeholder="Eg.- 07064907684" data-length="10" min="10" max="11">
                        <label for="phoneNumber">Please enter your phone number</label>
                        <span class="helper-text" data-error="wrong" data-success="right"></span>
                    </div>
                    <button type="submit" name="phoneOTPBtn"
                            class="btnWidth btn roundBtn modal-close waves-effect waves-green white-text btn-flat center-align indigo">Get password</button>
                </div>
            </g:form>
        </div>
    </div>


</main>

<asset:javascript src="application.js"/>
<asset:javascript src="custom.js"/>
</body>
</html>