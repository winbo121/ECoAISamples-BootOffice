package devonboot.sample.office.function.resultHandler.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.Employee;
import devonframe.dataaccess.CommonDao;
import devonframe.dataaccess.mybatis.resultHandler.ExcelStreamResultHandler;
import devonframe.dataaccess.mybatis.resultHandler.JsonStreamResultHandler;
import devonframe.dataaccess.mybatis.resultHandler.StreamingExcelWriter;

@Service("resultHandlerService")
public class ResultHandlerServiceImpl implements ResultHandlerService {

	@Resource(name = "commonDao")
	private CommonDao commonDao;
	
	public void retrieveEmployeeListWithJson(Employee employee, HttpServletResponse response) {
		commonDao.selectList("Employee.retrieveEmployeeList", employee, new JsonStreamResultHandler(response));
	}
	
	public void retrieveEmployeeListWithExcel(Employee employee, HttpServletResponse response) {
		commonDao.selectList("Employee.retrieveEmployeeList", employee, new ExcelStreamResultHandler(new StreamingExcelWriter(response, "test.xlsx")));
	}
}
