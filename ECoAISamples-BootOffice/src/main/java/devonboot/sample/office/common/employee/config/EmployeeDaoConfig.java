package devonboot.sample.office.common.employee.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EmployeeDaoConfig {
	
	/**
	 * 별도의 sqlSessionFactory를 설정하지 않은 경우 CommonDaoSqlSessionFactory가 주입된다.
	 * 
	 * @param sqlSessionFactory
	 * @return
	 * @throws Exception
	 */
	@Bean("sqlSessionTemplateDao")
	public SqlSessionTemplate getSqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
