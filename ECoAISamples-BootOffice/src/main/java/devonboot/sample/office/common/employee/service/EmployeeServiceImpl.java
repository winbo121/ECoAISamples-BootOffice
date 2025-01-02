package devonboot.sample.office.common.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.common.model.EmployeeArray;
import devonboot.sample.office.common.model.EmployeeDetail;
import devonboot.sample.office.common.model.PagingEmployee;
import devonboot.sample.office.common.model.ScrollPagingEmployee;
import devonboot.sample.office.common.model.ShuttleEmployeeArray;
import devonframe.dataaccess.CommonDao;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public Employee retrieveEmployee(Employee employee) {
        return commonDao.select("Employee.retrieveEmployee", employee);
    }

    public List<Employee> retrieveEmployeeList(Employee employee) {
        List<Employee> resultList = commonDao.selectList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }

    @Transactional
    public List<Employee> retrieveEmployeePagedList(PagingEmployee employee) {
        List<Employee> resultList = commonDao.selectPagedList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }
    
    public List<Employee> retrieveEmployeeScrollPagedList(ScrollPagingEmployee employee) {
        List<Employee> resultList = commonDao.selectScrollPagedList("Employee.retrieveEmployeeScrollPagingList", employee, true);
        return resultList;
    }

    public List<Employee> retrieveShuttleEmployeeList(Employee employee) {
        List<Employee> resultList = commonDao.selectList("Employee.retrieveShuttleEmployeeList", employee);
        return resultList;
    }

    public List<Employee> retrieveEmployeeTreeList(Employee employee) {

        List<Employee> resultList = commonDao.selectList("Employee.retrieveEmployeeTreeList", employee);

        return resultList;
    }

    public void insertEmployee(Employee employee) {
        commonDao.insert("Employee.insertEmployee", employee);
    }

    public void updateEmployee(Employee employee) {
        commonDao.update("Employee.updateEmployee", employee);
    }

    public void updateEmployeeForP2(Employee employee) {
        commonDao.update("Employee.updateEmployeeForP2", employee);
    }

    public void deleteEmployee(Employee employee) {
        commonDao.delete("Employee.deleteEmployee", employee);
    }

	public void saveEmployee(EmployeeArray employees) {

		List<Employee> employeeList = employees.getEmployeeList();

        for (int i = 0; i < employees.size(); i++) {
        	Employee employee = employeeList.get(i);
            String actType = employee.getActType();

            if(actType.equals("C")) {
                insertEmployee(employee);

            }else if(actType.equals("U")) {
                updateEmployeeForP2(employee);

            }else if(actType.equals("D")) {
                deleteEmployee(employee);
            }
        }
	}
    public void saveShuttleEmployeeList(ShuttleEmployeeArray shuttleEmployeeList) {
        for(Employee employee:shuttleEmployeeList.getEmployeeList() ) {
            commonDao.insert("Employee.insertShuttleEmployee", employee);
        }
        for(Employee employee:shuttleEmployeeList.getEmployeeList() ) {
            commonDao.delete("Employee.deleteShuttleEmployee", employee);
        }
    }

    public EmployeeDetail retrieveEmployeeDetail(EmployeeDetail employeeDetail) {
        EmployeeDetail resultDetail = commonDao.select("Employee.retrieveEmployeeDetail", employeeDetail);
        return resultDetail;
    }

    public void insertEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.insert("Employee.insertEmployeeDetail", employeeDetail);
    }

    public void updateEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.update("Employee.updateEmployeeDetail", employeeDetail);
    }

    public void deleteEmployeeDetail(EmployeeDetail employeeDetail) {
        commonDao.delete("Employee.deleteEmployeeDetail", employeeDetail);
    }

    public void updateEmployeeForP41(Employee employee) {
        commonDao.update("Employee.updateEmployeeForP41", employee);
    }
}