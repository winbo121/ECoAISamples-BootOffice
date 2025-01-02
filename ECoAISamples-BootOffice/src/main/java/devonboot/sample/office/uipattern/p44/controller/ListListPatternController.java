package devonboot.sample.office.uipattern.p44.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import devonboot.sample.office.common.dept.service.CodeService;
import devonboot.sample.office.common.employee.service.AchievementService;
import devonboot.sample.office.common.employee.service.EmployeeService;
import devonboot.sample.office.common.model.Achievement;
import devonboot.sample.office.common.model.Employee;

@Controller
public class ListListPatternController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @Resource(name = "achievementService")
    private AchievementService achievementService;

    @RequestMapping(value = "/pattern/p44/employeeList.do")
    public String employeeDetail(ModelMap model) {
        model.addAttribute("result", new Employee());
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        return "pattern/p44/employeeList";
    }

    @RequestMapping(value = "/pattern/p44/retrieveEmployeeList.do")
    public String retrieveEmployeeList(Employee input, ModelMap model) {
        model.addAttribute("result", input);
        model.addAttribute("resultList", employeeService.retrieveEmployeeList(input));
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        return "pattern/p44/employeeList";
    }

    @RequestMapping(value = "/pattern/p44/retrieveAchievementList.do")
    public String retrieveAchievementList(Achievement achievement, ModelMap model) {
        List<Achievement> achievementList = achievementService.retrieveAchievementList(achievement);
        model.addAttribute("updateNum", achievement.getNum());
        model.addAttribute("achievementList", achievementList);
        return "ajaxView";
    }

    @RequestMapping(value = "/pattern/p44/saveAchievementList.do")
    public String saveAchievementList(String updateNum, Employee input, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (request.getParameterValues("checkData") != null) {

            String[] actTypes = request.getParameterValues("actType");

            for (int index = 0; index < actTypes.length; index++) {
                String actType = request.getParameterValues("actType")[index];

                if ("U".equals(actType)) {
                    Achievement achievement = new Achievement();
                    achievement.setNum(request.getParameterValues("num")[index]);
                    achievement.setYyyy(request.getParameterValues("yyyy")[index]);
                    achievement.setMm(request.getParameterValues("mm")[index]);
                    achievement.setValue(request.getParameterValues("value")[index]);
                    achievement.setEtc(request.getParameterValues("etc")[index]);
                    achievementService.updateAchievement(achievement);
                } else if ("C".equals(actType)) {
                    Achievement achievement = new Achievement();
                    achievement.setNum(request.getParameterValues("num")[index]);
                    achievement.setYyyy(request.getParameterValues("yyyy")[index]);
                    achievement.setMm(request.getParameterValues("mm")[index]);
                    achievement.setValue(request.getParameterValues("value")[index]);
                    achievement.setEtc(request.getParameterValues("etc")[index]);
                    achievementService.insertAchievement(achievement);
                }
            }
        }

        redirectAttributes.addAttribute("updateNum", updateNum);
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        return "redirect:/pattern/p44/retrieveEmployeeList.do";        

    }

    @RequestMapping(value = "/pattern/p44/deleteAchievementList.do")
    public String deleteAchievementList(Employee input, String achievementNum, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (request.getParameterValues("checkData") != null) {

            String[] actTypes = request.getParameterValues("actType");

            for (int index = 0; index < actTypes.length; index++) {
                String actType = request.getParameterValues("actType")[index];
                Achievement achievement = new Achievement();
                achievement.setNum(request.getParameterValues("num")[index]);
                achievement.setYyyy(request.getParameterValues("yyyy")[index]);
                achievement.setMm(request.getParameterValues("mm")[index]);
                achievement.setValue(request.getParameterValues("value")[index]);
                achievement.setEtc(request.getParameterValues("etc")[index]);
                
                if (actType.equals("D")) {
                    achievementService.deleteAchievement(achievement);
                }
            }
        }

        redirectAttributes.addAttribute("updateNum", input.getNum());
        redirectAttributes.addAttribute("skillCode", input.getSkillCode());
        redirectAttributes.addAttribute("joblevelCode", input.getJoblevelCode());
        return "redirect:/pattern/p44/retrieveEmployeeList.do";
    }

}
