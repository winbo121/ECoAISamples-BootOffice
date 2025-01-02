package devonboot.sample.office.function.transaction.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.function.transaction.service.AnnotationTransactionService;
import devonboot.sample.office.function.transaction.service.AopTransactionService;



@Controller
public class TransactionController {

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "aopTransactionService")
    private AopTransactionService aopTransactionService;

    @Resource(name = "annotationTransactionService")
    private AnnotationTransactionService annotationTransactionService;

    @RequestMapping(value = "/function/transaction/employeeForm.do")
    public String employeeForm(ModelMap model) {

        model.addAttribute("employee", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", new ArrayList<Code>());

        return "function/transaction/employeeForm";
    }

    @RequestMapping(value = "/function/transaction/dynamicCombobox.do")
    public String dynamicFirstCombobox(HttpServletRequest req, ModelMap model) {

        Code code = new Code();
        code.setCodeGroup(req.getParameter("divisionCode"));

        model.addAttribute("result", codeService.retrieveDepartmentCodeList(code));
        return "ajaxView";
    }

    @RequestMapping(value = "/function/transaction/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {

        Employee input = new Employee();
        input.setNum(searchNum);

        Employee employee = aopTransactionService.retrieveEmployee(input);

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("employee", employee);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

        return "function/transaction/employeeForm";
    }

    //정상수행 case
    @RequestMapping(value = "/function/transaction/updateEmployeeXml.do")
    public String updateEmployeeByXml(Employee input, RedirectAttributes redirectAttributes) {

        aopTransactionService.updateEmployee(input);

        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/function/transaction/retrieveEmployee.do";
    }

    @RequestMapping(value = "/function/transaction/updateEmployeeAnnotation.do")
    public String updateEmployeeByAnnotation(Employee input, RedirectAttributes redirectAttributes) {

        annotationTransactionService.updateEmployee(input);

        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/function/transaction/retrieveEmployee.do";
    }

    //이하 rollback되는 case
    @RequestMapping(value = "/function/transaction/updateEmployeeXmlRollbackCase.do")
    public String updateEmployeeByXmlRollbackCase(Employee input, RedirectAttributes redirectAttributes) {

        aopTransactionService.updateEmployeeRollbackCase(input);

        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/function/transaction/retrieveEmployee.do";
    }

    @RequestMapping(value = "/function/transaction/updateEmployeeAnnotationRollbackCase.do")
    public String updateEmployeeByAnnotationRollbackCase(Employee input, RedirectAttributes redirectAttributes) {

        annotationTransactionService.updateEmployeeRollbackCase(input);

        redirectAttributes.addAttribute("searchNum", input.getNum());
        return "redirect:/function/transaction/retrieveEmployee.do";
    }
}
