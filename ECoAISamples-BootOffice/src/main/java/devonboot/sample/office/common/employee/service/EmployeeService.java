package devonboot.sample.office.common.employee.service;

import java.util.List;

import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.common.model.EmployeeArray;
import devonboot.sample.office.common.model.EmployeeDetail;
import devonboot.sample.office.common.model.PagingEmployee;
import devonboot.sample.office.common.model.ScrollPagingEmployee;
import devonboot.sample.office.common.model.ShuttleEmployeeArray;

public interface EmployeeService {

    public Employee retrieveEmployee(Employee employee);
    
        public List<Employee> retrieveShuttleEmployeeList(Employee employee);
        public List<Employee> retrieveEmployeeTreeList(Employee employee);

    public List<Employee> retrieveEmployeeList(Employee employee);

    public void saveShuttleEmployeeList(ShuttleEmployeeArray shuttleEmployeeList);

    public List<Employee> retrieveEmployeePagedList(PagingEmployee employee);
    
    public List<Employee> retrieveEmployeeScrollPagedList(ScrollPagingEmployee employee);

    public void insertEmployee(Employee employee);

    public void updateEmployee(Employee employee);

    public void deleteEmployee(Employee employee);

    public void updateEmployeeForP2(Employee employee);

    public EmployeeDetail retrieveEmployeeDetail(EmployeeDetail employeeDetail);

    public void insertEmployeeDetail(EmployeeDetail employeeDetail);

    public void updateEmployeeDetail(EmployeeDetail employeeDetail);

    public void deleteEmployeeDetail(EmployeeDetail employeeDetail);

    public void updateEmployeeForP41(Employee employee);

	public void saveEmployee(EmployeeArray employees);

}

