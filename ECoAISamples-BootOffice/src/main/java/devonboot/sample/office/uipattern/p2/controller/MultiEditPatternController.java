package devonboot.sample.office.uipattern.p2.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.common.model.EmployeeArray;

@Controller
public class MultiEditPatternController {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

   @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value="/pattern/p2/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model){

        List<Employee> resultList = employeeService.retrieveEmployeeList(input);
        List<Code> joblevelCodeList = codeService.retrieveJobLevelCodeList();
        List<Code> skillCodeList = codeService.retrieveSkillCodeList();

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", joblevelCodeList);
        model.addAttribute("skillCodeList", skillCodeList);

        return "pattern/p2/employeeList";
    }

    @RequestMapping(value="/pattern/p2/saveEmployeeList.do")
    public String saveEmployee(EmployeeArray employees, String searchJoblevelCode, String searchSkillCode, RedirectAttributes redirectAttributes){

    	employeeService.saveEmployee(employees);

    	redirectAttributes.addAttribute("joblevelCode", searchJoblevelCode);
        redirectAttributes.addAttribute("skillCode", searchSkillCode);

        return "redirect:/pattern/p2/retrieveEmployeeList.do";
    }
}