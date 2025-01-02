package devonboot.sample.office.uipattern.p11.controller;

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

/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class SingleViewToEditPatternController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;


    @RequestMapping(value="/pattern/p11/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model){

    	if (searchNum!=null) {
            Employee input = new Employee();
            input.setNum(searchNum);

            Employee employee = employeeService.retrieveEmployee(input);
            if (employee==null) {
            	SayMessage.setMessageCode("dev.inf.com.nodata");
            }
            model.addAttribute("result", employee);
    	}

        return "pattern/p11/employeeDetail";
    }

    @RequestMapping(value="/pattern/p11/retrieveEmployeeForm.do")
    public String retrieveEmployeeForm(String searchNum, String mode, ModelMap model){

        if("update".equals(mode)) {
            Employee input = new Employee();
            input.setNum(searchNum);

            Employee employee = employeeService.retrieveEmployee(input);
            if(employee == null) {
                employee = new Employee();
            }

            model.addAttribute("result", employee);

            Code code = new Code();
            code.setCodeGroup(employee.getDivisionCode());

            model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        }else{
            model.addAttribute("result", new Employee());
        }

        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());

        return "pattern/p11/employeeForm";
    }

    @RequestMapping(value="/pattern/p11/insertEmployee.do")
    public String insertEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.insertEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/p11/updateEmployee.do")
    public String updateEmployee(Employee input, RedirectAttributes redirectAttributes){
        employeeService.updateEmployee(input);
        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

    @RequestMapping(value="/pattern/p11/deleteEmployee.do")
    public String deleteEmployee(Employee input){
        employeeService.deleteEmployee(input);
        return "redirect:/pattern/p11/retrieveEmployee.do";
    }

}
