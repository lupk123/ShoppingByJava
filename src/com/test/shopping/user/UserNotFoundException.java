package com.test.shopping.user;

/**
 * Created by Administrator on 2016/7/15.
 */
public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(String message){
        super(message);
    }
}
