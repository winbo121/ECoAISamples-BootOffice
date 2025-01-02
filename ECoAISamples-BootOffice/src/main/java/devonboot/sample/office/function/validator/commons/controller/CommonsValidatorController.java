package devonboot.sample.office.function.validator.commons.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonframe.message.saymessage.SayMessage;

@Controller
public class CommonsValidatorController {
    
    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name="commonsValidator")
    private DefaultBeanValidator validator;    

    @RequestMapping(value = "/function/validator/commons/validator.do")
    public String validatorClient() {

        return "function/validator/commons/validator";
    }
    
    @RequestMapping(value = "/function/validator/commons/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/validator/commons/employeeForm";
    }
    
    @RequestMapping(value = "/function/validator/commons/insertEmployee.do")
    public String insertEmployee(Employee employee,  ModelMap model, BindingResult bindingResult) {
        
        validator.validate(employee, bindingResult);

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());
        
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        
        if(bindingResult.hasErrors()) {
            model.addAttribute("employee", employee);
            
        } else {
            employeeService.insertEmployee(employee);
            SayMessage.setMessageCode("dev.suc.com.save");
        }
        return "function/validator/commons/employeeForm";
    }
}
