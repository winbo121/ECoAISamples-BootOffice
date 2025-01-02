package devonboot.sample.office.common.config.refresh;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import devonframe.refresh.BeanRefreshManager;
import devonframe.refresh.controller.BeanRefreshController;

@Configuration
public class RefreshConfig {
	
	@Bean
	public BeanRefreshManager beanRefreshManager() {
		return new BeanRefreshManager();
	}
	
	@Bean(name="/admin/refreshController.do")
	public BeanRefreshController refreshController () {
		BeanRefreshController bean = new BeanRefreshController();
		bean.setBeanRefreshManager(beanRefreshManager());
		
		return bean;
	}
	
	
}
