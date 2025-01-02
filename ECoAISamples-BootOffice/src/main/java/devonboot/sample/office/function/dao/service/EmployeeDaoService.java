package devonboot.sample.office.function.dao.service;

import java.util.List;

import devonboot.sample.office.common.model.Employee;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 Service 인터페이스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

public interface EmployeeDaoService {

	public Employee retrieveEmployee(Employee employee);
	public List<Employee> retrieveEmployeeList(Employee employee);

	public void insertEmployee(Employee employee);
	public void updateEmployee(Employee employee);
	public void deleteEmployee(Employee employee);

}
