package devonboot.sample.office.common.dept.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.Code;
import devonframe.dataaccess.CommonDao;

/**
 * <pre>
 * 본 클래스는 코드 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Resource(name="commonDao")
	private CommonDao commonDao;

    public List<Code> retrieveSkillCodeList() {
        return commonDao.selectList("Code.retrieveSkillCodeList");
    }

    public List<Code> retrieveDivisionCodeList() {
        return commonDao.selectList("Code.retrieveDivisionCodeList");
    }

    public List<Code> retrieveDepartmentCodeList() {
        return commonDao.selectList("Code.retrieveDepartmentCodeList");
    }

    public List<Code> retrieveDepartmentCodeList(Code codeGroup) {
        return commonDao.selectList("Code.retrieveDepartmentCodeList", codeGroup);
    }

    public List<Code> retrieveJobLevelCodeList() {
        return commonDao.selectList("Code.retrieveJobLevelCodeList");
    }

    public List<Code> retrieveCodeList(String string) {
        return commonDao.selectList("Code.retrieveCodeList",string);
    }
}
