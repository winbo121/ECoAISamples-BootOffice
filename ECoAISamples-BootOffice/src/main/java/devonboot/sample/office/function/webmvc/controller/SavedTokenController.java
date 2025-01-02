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



@Controller
public class SavedTokenController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/function/webmvc/savedtoken/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/webmvc/savedtoken/employeeForm";
    }

    @RequestMapping(value = "/function/webmvc/savedtoken/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {

        Employee input = new Employee();
        input.setNum(searchNum);

        Employee employee = employeeService.retrieveEmployee(input);
        model.addAttribute("mode", "update");

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("employee", employee);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

        return "function/webmvc/savedtoken/employeeForm";
    }

    @RequestMapping(value = "/function/webmvc/savedtoken/updateEmployee.do")
    public String updateEmployee(Employee input, ModelMap model, RedirectAttributes redirectAttributes) throws InterruptedException {

        Thread.sleep(2000);
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        model.addAttribute("resultMsg", messageSourceAccessor.getMessage("dev.suc.com.update"));
        return "redirect:/function/webmvc/savedtoken/retrieveEmployee.do";
    }

}
