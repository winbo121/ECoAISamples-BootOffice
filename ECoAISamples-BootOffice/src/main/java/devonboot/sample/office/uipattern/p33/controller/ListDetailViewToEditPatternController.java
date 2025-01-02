package devonboot.sample.office.uipattern.p33.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonframe.util.NullUtil;

@Controller
public class ListDetailViewToEditPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/pattern/p33/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("input", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/p33/employeeForm";
    }

    @RequestMapping(value = "/pattern/p33/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model) {

        if(!NullUtil.isNone(input.getSkillCode()) || !NullUtil.isNone(input.getJoblevelCode())) {
            model.addAttribute("resultList", employeeService.retrieveEmployeeList(input));
        }
        
        model.addAttribute("input", input);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/p33/employeeForm";

    }

    @RequestMapping(value = "/pattern/p33/retrieveEmployee.do")
    public String retrieveEmployee(Employee input, ModelMap model) {

        Employee employee = employeeService.retrieveEmployee(input);

        if (employee == null) {
            employee = new Employee();
        }
        model.addAttribute("input", employee);

        return "ajaxView";
	}

    @RequestMapping(value = "/pattern/p33/updateEmployeeFormPopup.do")
    public String updateEmployeeFormPopup(Employee input, ModelMap model) {

        Employee employee = employeeService.retrieveEmployee(input);

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("result", employee);

        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

        return "pattern/p33/employeeFormPopup";
    }

    @RequestMapping(value = "/pattern/p33/insertEmployeeFormPopup.do")
    public String insertEmployee(ModelMap model) {

        // model.addAttribute("mode", "insert");
        model.addAttribute("result", new Employee());

        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());
	        
        return "pattern/p33/employeeFormPopup";
	}

    @RequestMapping(value = "/pattern/p33/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("num", input.getNum());
        redirectAttributes.addAttribute("mode", "insert");
        return "redirect:/pattern/p33/updateEmployeeFormPopup.do";

    }

    @RequestMapping(value = "/pattern/p33/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("num", input.getNum());
        redirectAttributes.addAttribute("mode", "update");
        return "redirect:/pattern/p33/updateEmployeeFormPopup.do";

	}

    @RequestMapping(value = "/pattern/p33/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes) {
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/p33/retrieveEmployeeList.do";
	}
}
