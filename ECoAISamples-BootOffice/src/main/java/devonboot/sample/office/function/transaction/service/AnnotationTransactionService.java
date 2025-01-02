package devonboot.sample.office.function.transaction.service;

import devonboot.sample.office.common.model.Employee;

public interface AnnotationTransactionService {

    public Employee retrieveEmployee(Employee employee);

    public void updateEmployee(Employee employee);

    public void updateEmployeeRollbackCase(Employee employee);

}
