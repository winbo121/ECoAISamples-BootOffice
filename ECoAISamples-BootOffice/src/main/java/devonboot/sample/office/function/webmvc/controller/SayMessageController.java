package devonboot.sample.office.function.webmvc.controller;

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
public class SayMessageController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/function/webmvc/saymessage/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/webmvc/saymessage/employeeForm";
    }

    @RequestMapping(value = "/function/webmvc/saymessage/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {

        Employee input = new Employee();
        input.setNum(searchNum);

        Employee employee = employeeService.retrieveEmployee(input);

        if (employee == null) {
            employee = new Employee();
            SayMessage.setMessageCode("dev.inf.com.nodata");
        } else {
            model.addAttribute("mode", "update");
        }


        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("employee", employee);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

        return "function/webmvc/saymessage/employeeForm";
    }

    @RequestMapping(value = "/function/webmvc/saymessage/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        SayMessage.setMessage(messageSourceAccessor.getMessage("dev.suc.com.update"));
        return "redirect:/function/webmvc/saymessage/retrieveEmployee.do";
    }

}
