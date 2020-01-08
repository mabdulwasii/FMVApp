package com.nvrd.business.service

import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.LoadingCache
import grails.transaction.Transactional

@Transactional
class OTPService {

    //cache based on username and OPT MAX 8
    private static final Integer EXPIRE_MINS = 5;
    private LoadingCache<String, Integer> otpCache;

    OTPService() {
        otpCache = CacheBuilder.newBuilder().
                expireAfterWrite(EXPIRE_MINS, TimeUnit.MINUTES).build(new CacheLoader<String, Integer>() {
            public Integer load(String key) {
                return 0;
            }
           });
    }

    //This method is used to push the opt number against Key. Rewrite the OTP if it exists
    //Using user id  as key
    def generateOTP(String key){
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        otpCache.put(key, otp);
        return otp;
    }
    //This method is used to return the OPT number against Key->Key values is username
    def getOtp(String key){
        try{
            return otpCache.get(key);
        }catch (Exception e){
            return 0;
        }
    }
//This method is used to clear the OTP catched already
    def clearOTP(String key){
        otpCache.invalidate(key);
    }
}
