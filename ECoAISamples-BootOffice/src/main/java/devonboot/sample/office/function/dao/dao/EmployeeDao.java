package devonboot.sample.office.function.dao.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import devonboot.sample.office.common.model.Employee;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 Dao 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Repository
public class EmployeeDao  {

	@Autowired
	private SqlSession sqlSession;

	public Employee retrieveEmployee(Employee employee) {
		return sqlSession.selectOne("Employee.retrieveEmployee", employee);
	}

	public List<Employee> retrieveEmployeeList(Employee employee) {
		return sqlSession.selectList("Employee.retrieveEmployeeList", employee);
	}

	public void insertEmployee(Employee employee) {
		sqlSession.insert("Employee.insertEmployee", employee);
	}

	public void updateEmployee(Employee employee) {
		sqlSession.update("Employee.updateEmployee", employee);
	}

	public void deleteEmployee(Employee employee) {
		sqlSession.delete("Employee.deleteEmployee", employee);
	}

}
