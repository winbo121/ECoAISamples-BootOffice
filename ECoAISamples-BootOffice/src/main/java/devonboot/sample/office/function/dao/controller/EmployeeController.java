package devonboot.sample.office.function.dao.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.function.dao.service.EmployeeDaoService;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class EmployeeController {

    @Resource(name = "employeeServiceForDao")
    private EmployeeDaoService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value="/function/dao/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model){

        List<Employee> resultList = employeeService.retrieveEmployeeList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());

        return "function/dao/employeeList";
    }

    @RequestMapping(value="/function/dao/retrieveEmployeeForm.do")
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
            model.addAttribute("input",input);
        }
        model.addAttribute("employee",employee);

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "function/dao/employeeForm";
    }

    @RequestMapping(value="/function/dao/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/function/dao/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/function/dao/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/function/dao/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/function/dao/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/function/dao/retrieveEmployeeList.do";
    }

}
