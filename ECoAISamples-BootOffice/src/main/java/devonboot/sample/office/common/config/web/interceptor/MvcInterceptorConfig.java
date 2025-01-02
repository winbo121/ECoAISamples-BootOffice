package devonboot.sample.office.common.config.web.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import devonboot.sample.office.common.login.interceptor.LoginCheckInterceptor;
import devonboot.sample.office.common.menu.interceptor.MenuInfoInterceptor;

@Configuration
public class MvcInterceptorConfig implements WebMvcConfigurer {
	
	@Autowired
	MessageSourceAccessor messageSourceAccessor;
	
	// 다국어 적용
	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr = new SessionLocaleResolver();
		slr.setDefaultLocale(Locale.KOREAN);
		return slr;
	}
	
	@Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }
	
	// 로그인 Interceptor
	@Bean
	public LoginCheckInterceptor loginCheckInterceptor() {
		LoginCheckInterceptor interceptor = new LoginCheckInterceptor();

		List<String> skipUrls = new ArrayList<String>();
		skipUrls.add("/common/login/retrieveLoginForm.do");
		skipUrls.add("/common/login/login.do");
		skipUrls.add("/resource/**");
		interceptor.setSkipUrls(skipUrls);
		
		return interceptor;
	}
	
	//MenuInterceptor
	@Bean
	public MenuInfoInterceptor menuInfoInterceptor() {
		MenuInfoInterceptor interceptor = new MenuInfoInterceptor();
		
		return interceptor;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginCheckInterceptor()).addPathPatterns("/**").excludePathPatterns("/unittest/**");
		registry.addInterceptor(localeChangeInterceptor());
		registry.addInterceptor(menuInfoInterceptor()).addPathPatterns("/**");
	}
}
