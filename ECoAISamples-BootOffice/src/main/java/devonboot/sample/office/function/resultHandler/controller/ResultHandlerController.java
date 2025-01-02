package devonboot.sample.office.function.resultHandler.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Employee;
import devonboot.sample.office.function.resultHandler.service.ResultHandlerService;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class ResultHandlerController {

	@Resource(name = "resultHandlerService")
	private ResultHandlerService resultHandlerService;

	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListForm.do")
	public String retrieveEmployeeListForm(ModelMap model) {
		Employee input = new Employee();
		
		model.addAttribute("input", input);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList",  codeService.retrieveSkillCodeList());
		return "function/resultHandler/employeeList";
	}

	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListWithJson.do")
	public void retrieveEmployeeListWithJson(Employee input, ModelMap model, HttpServletResponse response) {
		resultHandlerService.retrieveEmployeeListWithJson(input, response);	
		 
	}
	
	@RequestMapping(value = "/function/resultHandler/retrieveEmployeeListWithExcel.do")
	public void retrieveEmployeeListWithExcel(Employee input, ModelMap model, HttpServletResponse response) {
		resultHandlerService.retrieveEmployeeListWithExcel(input, response);	
		 
	}

}
