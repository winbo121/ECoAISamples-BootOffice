package devonboot.sample.office.common.model;

public class Employee extends BaseModel {

    private String num;

    private String joblevelCodeName;

    private String joblevelCode;

    private String name;

    private String departmentCodeName;

    private String departmentCode;

    private String divisionCode;

    private String divisionCodeName;

    private String birthdate;

    private String sex;

    private String ssn;

    private String telephone;

    private String postal;

    private String skillCodeName;

    private String skillCode;

    private String address;

    private String type;

    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }

    public String getNum() {
        return num;
    }


    public void setNum(String num) {
        this.num = num;
    }


    public String getJoblevelCodeName() {
        return joblevelCodeName;
    }


    public void setJoblevelCodeName(String joblevelCodeName) {
        this.joblevelCodeName = joblevelCodeName;
    }


    public String getJoblevelCode() {
        return joblevelCode;
    }


    public void setJoblevelCode(String joblevelCode) {
        this.joblevelCode = joblevelCode;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getDepartmentCodeName() {
        return departmentCodeName;
    }


    public void setDepartmentCodeName(String departmentCodeName) {
        this.departmentCodeName = departmentCodeName;
    }


    public String getDepartmentCode() {
        return departmentCode;
    }


    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }


    public String getDivisionCode() {
        return divisionCode;
    }


    public void setDivisionCode(String divisionCode) {
        this.divisionCode = divisionCode;
    }

    /**
    *
    *
    * @return the divisionCodeName
    */
   public String getDivisionCodeName() {
       return divisionCodeName;
   }


   /**
    *
    *
    * @param divisionCodeName the divisionCodeName to set
    */
   public void setDivisionCodeName(String divisionCodeName) {
       this.divisionCodeName = divisionCodeName;
   }

    public String getBirthdate() {
        return birthdate;
    }


    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }


    public String getSex() {
        return sex;
    }


    public void setSex(String sex) {
        this.sex = sex;
    }


    public String getSsn() {
        return ssn;
    }


    public void setSsn(String ssn) {
        this.ssn = ssn;
    }


    public String getTelephone() {
        return telephone;
    }


    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }


    public String getPostal() {
        return postal;
    }


    public void setPostal(String postal) {
        this.postal = postal;
    }


    public String getSkillCodeName() {
        return skillCodeName;
    }


    public void setSkillCodeName(String skillCodeName) {
        this.skillCodeName = skillCodeName;
    }


    public String getSkillCode() {
        return skillCode;
    }


    public void setSkillCode(String skillCode) {
        this.skillCode = skillCode;
    }


    public String getAddress() {
        return address;
    }


    public void setAddress(String address) {
        this.address = address;
    }
}
