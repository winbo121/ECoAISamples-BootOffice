package devonboot.sample.office.function.message.model;


public class Message {

    private String key;

    private String resolveArgument;

    private String message;

    private String LocaleCode;

    private String messageTypeCode;

    /**
     * @return the resolveArgument
     */
    public String getResolveArgument() {
        return resolveArgument;
    }

    /**
     * @param resolveArgument the resolveArgument to set
     */
    public void setResolveArgument(String resolveArgument) {
        this.resolveArgument = resolveArgument;
    }

    /**
     * @return the messageTypeCode
     */
    public String getMessageTypeCode() {
        return messageTypeCode;
    }

    /**
     * @param messageTypeCode the messageTypeCode to set
     */
    public void setMessageTypeCode(String messageTypeCode) {
        this.messageTypeCode = messageTypeCode;
    }



    /**
     * @return the localeCode
     */
    public String getLocaleCode() {
        return LocaleCode;
    }

    /**
     * @param localeCode the localeCode to set
     */
    public void setLocaleCode(String localeCode) {
        LocaleCode = localeCode;
    }

    /**
     * @return the key
     */
    public String getKey() {
        return key;
    }

    /**
     * @param name the name to set
     */
    public void setKey(String key) {
        this.key = key;
    }


    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

}
