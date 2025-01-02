package devonboot.sample.office.function.mail.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.function.mail.model.MailInformation;
import devonboot.sample.office.function.mail.model.MailTextType;
import devonframe.mail.MailSender;
import devonframe.mail.MailSenderFactory;
import devonframe.message.saymessage.SayMessage;
import devonframe.util.NullUtil;



@Controller
public class MailController {

    @Resource(name = "mailSenderFactory")
    private MailSenderFactory mailSenderFactory;
    
    @Resource(name = "messageSourceAccessor")
    private MessageSourceAccessor messageSourceAccessor;

    private String toAddress = "devontestmail@gmail.com";

    private String[] mailTextTypeCode = new String[] { "TEXT", "HTML", "TEMPLATE" };

    @RequestMapping(value = "/function/mail/mailForm.do")
    public String mailForm(ModelMap model) {

        model.addAttribute("mailInformation", new MailInformation());
        model.addAttribute("mailTextTypeList", retrieveMailTextTypeList());

        return "function/mail/employeeForm";
    }

    @RequestMapping(value = "/function/mail/sendMail.do")
    public String sendMail(MailInformation mailInformation, HttpServletRequest request) {

        String textTypeCode = mailInformation.getMailTextTypeCode();
        String mailSendAddress = mailInformation.getMailAddress();

        MailSender mailSender = mailSenderFactory.createMailSender();

        if (textTypeCode != null && !"".equals(textTypeCode.trim())) {

            if (mailTextTypeCode[0].equals(textTypeCode)) {

                mailSender.setText(mailInformation.getMailText());

            } else if (mailTextTypeCode[1].equals(textTypeCode)) {

                mailSender.setHtml(mailInformation.getMailText());

            } else if (mailTextTypeCode[2].equals(textTypeCode)) {

                String pdfPath = request.getSession().getServletContext().getRealPath("/WEB-INF/classes/mail");

                if (new File(pdfPath).exists()) {
                    mailSender.setHtmlTemplateAndFile("mailTemplate1", mailInformation, pdfPath + "/template1.html");
                } else {
                    mailSender.setHtmlTemplate("mailTemplate1", mailInformation);
                }

            }
        }

        if (NullUtil.isNull(mailSendAddress)) {
            mailSendAddress = toAddress;
        }

        mailSender.setToMailAddress(mailSendAddress);
        mailSender.setSubject(mailInformation.getMailSubject());
        mailSender.send();

        SayMessage.setMessage(messageSourceAccessor.getMessage("dev.suc.com.process"));
        return "redirect:/function/mail/mailForm.do";
    }

    private List<MailTextType> retrieveMailTextTypeList() {

        List<MailTextType> mailTextTypeList = new ArrayList<MailTextType>();

        MailTextType mailTextTypeText = new MailTextType();
        mailTextTypeText.setTextTypeCode(mailTextTypeCode[0]);
        mailTextTypeText.setTextTypeValue(mailTextTypeCode[0]);

        mailTextTypeList.add(mailTextTypeText);

        MailTextType mailTextTypeHtml = new MailTextType();
        mailTextTypeHtml.setTextTypeCode(mailTextTypeCode[1]);
        mailTextTypeHtml.setTextTypeValue(mailTextTypeCode[1]);

        mailTextTypeList.add(mailTextTypeHtml);

        MailTextType mailTextTypeTemplate = new MailTextType();
        mailTextTypeTemplate.setTextTypeCode(mailTextTypeCode[2]);
        mailTextTypeTemplate.setTextTypeValue(mailTextTypeCode[2]);

        mailTextTypeList.add(mailTextTypeTemplate);

        return mailTextTypeList;
    }

}
