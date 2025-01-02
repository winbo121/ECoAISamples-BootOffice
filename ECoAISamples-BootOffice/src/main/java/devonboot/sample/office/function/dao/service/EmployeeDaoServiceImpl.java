package devonboot.sample.office.function.dao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.function.dao.dao.EmployeeDao;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("employeeServiceForDao")
public class EmployeeDaoServiceImpl implements EmployeeDaoService {

	@Resource(name = "employeeDao")
	private EmployeeDao employeeDao;

	public Employee retrieveEmployee(Employee employee) {
		return employeeDao.retrieveEmployee(employee);
	}

	public List<Employee> retrieveEmployeeList(Employee employee) {
		List<Employee> resultList = employeeDao.retrieveEmployeeList(employee);
		return resultList;
	}

	public void insertEmployee(Employee employee) {
		employeeDao.insertEmployee(employee);
	}

	public void updateEmployee(Employee employee) {
		employeeDao.updateEmployee(employee);
	}

	public void deleteEmployee(Employee employee) {
		employeeDao.deleteEmployee(employee);
	}

}
