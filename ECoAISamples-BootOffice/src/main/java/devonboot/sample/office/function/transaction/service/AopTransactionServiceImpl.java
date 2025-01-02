package devonboot.sample.office.function.transaction.service;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;

import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Employee;
import devonframe.exception.SystemException;

@Service("aopTransactionService")
public class AopTransactionServiceImpl implements AopTransactionService {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    public Employee retrieveEmployee(Employee employee) {
        Employee result = employeeService.retrieveEmployee(employee);
        return result;
    }

    public void updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
    }

    public void updateEmployeeRollbackCase(Employee employee) {
        employeeService.updateEmployee(employee);
        throw new SystemException(messageSourceAccessor.getMessage("dev.err.com.save"));
    }
}
