package beans;

import java.sql.Date;

public class Discount {
	private int id;
	private Date startDate;
	private Date endDate;
	private Float percent;
	private String voucher;
	
	public Discount() {
	}
	
	public Discount(Date startDate, Date endDate, Float percent, String voucher) {
		this.startDate = startDate;
		this.endDate = endDate;
		this.percent = percent;
		this.voucher = voucher;
	}
	
	public Discount(int id, Date startDate, Date endDate, Float percent, String voucher) {
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.percent = percent;
		this.voucher = voucher;
	}
	

	public Discount(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Float getPercent() {
		return percent;
	}

	public void setPercent(Float percent) {
		this.percent = percent;
	}

	public String getVoucher() {
		return voucher;
	}

	public void setVoucher(String voucher) {
		this.voucher = voucher;
	}
}
