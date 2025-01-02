package devonboot.sample.office.common.practice.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import devonboot.sample.office.common.practice.model.MiniUser;
import devonboot.sample.office.common.practice.service.MiniUserService;
import org.springframework.ui.ModelMap;



/**
 * @Class Name: MiniUserController.java
 * @Description: MiniUser Controller class
 * @Modification Information
 *
 * @author author
 * @since 2024-03-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C) LG CNS All right reserved.
 */
 
@Controller
public class MiniUserController {

	@Resource(name = "miniUserService")
	private MiniUserService miniUserService;
			
	/**
	 * @description MINI_USER 정보를 신규 생성한다.
	 * @param input - 신규 생성할 정보가 담긴 MiniUser
	 * @return "/miniUser/retrieveMiniUserList"
	 */
	@RequestMapping(value = "/miniUser/insertMiniUser.do")
	public String insertMiniUser(MiniUser input, RedirectAttributes redirectAttributes) {
		miniUserService.insertMiniUser(input);
		return "redirect:/miniUser/retrieveMiniUserList.do";
	}
	
	/**
	  * @description MINI_USER 정보를 삭제한다.
	  * @param input - 삭제할 정보가 담긴 MiniUser
	  * @return "/miniUser/retrieveMiniUserList"
	  */
	@RequestMapping(value = "/miniUser/deleteMiniUser.do")
	public String deleteMiniUser(MiniUser input, RedirectAttributes redirectAttributes) {
		miniUserService.deleteMiniUser(input);
		return "redirect:/miniUser/retrieveMiniUserList.do";
	}
			
	/**
	 * @description MINI_USER 정보를 조회한다.
	 * @param input - 조회할 정보가 담긴 MiniUser
	 * @return "/miniUser/MiniUserUpdate"
	 */
	@RequestMapping(value = "/miniUser/retrieveMiniUser.do")
	public String retrieveMiniUser(MiniUser input, ModelMap model) {
		MiniUser miniUser = miniUserService.retrieveMiniUser(input);
		model.addAttribute("miniUser", miniUser);
		return "/miniUser/MiniUserUpdate";
	}
	
	/**
	  * @description MINI_USER 정보를 수정한다.
	  * @param input - 수정할 정보가 담긴 MiniUser
	  * @return "/miniUser/retrieveMiniUserList"
	  */	
	@RequestMapping(value = "/miniUser/updateMiniUser.do")
	public String updateMiniUser(MiniUser input, RedirectAttributes redirectAttributes) {
		miniUserService.updateMiniUser(input);
		return "redirect:/miniUser/retrieveMiniUserList.do";
	}
}
