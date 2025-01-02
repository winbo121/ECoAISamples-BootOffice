package devonboot.sample.office.function.validator.bean.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.ValidationEmployee;
import devonframe.dataaccess.CommonDao;


@Service(value="employeeServiceForBeanValidator")
public class ValidationEmployeeServiceImpl implements ValidationEmployeeService {
    
    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public ValidationEmployee retrieveEmployee(ValidationEmployee employee) {
        return commonDao.select("EmployeeForBeanValidator.retrieveEmployee", employee);
    }    

    public void insertEmployee(ValidationEmployee employee) {
        commonDao.insert("EmployeeForBeanValidator.insertEmployee", employee);        
    }

    public void updateEmployee(ValidationEmployee employee) {
        commonDao.insert("EmployeeForBeanValidator.updateEmployee", employee);        
    }

    public void deleteEmployee(ValidationEmployee employee) {
        commonDao.insert("EmployeeForBeanValidator.deleteEmployee", employee);        
    }

}
