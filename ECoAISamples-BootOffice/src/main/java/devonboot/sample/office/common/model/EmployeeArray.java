package devonboot.sample.office.common.model;

import java.util.ArrayList;
import java.util.List;

public class EmployeeArray {

    private String[] checkIndex;
    private String[] actType;
    private String[] num;
    private String[] name;
    private String[] joblevelCode;
    private String[] skillCode;
    private String[] telephone;
    private String[] birthdate;

    public int size() {
        return checkIndex.length;
    }

    public Employee getEmployee(int index) {
        Employee employee = new Employee();

        employee.setActType(actType[index]);
        employee.setNum(num[index]);
        employee.setName(name[index]);
        employee.setJoblevelCode(joblevelCode[index]);
        employee.setSkillCode(skillCode[index]);
        employee.setTelephone(telephone[index]);
        employee.setBirthdate(birthdate[index]);

        return employee;
    }

    public List<Employee> getEmployeeList() {

    	List<Employee> employeeList = new ArrayList<Employee>();

		for (int inx = 0; inx < this.size(); inx++) {
			employeeList.add(getEmployee(inx));
		}

        return employeeList;
    }

    public String[] getCheckIndex() {
        return checkIndex;
    }
    public void setCheckIndex(String[] checkIndex) {
        this.checkIndex = checkIndex;
    }
    public String[] getActType() {
        return actType;
    }
    public void setActType(String[] actType) {
        this.actType = actType;
    }
    public String[] getNum() {
        return num;
    }
    public void setNum(String[] num) {
        this.num = num;
    }
    public String[] getName() {
        return name;
    }
    public void setName(String[] name) {
        this.name = name;
    }
    public String[] getBirthdate() {
        return birthdate;
    }
    public void setBirthdate(String[] birthdate) {
        this.birthdate = birthdate;
    }
    public String[] getTelephone() {
        return telephone;
    }
    public void setTelephone(String[] telephone) {
        this.telephone = telephone;
    }
    public String[] getJoblevelCode() {
        return joblevelCode;
    }
    public void setJoblevelCode(String[] joblevelCode) {
        this.joblevelCode = joblevelCode;
    }
    public String[] getSkillCode() {
        return skillCode;
    }
    public void setSkillCode(String[] skillCode) {
        this.skillCode = skillCode;
    }
}
