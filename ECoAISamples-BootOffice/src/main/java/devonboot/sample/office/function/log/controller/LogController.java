package devonboot.sample.office.function.log.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.common.model.LogDb;
import devonboot.sample.office.function.log.service.LogDbService;


@Controller
public class LogController {

    @Resource(name = "logDbService")
    private LogDbService logDbService;

    static final Logger LOGGER = LoggerFactory.getLogger(LogController.class);

    @RequestMapping(value = "/function/log/logDbForm.do")
    public String logDbForm(ModelMap model) {

        model.addAttribute("logDbList", new ArrayList<LogDb>());

        return "function/log/employeeForm";
    }

    @RequestMapping(value = "/function/log/insertLogDb.do")
    public String insertLogDb(ModelMap model) {

        LOGGER.error(" error 테스트 : ");
        LOGGER.debug(" debug 테스트: ");
        LOGGER.info("  info 테스트:  ");
        LOGGER.warn("  warn 테스트 : ");

        List<LogDb> logDbList = logDbService.retrieveLogDbList(new LogDb());
        
        model.addAttribute("logDbList", logDbList);
        return "function/log/employeeForm";
    }

    @RequestMapping(value = "/function/log/retrieveLogDbList.do")
    public String retrieveLogDbList(LogDb logDb, ModelMap model) {

        List<LogDb> logDbList = logDbService.retrieveLogDbList(logDb);

        model.addAttribute("logDbList", logDbList);

        return "function/log/employeeForm";
    }


}
