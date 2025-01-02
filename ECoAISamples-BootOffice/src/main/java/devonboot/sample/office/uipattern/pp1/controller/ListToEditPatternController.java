package devonboot.sample.office.uipattern.pp1.controller;

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
import devonboot.sample.office.common.model.PagingEmployee;

@Controller("listToEditPatternForWebPagingController")
public class ListToEditPatternController {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value="/pattern/pp1/retrieveEmployeeList.do")
    public String retrieveEmployeeList(PagingEmployee input, ModelMap model){

        List<Employee> resultList = employeeService.retrieveEmployeePagedList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());

        return "pattern/pp1/employeeList";
    }

    @RequestMapping(value="/pattern/pp1/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(Employee input, String mode, ModelMap model){

        Employee employee = null;

        if("update".equals(mode)) {

            employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new Employee();
            }
            Code code = new Code();
            code.setCodeGroup(employee.getDivisionCode());
            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            employee = new Employee();
        }
        
        model.addAttribute("input",input);
        model.addAttribute("result",employee);
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/pp1/employeeForm";
    }

    @RequestMapping(value="/pattern/pp1/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/pattern/pp1/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp1/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/pattern/pp1/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp1/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/pp1/retrieveEmployeeList.do";
    }

}
