package devonboot.sample.office.common.config.idgeneration;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;


import devonframe.idgen.formatter.DefaultIdGeneratorFormatter;
import devonframe.idgen.formatter.IdGeneratorFormatter;
import devonframe.idgen.generator.DBSequenceIdGenerator;
import devonframe.idgen.generator.SequenceIdGenerator;
import devonframe.idgen.generator.TableIdGenerator;

@Configuration
public class IdGenerationConfig {
	
	@Autowired
	PlatformTransactionManager txManager;
	
	@Autowired
	DataSource dataSource;
	
	
	@Bean
	public DefaultIdGeneratorFormatter common() {
		DefaultIdGeneratorFormatter formatter = new DefaultIdGeneratorFormatter();
		formatter.setPreFix("common");
		formatter.setSeperator("-");
		formatter.setFillCharacter("*");
		formatter.setSequenceSize(5);
		return formatter;
	}
	
	@Bean
	public DefaultIdGeneratorFormatter account() {
		DefaultIdGeneratorFormatter formatter = new DefaultIdGeneratorFormatter();
		formatter.setPreFix("Account");
		formatter.setSeperator("-");
		formatter.setFillCharacter("+");
		formatter.setSequenceSize(3);
		return formatter;
	}
	
	@Bean
	public DefaultIdGeneratorFormatter employee() {
		DefaultIdGeneratorFormatter formatter = new DefaultIdGeneratorFormatter();
		formatter.setPreFix("Employee");
		formatter.setSeperator("-");
		formatter.setFillCharacter("*");
		formatter.setSequenceSize(3);
		return formatter;
	}
	
	@Bean
	public TableIdGenerator tableIdGenerator() {
		TableIdGenerator generator = new TableIdGenerator();
		generator.setTransactionManager(txManager);
		generator.setDataSource(dataSource);
		generator.setDecimalEnabled(false);
		generator.setIdTable("TDO_IDGEN");
		generator.setKeyColumn("ID_KEY");
		generator.setSequenceColumn("ID_SEQ");
		generator.setKeyName("AA-01");
		generator.setRetryCount(2);
		generator.setBlockSize(5);
		generator.setGlobalFormatter(common());
		
		Map<String, IdGeneratorFormatter> map =new HashMap<>();
		map.put("Account", account());
		map.put("Employee", employee());
		generator.setFormatterMap(map);
		
		return generator;
	}
	
	@Bean
	public SequenceIdGenerator sequenceIdGenerator() {
		SequenceIdGenerator generator = new SequenceIdGenerator();
		generator.setStandardDateFormat("yyyy");
		generator.setSequenceSize(5);
		generator.setGlobIdTypeCode("ON");
		generator.setInstanceNumber("instanceNumber");
		generator.setSystemName("systemName");
		generator.setGlobalFormatter(common());
		
		Map<String, IdGeneratorFormatter> map =new HashMap<>();
		map.put("Account", account());
		map.put("Employee", employee());
		generator.setFormatterMap(map);
		
		return generator;
	}
	
	@Bean
	public DBSequenceIdGenerator dBSequenceIdGenerator() {
		DBSequenceIdGenerator generator = new DBSequenceIdGenerator();
		generator.setQuery("SELECT NEXT VALUE FOR idsequence");
		generator.setDataSource(dataSource);
		generator.setDecimalEnabled(true);
		generator.setGlobalFormatter(common());
		
		Map<String, IdGeneratorFormatter> map =new HashMap<>();
		map.put("Account", account());
		map.put("Employee", employee());
		generator.setFormatterMap(map);
		
		return generator;
	}
}