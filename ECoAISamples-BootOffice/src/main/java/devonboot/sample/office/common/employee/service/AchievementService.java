package devonboot.sample.office.common.employee.service;

import java.util.List;

import devonboot.sample.office.common.model.Achievement;


public interface AchievementService {

    public List<Achievement> retrieveAchievementList(Achievement achievement);

    public void insertAchievement(Achievement achievement);

    public void updateAchievement(Achievement achievement);

    public void deleteAchievement(Achievement achievement);

}

