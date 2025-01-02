package devonboot.sample.office.common.model;

import java.util.ArrayList;
import java.util.List;

import devonframe.util.NullUtil;

public class ShuttleEmployeeArray {
    
    private String [] num;
    
    private String [] type;

    private List<Employee> employeeList;
    
    public List<Employee> getEmployeeList() {
        if(NullUtil.isNone(employeeList)) {
            this.employeeList = new ArrayList<Employee>();
            if(this.num != null) {
                for(int inx = 0; inx< this.num.length; inx++) {
                    Employee employee = new Employee();
                    employee.setNum(this.num[inx]);
                    employee.setType(this.type[inx]);
                    employeeList.add(employee);
                }
            }
        }
        return employeeList;
    }
    
    public String[] getNum() {
        return num;
    }

    
    public void setNum(String[] num) {
        this.num = num;
    }

    
    public String[] getType() {
        return type;
    }

    
    public void setType(String[] type) {
        this.type = type;
    }
}
