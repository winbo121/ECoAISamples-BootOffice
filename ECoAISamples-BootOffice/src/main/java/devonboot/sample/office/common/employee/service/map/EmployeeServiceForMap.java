package devonboot.sample.office.common.employee.service.map;

import java.util.List;
import java.util.Map;

import devonframe.paging.model.PagingEntity;


public interface EmployeeServiceForMap {

    public Map<String, Object> retrieveEmployee(Map<String, Object> employee);
    public List<Map<String, Object>> retrieveEmployeeList(Map<String, Object> employee);
    public List<Map<String, Object>> retrieveEmployeePagedList(PagingEntity employee);

    public void insertEmployee(Map<String, Object> employee);
    public void updateEmployee(Map<String, Object> employee);
    public void updateEmployeeForP2(Map<String, Object> employee);

    public void deleteEmployee(Map<String, Object> employee);
    
    public void saveEmployee(List<Map<String, Object>> employees);

    
}
