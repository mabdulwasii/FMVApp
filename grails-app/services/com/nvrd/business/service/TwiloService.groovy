package com.nvrd.business.service

import com.twilio.type.PhoneNumber
import grails.transaction.Transactional
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

@Transactional
class TwiloService {

    String accountSid = "AC128ee85a2bbda85aa8d623f41e5fb868"; // Your Account SID from www.twilio.com/user/account
    String authToken = "b171868a20e0090cd379855952123bae"; // Your Auth Token from www.twilio.com/user/account

    def sendMessage(String to) {

        Twilio.init(accountSid, authToken);

        Message message = Message.creator(
                new PhoneNumber(to),  // To number
                new PhoneNumber("+13343262450"),  // From number
                "Hello world!"                    // SMS body
        ).create();

        System.out.println(message.getSid());
        "success"
    }
}
