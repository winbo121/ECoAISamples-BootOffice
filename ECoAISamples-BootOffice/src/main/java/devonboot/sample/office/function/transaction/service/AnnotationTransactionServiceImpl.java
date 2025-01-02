package devonboot.sample.office.function.transaction.service;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Employee;
import devonframe.exception.SystemException;

@Service("annotationTransactionService")
public class AnnotationTransactionServiceImpl implements AnnotationTransactionService {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @Transactional(readOnly=true)
    public Employee retrieveEmployee(Employee employee) {
        Employee result = employeeService.retrieveEmployee(employee);
        return result;
    }

    //Value 를 작성하지 않으면 context-transaction.xml 에서 default로 설정된txManager를 사용
    @Transactional(rollbackFor=Exception.class)
    public void updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
    }

    @Transactional(value="txManager", rollbackFor=Exception.class)
    public void updateEmployeeRollbackCase(Employee employee) {
        employeeService.updateEmployee(employee);
        throw new SystemException(messageSourceAccessor.getMessage("dev.err.com.save"));
    }
}
