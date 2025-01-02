package devonboot.sample.office.common.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import devonboot.sample.office.common.model.Achievement;
import devonframe.dataaccess.CommonDao;

/**
 * <pre>
 * 본 클래스는 사원 정보에 대한 CRUD를 담당하는 ServiceImpl 클래스입니다.
 * </pre>
 *
 * @author XXX팀 OOO
 */

@Service("achievementService")
public class AchievementServiceImpl implements AchievementService {

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    public List<Achievement> retrieveAchievementList(Achievement achievement) {
        List<Achievement> resultList = commonDao.selectList("Achievement.retrieveAchievementList", achievement);
        return resultList;
    }


    public void insertAchievement(Achievement achievement) {
        commonDao.insert("Achievement.insertAchievement", achievement);
    }

    public void updateAchievement(Achievement achievement) {
        commonDao.update("Achievement.updateAchievement", achievement);
    }

    public void deleteAchievement(Achievement achievement) {
        commonDao.delete("Achievement.deleteAchievement", achievement);
    }
}