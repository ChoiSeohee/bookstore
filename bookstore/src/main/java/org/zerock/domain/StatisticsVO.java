package org.zerock.domain;

public class StatisticsVO {
   private int bno;
   private int novel;
   private int humanities;
   private int science;
   private int history_culture;
   private int technology_computer;
   
   public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getNovel() {
		return novel;
	}
	public void setNovel(int novel) {
		this.novel = novel;
	}
	public int getHumanities() {
		return humanities;
	}
	public void setHumanities(int humanities) {
		this.humanities = humanities;
	}
	public int getScience() {
		return science;
	}
	public void setScience(int science) {
		this.science = science;
	}
	public int getHistory_culture() {
		return history_culture;
	}
	public void setHistory_culture(int history_culture) {
		this.history_culture = history_culture;
	}
	public int getTechnology_computer() {
		return technology_computer;
	}
	public void setTechnology_computer(int technology_computer) {
		this.technology_computer = technology_computer;
	}
	@Override
	public String toString() {
		return "StatisticsVO [bno=" + bno + ", novel=" + novel + ", humanities=" + humanities + ", science=" + science
				+ ", history_culture=" + history_culture + ", technology_computer=" + technology_computer
				+ ", getBno()=" + getBno() + ", getNovel()=" + getNovel() + ", getHumanities()=" + getHumanities()
				+ ", getScience()=" + getScience() + ", getHistory_culture()=" + getHistory_culture()
				+ ", getTechnology_computer()=" + getTechnology_computer() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}