package com.teamproject.seemore;

import java.sql.Date;

public class SeemoreDTO {
	private String t_id;
	private String top_class;
	private String mid_class;
	private int t_number;
	private String title;
	private String enfm_date_use;
	private Date enfm_date;
	private String t_contents;
	private String etc;
	private String reg_user;
	private Date reg_date;
	private String mod_user;
	private Date mod_date;
	
	public SeemoreDTO() {
	}

	public SeemoreDTO(String t_id, String top_class, String mid_class, int t_number, String title, String enfm_date_use,
			Date enfm_date, String t_contents, String etc, String reg_user, Date reg_date, String mod_user,
			Date mod_date) {
		this.t_id = t_id;
		this.top_class = top_class;
		this.mid_class = mid_class;
		this.t_number = t_number;
		this.title = title;
		this.enfm_date_use = enfm_date_use;
		this.enfm_date = enfm_date;
		this.t_contents = t_contents;
		this.etc = etc;
		this.reg_user = reg_user;
		this.reg_date = reg_date;
		this.mod_user = mod_user;
		this.mod_date = mod_date;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getTop_class() {
		return top_class;
	}

	public void setTop_class(String top_class) {
		this.top_class = top_class;
	}

	public String getMid_class() {
		return mid_class;
	}

	public void setMid_class(String mid_class) {
		this.mid_class = mid_class;
	}

	public int getT_number() {
		return t_number;
	}

	public void setT_number(int t_number) {
		this.t_number = t_number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEnfm_date_use() {
		return enfm_date_use;
	}

	public void setEnfm_date_use(String enfm_date_use) {
		this.enfm_date_use = enfm_date_use;
	}

	public Date getEnfm_date() {
		return enfm_date;
	}

	public void setEnfm_date(Date enfm_date) {
		this.enfm_date = enfm_date;
	}

	public String getT_contents() {
		return t_contents;
	}

	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getReg_user() {
		return reg_user;
	}

	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getMod_user() {
		return mod_user;
	}

	public void setMod_user(String mod_user) {
		this.mod_user = mod_user;
	}

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	@Override
	public String toString() {
		return "SeemoreDTO [t_id=" + t_id + ", top_class=" + top_class + ", mid_class=" + mid_class + ", t_number="
				+ t_number + ", title=" + title + ", enfm_date_use=" + enfm_date_use + ", enfm_date=" + enfm_date
				+ ", t_contents=" + t_contents + ", etc=" + etc + ", reg_user=" + reg_user + ", reg_date=" + reg_date
				+ ", mod_user=" + mod_user + ", mod_date=" + mod_date + "]";
	}
	
}
