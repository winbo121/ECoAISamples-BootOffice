package devonboot.sample.office.function.log.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import devonboot.sample.office.common.model.LogDb;
import devonframe.dataaccess.CommonDao;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("logDbService")
public class LogDbServiceImpl implements LogDbService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    @Transactional(readOnly = true)
    public List<LogDb> retrieveLogDbList(LogDb logDb) {
        List<LogDb> resultList = commonDao.selectList("LogDb.retrieveLogDbList", logDb);
        return resultList;
    }

}