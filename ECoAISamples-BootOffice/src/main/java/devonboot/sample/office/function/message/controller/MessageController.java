package devonboot.sample.office.function.message.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.function.message.model.Message;
import devonboot.sample.office.function.message.model.MessageLocaleCode;
import devonboot.sample.office.function.message.model.MessageType;
import devonframe.message.saymessage.SayMessage;

@Controller
public class MessageController {

	@Autowired
	@Qualifier("dbMessageSource")
	MessageSource dbMessageSource;

	@Autowired
	@Qualifier("messageSource")
    MessageSource fileMessageSource;


    @RequestMapping(value = "/function/message/messageForm.do")
    public String messageForm(ModelMap model) {

        model.addAttribute("localeCodeList", localeCodeList());
        model.addAttribute("messageTypeCodeList", messageTypeCodeList());
        model.addAttribute("message", new Message());

        return "function/message/employeeForm";
    }

    @RequestMapping(value = "/function/message/retrieveMessage.do")
    public String retrieveMessage(Message message, ModelMap model) {

        String messageTypeCode = message.getMessageTypeCode();
        String localeCode = message.getLocaleCode();
        String key = message.getKey();
        String resolveArgument = message.getResolveArgument();
        
        String strMessage = null;

        Object[] object = new Object[] { resolveArgument };

        Locale locale = null;

        if(localeCode.equals("ko")){
            locale = Locale.KOREAN;
        }else if(localeCode.equals("en")){
            locale = Locale.ENGLISH; //
        }

        if (messageTypeCode != null) {

            if ("DB".equalsIgnoreCase(messageTypeCode)) {

                strMessage = dbMessageSource.getMessage(key, object, locale);

            } else if ("File".equalsIgnoreCase(messageTypeCode)) {
                
                strMessage = fileMessageSource.getMessage(key, object, locale);

            }
        }

		if (key.equals(strMessage)) {
            message.setMessage("");
            SayMessage.setMessage(fileMessageSource.getMessage("dev.inf.com.nodata", object, locale));
           
        } else {
            message.setMessage(strMessage);
        }

       
        model.addAttribute("localeCodeList", localeCodeList());
        model.addAttribute("messageTypeCodeList", messageTypeCodeList());
        model.addAttribute("message", message);

        return "function/message/employeeForm";
    }

    private List<MessageLocaleCode> localeCodeList() {

        List<MessageLocaleCode> localeCodeList = new ArrayList<MessageLocaleCode>();

        MessageLocaleCode messageLocaleCodeKo = new MessageLocaleCode();
        messageLocaleCodeKo.setCode("ko");
        messageLocaleCodeKo.setValue("한국어");

        localeCodeList.add(messageLocaleCodeKo);

        MessageLocaleCode messageLocaleCodeEn = new MessageLocaleCode();
        messageLocaleCodeEn.setCode("en");
        messageLocaleCodeEn.setValue("영어");

        localeCodeList.add(messageLocaleCodeEn);

        return localeCodeList;

    }

    private List<MessageType> messageTypeCodeList() {

        List<MessageType> messageTypeCodeList = new ArrayList<MessageType>();

        MessageType messageTypeFile = new MessageType();
        messageTypeFile.setCode("DB");
        messageTypeFile.setValue("DB");

        messageTypeCodeList.add(messageTypeFile);

        MessageType messageTypeDb = new MessageType();
        messageTypeDb.setCode("File");
        messageTypeDb.setValue("File");

        messageTypeCodeList.add(messageTypeDb);

        return messageTypeCodeList;

    }

}
