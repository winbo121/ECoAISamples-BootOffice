package devonboot.sample.office.function.validator.bean.service;

import devonboot.sample.office.common.model.ValidationEmployee;


public interface ValidationEmployeeService {
    
    public ValidationEmployee retrieveEmployee(ValidationEmployee employee);
    
    public void insertEmployee(ValidationEmployee employee);

    public void updateEmployee(ValidationEmployee employee);

    public void deleteEmployee(ValidationEmployee employee);
}
