package devonboot.sample.office.uipattern.p43.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.common.model.EmployeeDetail;
import devonframe.util.NullUtil;

@Controller
public class ListDetailPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/pattern/p43/employeeListDetail.do")
    public String employeeDetail(ModelMap model) {
        model.addAttribute("result", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        return "pattern/p43/employeeListDetail";
    }

    @RequestMapping(value = "/pattern/p43/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model) {
        model.addAttribute("result", input);
        model.addAttribute("resultList", employeeService.retrieveEmployeeList(input));
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        return "pattern/p43/employeeListDetail";
    }


    @RequestMapping(value = "/pattern/p43/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {
        Employee input = new Employee();
        input.setNum(searchNum);
        Employee employee = employeeService.retrieveEmployee(input);

        EmployeeDetail employeeDetail = new EmployeeDetail();
        employeeDetail.setNum(searchNum);
        EmployeeDetail resultDetail = employeeService.retrieveEmployeeDetail(employeeDetail);

        if (NullUtil.isNull(resultDetail)) {
            model.addAttribute("mode", "insert");
            resultDetail = new EmployeeDetail();
        } else {
            model.addAttribute("mode", "update");
        }

        model.addAttribute("result", employee);
        model.addAttribute("resultDetail", resultDetail);

        return "ajaxView";
    }

    @RequestMapping(value = "/pattern/p43/updateEmployeeDetail.do")
    public String updateEmployeeDetail(Employee input, EmployeeDetail employeeDetail, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployeeDetail(employeeDetail);
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        redirectAttributes.addAttribute("updateNum",input.getNum());
        redirectAttributes.addAttribute("updateName",input.getName());
        return "redirect:/pattern/p43/retrieveEmployeeList.do";
    }

    @RequestMapping(value = "/pattern/p43/insertEmployeeDetail.do")
    public String insertEmployeeDetail(Employee input, EmployeeDetail employeeDetail, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployeeDetail(employeeDetail);
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        redirectAttributes.addAttribute("updateNum",input.getNum());
        redirectAttributes.addAttribute("updateName",input.getName());
        return "redirect:/pattern/p43/retrieveEmployeeList.do";
    }
}
