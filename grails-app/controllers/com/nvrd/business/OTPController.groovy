package com.nvrd.business

import com.nvrd.business.service.OTPService
import com.nvrd.business.service.TwiloService
import grails.plugins.mail.MailService
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class OTPController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    OTPService otpService
    MailService mailService
    TwiloService twiloService

    def generateOTPEmail(String to, String username) {

        int otp = otpService.generateOTP(username);
        logger.info("OTP : " + otp);

        mailService.sendMail {
            to to
            from "mabdulwasii@gmail.com"
            subject "OTP Login code"
            text ''
            html '<p> Hello <b>${username}</b> </p> <p>Your code is:  <h1>${otp}<h1></p>'
        }

        println "message sent via email"

    }

    def generateOTPSms(String to, String username) {

        int otp = otpService.generateOTP(username);
        logger.info("OTP : " + otp);

        def response = twiloService.sendMessage(to)
        if (response == "success"){
            render '/'

            println "message sent via sms"
        } else {
            render '/error'
        }

    }

    def validateOTP(int otpNumber, String username) {
        final String SUCCESS = "Entered Otp is valid";
        final String FAIL = "Entered Otp is NOT valid. Please Retry!";

        logger.info(" Otp Number : " + otpNumber);
        //Validate the Otp
        if (otpNumber >= 0) {
            int serverOtp = otpService.getOtp(username);
            if (serverOtp > 0) {
                if (otpNumber == serverOtp) {
                    otpService.clearOTP(username);
                    return ("Entered Otp is valid");
                } else {
                    return SUCCESS;
                }
            } else {
                return FAIL;
            }
        } else {
            return FAIL;
        }
    }
}
