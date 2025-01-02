package devonboot.sample.office.function.exception.service;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;

import devonframe.dataaccess.CommonDao;
import devonframe.exception.BusinessException;
import devonframe.exception.SystemException;

@Service("exceptionService")
public class ExceptionServiceImpl implements ExceptionService{

    @Resource(name = "commonDao")
    private CommonDao commonDao;

    @Resource(name = "messageSource")
    private MessageSource messageSource;

    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    public void insertException() {
        commonDao.insert(null, null);
    }

    public void updateException() {
        throw new SystemException(messageSourceAccessor.getMessage("dev.err.com.desc"));
    }

    public void deleteException() {
        throw new BusinessException("dev.err.com.delete", messageSource, null, new Locale("ko"));
    }

    public void ajaxException(String type) {
        if(type.equals("business")) {
            throw new BusinessException("dev.inf.com.nodata",messageSource );
        } else if(type.equals("system")) {
            throw new SystemException("dev.err.com.desc",messageSource );
        } else {
            throw new RuntimeException(messageSourceAccessor.getMessage("dev.err.com.desc"));
        }
    }
}
