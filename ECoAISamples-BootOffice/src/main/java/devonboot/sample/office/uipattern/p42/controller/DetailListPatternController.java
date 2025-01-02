package devonboot.sample.office.uipattern.p42.controller;

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
import devonboot.sample.office.common.model.Code;
import devonboot.sample.office.common.model.Employee;

@Controller
public class DetailListPatternController {

    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "achievementService")
    private AchievementService achievementService;

    @Resource(name = "codeService")
    private CodeService codeService;

    @RequestMapping(value = "/pattern/p42/employeeDetailList.do")
    public String employeeDetail(ModelMap model) {

        return "pattern/p42/employeeDetailList";
    }

    @RequestMapping(value = "/pattern/p42/retrieveEmployee.do")
    public String retrieveEmployee(String searchNum, ModelMap model) {
        Employee input = new Employee();
        input.setNum(searchNum);
        Employee employee = employeeService.retrieveEmployee(input);

        Achievement achievement = new Achievement();
        achievement.setNum(searchNum);
        List<Achievement> resultList = achievementService.retrieveAchievementList(achievement);

        model.addAttribute("result", employee);
        model.addAttribute("achievementResultList", resultList);
        return "pattern/p42/employeeDetailList";
    }

    @RequestMapping(value = "/pattern/p42/updateEmployeeFormPopup.do")
    public String updateEmployeeFormPopup(String searchNum, ModelMap model) {
        Employee input = new Employee();
        input.setNum(searchNum);
        Employee employee = employeeService.retrieveEmployee(input);

        Code code = new Code();
        code.setCodeGroup(employee.getDivisionCode());

        model.addAttribute("result", employee);
        model.addAttribute("searchNum", searchNum);
        model.addAttribute("joblevelCodeList", codeService.retrieveJobLevelCodeList());
        model.addAttribute("skillCodeList", codeService.retrieveSkillCodeList());
        model.addAttribute("divisionCodeList", codeService.retrieveDivisionCodeList());
        model.addAttribute("departmentCodeList", codeService.retrieveDepartmentCodeList(code));
        return "pattern/p42/employeeFormPopup";
    }

    @RequestMapping(value = "/pattern/p42/updateEmployee.do")
    public String updateEmployee(Employee input, ModelMap model) {
        employeeService.updateEmployee(input);
        model.addAttribute("mode", "complete");
        model.addAttribute("result", input);
        return "pattern/p42/employeeFormPopup";
    }

    @RequestMapping(value = "/pattern/p42/saveAchievementList.do")
    public String saveAchievementList(String detailNum, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (request.getParameterValues("checkData") != null) {
            String checkDatas[] = request.getParameterValues("checkData");
            String[] actTypes = request.getParameterValues("actType");

            for (int index = 0; index < actTypes.length; index++) {
                String actType = request.getParameterValues("actType")[index];

                if ("U".equals(actType)) {

                    for (int checkIndex = 0; checkIndex < checkDatas.length; checkIndex++) {
                        String checkType = request.getParameterValues("checkData")[checkIndex];

                        if (!"on".equals(checkType) && index == Integer.parseInt(checkType)) {
                            Achievement achievement = new Achievement();
                            achievement.setNum(request.getParameterValues("num")[index]);
                            achievement.setYyyy(request.getParameterValues("yyyy")[index]);
                            achievement.setMm(request.getParameterValues("mm")[index]);
                            achievement.setValue(request.getParameterValues("value")[index]);
                            achievement.setEtc(request.getParameterValues("etc")[index]);
                            achievementService.updateAchievement(achievement);
                            break;
                        }
                    }
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

        redirectAttributes.addAttribute("searchNum", detailNum);
        return "redirect:/pattern/p42/retrieveEmployee.do";
    }

    @RequestMapping(value = "/pattern/p42/deleteAchievementList.do")
    public String deleteAchievementList(String detailNum, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (request.getParameterValues("checkData") != null) {
            String[] indexs = request.getParameterValues("checkData");

            int size = indexs.length;
            for (int index = 0; index < size; index++) {
                int checkedIndex = Integer.parseInt(indexs[index]);

                Achievement achievement = new Achievement();
                achievement.setNum(request.getParameterValues("num")[checkedIndex]);
                achievement.setYyyy(request.getParameterValues("yyyy")[checkedIndex]);
                achievement.setMm(request.getParameterValues("mm")[checkedIndex]);
                achievement.setValue(request.getParameterValues("value")[checkedIndex]);
                achievement.setEtc(request.getParameterValues("etc")[checkedIndex]);

                String actType = request.getParameterValues("actType")[checkedIndex];

                if (actType.equals("D")) {
                    achievementService.deleteAchievement(achievement);
                }
            }
        }

        redirectAttributes.addAttribute("searchNum", detailNum);
        return "redirect:/pattern/p42/retrieveEmployee.do";
    }




}
