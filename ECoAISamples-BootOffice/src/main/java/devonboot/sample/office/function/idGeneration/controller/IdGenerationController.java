package devonboot.sample.office.function.idGeneration.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.function.idGeneration.model.IdGeneration;
import devonboot.sample.office.function.idGeneration.model.IdPolicyCode;
import devonframe.idgen.IdGenerator;

@Controller
public class IdGenerationController {

    @Resource(name = "tableIdGenerator")
    IdGenerator tableIdGenerator;

    @Resource(name = "sequenceIdGenerator")
    IdGenerator sequenceIdGenerator;

    @Resource(name = "dBSequenceIdGenerator")
    IdGenerator dBSequenceIdGenerator;

    @RequestMapping(value = "/function/idGeneration/idGenerationForm.do")
    public String idGenerationForm(ModelMap model) {

        model.addAttribute("idPolicyCodeList", retrieveIdPolicyCodeList());

        model.addAttribute("idGeneration", new IdGeneration());

        return "function/idGeneration/employeeForm";
    }

    @RequestMapping(value = "/function/idGeneration/retrieveIdGeneration.do")
    public String retrieveIdGeneration(IdGeneration idGeneration, ModelMap model) {

        IdGeneration resultIdGeneration = new IdGeneration();
        resultIdGeneration.setPolicyCode(idGeneration.getPolicyCode());

        if (null != idGeneration && !"".equals(idGeneration.getPolicyCode()) && !"common".equals(idGeneration.getPolicyCode())) {
            resultIdGeneration.setDbSequenceIdValue(dBSequenceIdGenerator.generateNextId(idGeneration.getPolicyCode()));
            resultIdGeneration.setSequenceIdValue(sequenceIdGenerator.generateNextId(idGeneration.getPolicyCode()));
            resultIdGeneration.setTableIdValue(tableIdGenerator.generateNextId(idGeneration.getPolicyCode()));
        } else {

            resultIdGeneration.setDbSequenceIdValue(dBSequenceIdGenerator.generateNextId());
            resultIdGeneration.setSequenceIdValue(sequenceIdGenerator.generateNextId());
            resultIdGeneration.setTableIdValue(tableIdGenerator.generateNextId());
        }

        model.addAttribute("idPolicyCodeList", retrieveIdPolicyCodeList());
        model.addAttribute("idGeneration", resultIdGeneration);

        return "function/idGeneration/employeeForm";
    }

    private List<IdPolicyCode> retrieveIdPolicyCodeList() {

        List<IdPolicyCode> idPolicyCodeList = new ArrayList<IdPolicyCode>();

        IdPolicyCode idPolicyCode = new IdPolicyCode();
        idPolicyCode.setPolicyCode("common");
        idPolicyCode.setPolicyValue("common");

        idPolicyCodeList.add(idPolicyCode);

        IdPolicyCode idPolicyCode1 = new IdPolicyCode();
        idPolicyCode1.setPolicyCode("Account");
        idPolicyCode1.setPolicyValue("Account");

        idPolicyCodeList.add(idPolicyCode1);

        IdPolicyCode idPolicyCode2 = new IdPolicyCode();
        idPolicyCode2.setPolicyCode("Employee");
        idPolicyCode2.setPolicyValue("Employee");

        idPolicyCodeList.add(idPolicyCode2);

        return idPolicyCodeList;
    }

}
