package devonboot.sample.office.function.validator.bean.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.ValidationEmployee;
import devonboot.sample.office.function.validator.bean.service.ValidationEmployeeService;
import devonframe.message.saymessage.SayMessage;

@Controller
public class BeanValidatorController {

	@Resource(name = "employeeServiceForBeanValidator")
	private ValidationEmployeeService employeeService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "beanValidator")
	private Validator validator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(this.validator);
	}

	@RequestMapping(value = "/function/validator/bean/employeeForm.do")
	public String employeeForm(ModelMap model) {

		model.addAttribute("employee", new ValidationEmployee());
		model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
		model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
		model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
		model.addAttribute("departmentCodeList", new ArrayList<Code>());

		return "function/validator/bean/employeeForm";
	}

	@RequestMapping(value = "/function/validator/bean/insertEmployee.do")
	public ModelAndView insertEmployee(@ModelAttribute("employee") ValidationEmployee employee, BindingResult bindingResult, ModelMap model) {

		validator.validate(employee, bindingResult);

		Code code = new Code();
		code.setCodeGroup(employee.getDivisionCode());

		model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
		model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
		model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
		model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

		if (bindingResult.hasErrors()) {
			model.addAttribute("employee", employee);
//			StringBuilder sb = new StringBuilder();
//			// getBindStatus().getErrorMessages()
//			for (FieldError er : bindingResult.getFieldErrors()) {
//				sb.append(er.getField() + " : " + er.getDefaultMessage().replaceAll("\\{0\\}", er.getField()))
//						.append("\\n");
//			}
//			SayMessage.setMessage(sb.toString());
			return new ModelAndView("function/validator/bean/employeeForm", model);
		} else {
			employeeService.insertEmployee(employee);
			SayMessage.setMessageCode("dev.suc.com.save");
		}
		return new ModelAndView("function/validator/bean/employeeForm", model);
	}

	@RequestMapping(value = "/function/validator/bean/insertEmployeeAnnotation.do")
	public ModelAndView insertEmployeeAnnotation(@ModelAttribute("employee") @Valid ValidationEmployee employee,
			BindingResult bindingResult, ModelMap model) {

		Code code = new Code();
		code.setCodeGroup(employee.getDivisionCode());

		model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
		model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
		model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
		model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));

		if (bindingResult.hasErrors()) {
			model.addAttribute("employee", employee);
//			StringBuilder sb = new StringBuilder();
//			for (FieldError er : bindingResult.getFieldErrors()) {
//				sb.append(er.getField() + " : " + er.getDefaultMessage().replaceAll("\\{0\\}", er.getField()))
//						.append("\\n");
//			}
//			SayMessage.setMessage(sb.toString());
			return new ModelAndView("function/validator/bean/employeeForm", model);
		} else {
			employeeService.insertEmployee(employee);
			SayMessage.setMessageCode("dev.suc.com.save");

		}
		return new ModelAndView("function/validator/bean/employeeForm", model);
	}
}
