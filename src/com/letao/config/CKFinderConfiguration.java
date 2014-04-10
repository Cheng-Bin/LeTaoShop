package com.letao.config;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.ckfinder.connector.configuration.Configuration;
import com.letao.model.user.User;
public class CKFinderConfiguration extends Configuration {
   
	public CKFinderConfiguration(ServletConfig servletConfig) {
        super(servletConfig);
    }
    
    @Override
    protected Configuration createConfigurationInstance() {
        return new CKFinderConfiguration(this.servletConf);
    }
    
    @Override
    public boolean checkAuthentication(final HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        boolean logined = ("³Ì±ó").equals(user.getUserName().trim());
        return logined;
    }
}
