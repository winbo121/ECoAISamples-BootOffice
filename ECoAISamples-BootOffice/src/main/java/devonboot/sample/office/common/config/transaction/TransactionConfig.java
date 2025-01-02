package devonboot.sample.office.common.config.transaction;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import devonframe.transaction.CompositeDataSourceTransactionManager;

@Component
public class TransactionConfig {
	
	@Autowired
	DataSource datasource;
	
	@Primary
	@Bean(name = "transactionManager")
	@Order(Ordered.HIGHEST_PRECEDENCE)
	public PlatformTransactionManager txManager() {
		PlatformTransactionManager txManager = new CompositeDataSourceTransactionManager(datasource);

		return txManager;
	}
}
