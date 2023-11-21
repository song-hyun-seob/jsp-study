package com.momo.dto;

public class job {
   private String jobcode;
    private String jobName;
    @Override
    public String toString() {
    	return jobcode + "/" + jobName;
    }
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
}
