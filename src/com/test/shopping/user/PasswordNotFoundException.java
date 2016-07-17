package com.test.shopping.user;

/**
 * Created by Administrator on 2016/7/15.
 */
public class PasswordNotFoundException extends RuntimeException {
    public PasswordNotFoundException(String message){
        super(message);
    }
}
