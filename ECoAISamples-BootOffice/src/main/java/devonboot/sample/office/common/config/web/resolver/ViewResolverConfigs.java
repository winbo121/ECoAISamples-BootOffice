package devonboot.sample.office.common.config.web.resolver;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class ViewResolverConfigs implements WebMvcConfigurer {
	
	@Bean
	public BeanNameViewResolver beanNameViewResolver() {
		BeanNameViewResolver resolver = new BeanNameViewResolver();
		resolver.setOrder(1);
		return resolver;
	}
	
	@Bean
    public TilesViewResolver tilesViewResolver() {
		TilesViewResolver resolver = new TilesViewResolver();
        resolver.setViewClass(TilesView.class);
        resolver.setOrder(2);
        return resolver;
    }
	
	
	// user AutoConfig 
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		resolver.setOrder(3);
		return resolver;
	}
	
	@Bean
    public TilesConfigurer tilesConfigurer() {
 
		TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] { "classpath:/tiles/definitions.xml" });
		configurer.setCheckRefresh(true);
		
        return configurer;
    }
	
	@Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.beanName();
        registry.tiles();
        registry.jsp("/WEB-INF/jsp/", ".jsp");
    }
}
