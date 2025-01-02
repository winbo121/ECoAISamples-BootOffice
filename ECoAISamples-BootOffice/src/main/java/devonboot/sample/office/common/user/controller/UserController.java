package devonboot.sample.office.common.user.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.User;
import devonboot.sample.office.common.user.service.UserService;
import devonboot.sample.office.ecoai.support.CustomBizException;

/**
 * <pre>
 * 본 클래스는 사용자 정보에 대한 CRUD를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestMapping(value="/common/user/retrieveUser.do")
	public String retrieveUser(User input, ModelMap model){
		try {
			User user = userService.retrieveUser(input);
			List<Code> roleList = codeService.retrieveCodeList("ROLE");
			
			model.addAttribute("user", user);
			model.addAttribute("roleList", roleList);
			return "common/user/userForm";

		} catch (Exception ex) {
			throw new CustomBizException("Unable to retrieve the user", ex);
		}
	}

	@RequestMapping(value="/common/user/retrieveUserList.do")
	public String retrieveUserList(User input, ModelMap model){
		
		return null;
		
	}

	@RequestMapping(value="/common/user/retrieveUserForm.do")
	public String retrieveUserForm(ModelMap model){
		List<Code> roleList = codeService.retrieveCodeList("ROLE");

		model.addAttribute("user", new User());
		model.addAttribute("roleList", roleList);

		return "common/user/userForm";
	}

//	@RequestMapping(value="/common/user/deleteUser.do")
//	public String deleteUser(User input, ModelMap model){
//		
////		userService.deleteUser(input);
////		return "redirect:/common/user/retrieveUserList.do?msg=success";
//	}

	@RequestMapping(value="/common/user/insertUser.do")
    public String insertUser(User input, ModelMap model) {
		/// input에서 폰 번호를 검증하는 로직 추가
        userService.insertUser(input);
        return "redirect:/common/user/retrieveUserList.do?msg=success";
    }
	
	// 사용자 수정
	
	
}
