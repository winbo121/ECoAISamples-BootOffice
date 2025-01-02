package devonboot.sample.office.common.login.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import devonboot.sample.office.common.login.service.LoginService;
import devonboot.sample.office.common.model.User;
import devonboot.sample.office.common.user.service.UserService;

/**
 * <pre>
 * 본 클래스는 로그인 처리를 담당하는 Controller 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "userService")
	private UserService userService;

    @Resource(name="messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

	@RequestMapping("/common/login/login.do")
    public String login(@ModelAttribute User input, String redirectUrl, ModelMap model, HttpSession session) {

		String redirect_url_trim = redirectUrl.trim();
		
//		List<User> userList = loginService.testMysql();
//		
//		for(User userVo : userList) {
//			System.out.println(userVo.getPassword()+"@@@@@@@@@@@@@@@@@@@@@@@@");
//		}
		
        boolean isExistUser = loginService.checkUserId(input);
        if(!isExistUser) {
            model.addAttribute("errorMsg", messageSourceAccessor.getMessage("sample.common.login.invalidUserId"));

            return "common/login/loginForm";
        }

        boolean isValidUser = loginService.checkUser(input);
        if(isValidUser) {
        	User loginUser = userService.retrieveUser(input);
        	String language = loginUser.getLanguage();
        	if(language == null) {
        		language = "";
        	}

            session.setAttribute("loginUser", loginUser);
            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale(language));
            if(redirect_url_trim != null && !redirect_url_trim.trim().equals("") && !redirect_url_trim.trim().equals("null")) {
    			return "redirect:/main.do?redirectUrl="+redirect_url_trim;
    		}
        	return "redirect:/main.do";
        }

        model.addAttribute("errorMsg", messageSourceAccessor.getMessage("sample.common.login.invalidPassword"));
        return "common/login/loginForm";
    }

    @RequestMapping("/common/login/logout.do")
    public String logout(@ModelAttribute User input, ModelMap model, HttpSession session) {
    	session.removeAttribute("loginUser");
		return "redirect:/common/login/retrieveLoginForm.do";
    }

	@RequestMapping(value="/common/login/retrieveLoginForm.do")
	public String retrieveLoginForm(String redirectUrl, ModelMap model){
		if(redirectUrl != null && !redirectUrl.trim().equals("")) {
			model.addAttribute("redirectUrl", redirectUrl);
		}
		return "common/login/loginForm";
	}

	@RequestMapping(value={"/","/main.do"})
	public String retrieveMainPage(String redirectUrl, ModelMap model){
		if(redirectUrl != null && !redirectUrl.trim().equals("")) {
			model.addAttribute("redirectUrl", redirectUrl);
			String menuCode = redirectUrl.substring(0, redirectUrl.indexOf("/"));
			if(redirectUrl.startsWith("/")) {
				menuCode = redirectUrl.substring(1);
				menuCode = menuCode.substring(0, menuCode.indexOf("/"));
			}
			model.addAttribute("menuCode", menuCode);
		}
		return "main";
	}
}
