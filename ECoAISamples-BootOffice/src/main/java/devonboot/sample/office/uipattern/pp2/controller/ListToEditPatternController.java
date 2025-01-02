package devonboot.sample.office.uipattern.pp2.controller;

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
import devonframe.paging.PagingUtil;
import devonframe.paging.model.PagingList;
import devonframe.paging.ui.PagingUI;

@Controller("listToEditPatternForAjaxPagingController")
public class ListToEditPatternController {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;
    
    @Resource(name = "codeService")
    private CodeService codeService;
    
    @RequestMapping(value="/pattern/pp2/retrieveEmployeeList.do")
    public String retrieveEmployeeList(PagingEmployee input, ModelMap model){
        List<Employee> resultList = employeeService.retrieveEmployeePagedList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
        
        return "pattern/pp2/employeeList";
    }
    
    @RequestMapping(value="/pattern/pp2/retrieveEmployeeListAjax.do")
    public String retrieveEmployeeListAjax(PagingEmployee input, ModelMap model){
        List<Employee> resultList = employeeService.retrieveEmployeePagedList(input);

        model.addAttribute("input", input);
        model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
        
        PagingUI pagingUi = PagingUtil.getUIClass((PagingList<?>)resultList, "ajax");
        
        model.addAttribute("indexFrame", pagingUi.showIndexFrame());
        model.addAttribute("countFrame", pagingUi.showCountFrame());
        model.addAttribute("pagingSortNum", pagingUi.showSortField("사원번호","num"));
        return "ajaxView";
    }

    @RequestMapping(value="/pattern/pp2/retrieveEmployeeForm.do")
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

        return "pattern/pp2/employeeForm";
    }

    @RequestMapping(value="/pattern/pp2/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        return "redirect:/pattern/pp2/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp2/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        return "redirect:/pattern/pp2/retrieveEmployeeList.do";
    }

    @RequestMapping(value="/pattern/pp2/deleteEmployee.do")
    public String deleteEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/pp2/retrieveEmployeeList.do";
    }
}
