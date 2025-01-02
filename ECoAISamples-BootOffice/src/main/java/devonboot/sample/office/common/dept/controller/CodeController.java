package devonboot.sample.office.common.dept.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Code;

/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class CodeController {

	@Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    @RequestMapping(value = "/common/code/retrievedepartmentCodeList.do")
    public String retrieveDepartmentCodeList(Code input, ModelMap model) {
    	String cg = input.getCodeGroup();

        List<Code> departmentCodeList = cg == null || cg.length() == 0 ? new ArrayList<Code>() : codeService.retrieveDepartmentCodeList(input);

        model.addAttribute("resultList", departmentCodeList);

        return "ajaxView";
    }
}
