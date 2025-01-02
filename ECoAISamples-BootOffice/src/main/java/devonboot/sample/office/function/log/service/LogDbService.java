package devonboot.sample.office.function.log.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import devonboot.sample.office.common.model.LogDb;


public interface LogDbService {

    @Transactional(readOnly = true)
    public List<LogDb> retrieveLogDbList(LogDb logDb);

}

