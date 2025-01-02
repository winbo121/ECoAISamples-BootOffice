package devonboot.sample.office.common.model;


public class LogDb {

    private String eventId;

    private String theadName;

    private String timestmp;

    private String formattedMessage;

    private String loggerName;

    private String levelString;

    private String callerFilename;

    private String callerClass;

    private String callerMethod;
    
    private String callerLine; 
    
    private String exception;

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getTheadName() {
		return theadName;
	}

	public void setTheadName(String theadName) {
		this.theadName = theadName;
	}

	public String getTimestmp() {
		return timestmp;
	}

	public void setTimestmp(String timestmp) {
		this.timestmp = timestmp;
	}

	public String getFormattedMessage() {
		return formattedMessage;
	}

	public void setFormattedMessage(String formattedMessage) {
		this.formattedMessage = formattedMessage;
	}

	public String getLoggerName() {
		return loggerName;
	}

	public void setLoggerName(String loggerName) {
		this.loggerName = loggerName;
	}

	public String getLevelString() {
		return levelString;
	}

	public void setLevelString(String levelString) {
		this.levelString = levelString;
	}

	public String getCallerFilename() {
		return callerFilename;
	}

	public void setCallerFilename(String callerFilename) {
		this.callerFilename = callerFilename;
	}

	public String getCallerClass() {
		return callerClass;
	}

	public void setCallerClass(String callerClass) {
		this.callerClass = callerClass;
	}

	public String getCallerMethod() {
		return callerMethod;
	}

	public void setCallerMethod(String callerMethod) {
		this.callerMethod = callerMethod;
	}

	public String getCallerLine() {
		return callerLine;
	}

	public void setCallerLine(String callerLine) {
		this.callerLine = callerLine;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}


}
