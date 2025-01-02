package devonboot.sample.office.function.resultHandler.service;


import javax.servlet.http.HttpServletResponse;

import devonboot.sample.office.common.model.Employee;

public interface ResultHandlerService {
	public void retrieveEmployeeListWithJson(Employee employee, HttpServletResponse response);
	public void retrieveEmployeeListWithExcel(Employee employee, HttpServletResponse response);
}
