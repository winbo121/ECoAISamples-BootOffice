package devonboot.sample.office.common.config.validator;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springmodules.validation.commons.DefaultValidatorFactory;

import devonframe.validator.commons.BeanValidator;

@Configuration
public class ValidationConfig implements WebMvcConfigurer {

	@Autowired
	MessageSource messageSource;
	
	@Bean("beanValidator")
	public LocalValidatorFactoryBean beanValidator() {
	    LocalValidatorFactoryBean factory = new LocalValidatorFactoryBean();
	    factory.setValidationMessageSource(messageSource);
	    return factory;
	}
	
	@Bean
	public DefaultValidatorFactory validatorFactory() throws Exception {
		DefaultValidatorFactory factory = new DefaultValidatorFactory();
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		
		try {
			factory.setValidationConfigLocations(resolver.getResources("classpath:validator/validator-*.xml")); 
			return factory;
		} catch(IOException e) {
			throw new IllegalArgumentException("Can Not Find message file about validator");
		}
	}
	
	@Bean("commonsValidator")
	public BeanValidator commonsValidator() throws Exception {
		BeanValidator validator = new BeanValidator();
		validator.setValidatorFactory(validatorFactory());
		return validator;
	}
	
	
}
