package devonboot.sample.office.function.mail.model;


public class MailInformation {

    private String mailAddress;

    private String mailSubject;

    private String mailText;

    private String mailTextTypeCode;

    private String name;

    private String age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    /**
     * @return the mailTextType
     */
    public String getMailTextTypeCode() {
        return mailTextTypeCode;
    }

    /**
     * @param mailTextType the mailTextType to set
     */
    public void setMailTextTypeCode(String mailTextTypeCode) {
        this.mailTextTypeCode = mailTextTypeCode;
    }

    /**
     * @return the mailAddress
     */
    public String getMailAddress() {
        return mailAddress;
    }

    /**
     * @param mailAddress the mailAddress to set
     */
    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    /**
     * @return the mailSubject
     */
    public String getMailSubject() {
        return mailSubject;
    }

    /**
     * @param mailSubject the mailSubject to set
     */
    public void setMailSubject(String mailSubject) {
        this.mailSubject = mailSubject;
    }

    /**
     * @return the mailText
     */
    public String getMailText() {
        return mailText;
    }

    /**
     * @param mailText the mailText to set
     */
    public void setMailText(String mailText) {
        this.mailText = mailText;
    }

}
