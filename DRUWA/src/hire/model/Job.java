package hire.model;

import java.io.Serializable;

public class Job implements Serializable {
	// JOB_NUM NOT NULL NUMBER
	// JOB_NAME NOT NULL VARCHAR2(30)
	// JOB_SUMMARY VARCHAR2(2000)
	// JOB_DETAIL VARCHAR2(4000)

	private int jobNum;
	private String jobName;
	private String jobSummary;
	private String jobDetail;

	public int getJobNum() {
		return jobNum;
	}

	public void setJobNum(int jobNum) {
		this.jobNum = jobNum;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobSummary() {
		return jobSummary;
	}

	public void setJobSummary(String jobSummary) {
		this.jobSummary = jobSummary;
	}

	public String getJobDetail() {
		return jobDetail;
	}

	public void setJobDetail(String jobDetail) {
		this.jobDetail = jobDetail;
	}

}
