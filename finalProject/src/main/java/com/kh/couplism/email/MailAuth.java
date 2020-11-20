package com.kh.couplism.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		super();
	}
	
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
	 String username = "couplism";
	 String password = "zjvmfflwma20!";
	    if ((username != null) && (username.length() > 0) && (password != null) 
	      && (password.length   () > 0)) {

	        return new PasswordAuthentication(username, password);
	    }

	    return null;
	}
}
