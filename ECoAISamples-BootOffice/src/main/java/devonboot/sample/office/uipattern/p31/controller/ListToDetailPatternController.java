package devonboot.sample.office.uipattern.p31.controller;

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

@Controller
public class ListToDetailPatternController {

    @Resource(name = "codeService")
    private CodeService codeService;

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

	@RequestMapping(value="/pattern/p31/retrieveEmployee.do")
	public String retrieveEmployee(Employee input, ModelMap model){
		Employee employee = employeeService.retrieveEmployee(input);
		if(employee == null) {
			employee = new Employee();
			model.addAttribute("mode", "insert");
		}else{
			model.addAttribute("mode", "update");
		}
		model.addAttribute("result", employee);

		return "pattern/p31/employeeDetail";
	}

	@RequestMapping(value="/pattern/p31/retrieveEmployeeForm.do")
	public String retrieveEmployeeForm(Employee input, ModelMap model){
		Employee employee = employeeService.retrieveEmployee(input);
		if(employee == null) {
			employee = new Employee();
			model.addAttribute("mode", "insert");
		}else{
			model.addAttribute("mode", "update");

	        Code code = new Code();
	        code.setCodeGroup(employee.getDivisionCode());

	        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
		}

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        model.addAttribute("result", employee);

		return "pattern/p31/employeeForm";
	}

	@RequestMapping(value="/pattern/p31/retrieveEmployeeList.do")
	public String retrieveEmployeeList(Employee input, ModelMap model){

		List<Employee> resultList = employeeService.retrieveEmployeeList(input);

		model.addAttribute("input", input);
		model.addAttribute("resultList", resultList);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

		return "pattern/p31/employeeList";
	}

	@RequestMapping(value="/pattern/p31/insertEmployee.do")
	public String insertEmployee(Employee input, ModelMap model, RedirectAttributes redirectAttributes){
		employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("num", input.getNum());
		return "redirect:/pattern/p31/retrieveEmployee.do";
	}

	@RequestMapping(value="/pattern/p31/updateEmployee.do")
	public String updateEmployee(Employee input, ModelMap model, RedirectAttributes redirectAttributes){
		employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("num", input.getNum());
		return "redirect:/pattern/p31/retrieveEmployee.do";
	}

	@RequestMapping(value="/pattern/p31/deleteEmployee.do")
	public String deleteEmployee( Employee input, ModelMap model, RedirectAttributes redirectAttributes){
		employeeService.deleteEmployee(input);
        redirectAttributes.addAttribute("num", input.getNum());
		return "redirect:/pattern/p31/retrieveEmployeeList.do";
	}

}
