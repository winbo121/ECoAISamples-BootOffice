package devonboot.sample.office.common.model;

import javax.validation.constraints.NotEmpty;

import org.springmodules.validation.bean.conf.loader.annotation.handler.MaxLength;

import devonframe.validator.constraints.Date;
import devonframe.validator.constraints.Numeric;
import devonframe.validator.constraints.Phone;
import devonframe.validator.constraints.ResidentRegNo;


public class ValidationEmployee {

    @NotEmpty
    @Numeric
    private String num;

    private String joblevelCodeName;

    @NotEmpty
    private String joblevelCode;

    @NotEmpty
    @MaxLength(10)
    private String name;

    private String departmentCodeName;

    private String departmentCode;

    private String divisionCode;

    private String divisionCodeName;

    @NotEmpty
    @Date(pattern="yyyyMMdd")
    private String birthdate;

    private String sex;

    @ResidentRegNo(message="{errors.ssn}")
    private String ssn;

    @NotEmpty
    @Phone
    private String telephone;

    @NotEmpty
    @Numeric
    private String postal;

    private String skillCodeName;

    @NotEmpty
    private String skillCode;

    private String address;


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


    public String getDivisionCodeName() {
        return divisionCodeName;
    }


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
