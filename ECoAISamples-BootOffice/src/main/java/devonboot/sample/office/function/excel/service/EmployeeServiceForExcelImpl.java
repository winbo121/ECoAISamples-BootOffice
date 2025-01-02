package devonboot.sample.office.function.excel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.function.excel.model.EmployeeForExcel;
import devonframe.dataaccess.CommonDao;

@Service("employeeServiceForExcel")
public class EmployeeServiceForExcelImpl implements EmployeeServiceForExcel {

    @Resource(name = "commonDao")
    private CommonDao commonDao;
    
    public List<EmployeeForExcel> retrieveEmployeeList(EmployeeForExcel employee) {
        List<EmployeeForExcel> resultList = commonDao.selectList("EmployeeForExcel.retrieveEmployeeList", employee);
        return resultList;
    }

    public void insertEmployee(EmployeeForExcel employee) {
        commonDao.insert("EmployeeForExcel.insertEmployee", employee);        
    }
}
