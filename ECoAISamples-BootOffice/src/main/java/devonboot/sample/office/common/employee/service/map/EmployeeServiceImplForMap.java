package devonboot.sample.office.common.employee.service.map;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.paging.model.PagingEntity;

@Service("employeeServiceForMap")
public class EmployeeServiceImplForMap implements EmployeeServiceForMap{

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public Map<String, Object> retrieveEmployee(Map<String, Object> employee) {
        return commonDao.select("Employee.retrieveEmployee", employee);
    }

    public List<Map<String, Object>> retrieveEmployeeList(Map<String, Object> employee) {
        List<Map<String, Object>> resultList = commonDao.selectList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }

    public List<Map<String, Object>> retrieveEmployeePagedList(PagingEntity employee) {
        List<Map<String, Object>> resultList = commonDao.selectPagedList("Employee.retrieveEmployeeList", employee);
        return resultList;
    }

    public void insertEmployee(Map<String, Object> employee) {
        commonDao.insert("Employee.insertEmployee", employee);        
    }

    public void updateEmployee(Map<String, Object> employee) {
        commonDao.update("Employee.updateEmployee", employee);        
    }

    public void deleteEmployee(Map<String, Object> employee) {
        commonDao.delete("Employee.deleteEmployee", employee);        
    }

    public void updateEmployeeForP2(Map<String, Object> employee) {
        commonDao.update("Employee.updateEmployeeForP2", employee);        
    }

    public void saveEmployee(List<Map<String, Object>> employees) {
        
        for(Map<String, Object> employee : employees) {
            String actType = (String)employee.get("actType");
           
            if(actType.equals("C")) {
                insertEmployee(employee);

            }else if(actType.equals("U")) {
                updateEmployeeForP2(employee);

            }else if(actType.equals("D")) {
                deleteEmployee(employee);
            }
        }
    }

}
