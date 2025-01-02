package devonboot.sample.office.uipattern.p12.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonframe.message.saymessage.SayMessage;



@Controller
public class SingleEditPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/pattern/p12/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("result", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "pattern/p12/employeeForm";
    }

    @RequestMapping(value = "/pattern/p12/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {

        Employee input = new Employee();
        Code code = new Code();
        input.setNum(searchNum);

        Employee employee = employeeService.retrieveEmployee(input);
        if (employee == null) {
            employee = new Employee();
            SayMessage.setMessageCode("dev.inf.com.nodata");
        }

        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("result", employee);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

        return "pattern/p12/employeeForm";
    }

    @RequestMapping(value = "/pattern/p12/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p12/retrieveEmployee.do";

    }

    @RequestMapping(value = "/pattern/p12/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p12/retrieveEmployee.do";
    }

    @RequestMapping(value = "/pattern/p12/deleteEmployee.do")
    public String deleteEmployee(Employee input) {
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/p12/retrieveEmployee.do";
    }

}
