package devonboot.sample.office.function.idGeneration.model;


public class IdGeneration {

    private String policyCode;

    private String dbSequenceIdValue;

    private String sequenceIdValue;

    private String tableIdValue;

    /**
     * @return the policyCode
     */
    public String getPolicyCode() {
        return policyCode;
    }

    /**
     * @param policyCode the policyCode to set
     */
    public void setPolicyCode(String policyCode) {
        this.policyCode = policyCode;
    }

    /**
     * @return the dbSequenceIdValue
     */
    public String getDbSequenceIdValue() {
        return dbSequenceIdValue;
    }

    /**
     * @param dbSequenceIdValue the dbSequenceIdValue to set
     */
    public void setDbSequenceIdValue(String dbSequenceIdValue) {
        this.dbSequenceIdValue = dbSequenceIdValue;
    }

    /**
     * @return the sequenceIdValue
     */
    public String getSequenceIdValue() {
        return sequenceIdValue;
    }

    /**
     * @param sequenceIdValue the sequenceIdValue to set
     */
    public void setSequenceIdValue(String sequenceIdValue) {
        this.sequenceIdValue = sequenceIdValue;
    }

    /**
     * @return the tableIdValue
     */
    public String getTableIdValue() {
        return tableIdValue;
    }

    /**
     * @param tableIdValue the tableIdValue to set
     */
    public void setTableIdValue(String tableIdValue) {
        this.tableIdValue = tableIdValue;
    }

}
