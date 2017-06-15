package org.zerock.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	
	private Integer bno;
	private String isbn;
	

	private String bookTitle;
	private String writer;
	private String genre;
	private String publisher;
	private String publication_date;
	private int price;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	
	private String[] files;

	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getbookTitle() {
		return bookTitle;
	}

	public void setbookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", isbn=" + isbn + ", bookTitle=" + bookTitle + ", writer=" + writer + ", genre="
				+ genre + ", publisher=" + publisher + ", publication_date=" + publication_date + ", price=" + price
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", files="
				+ Arrays.toString(files) + ", getIsbn()=" + getIsbn() + ", getBno()=" + getBno() + ", getbookTitle()="
				+ getbookTitle() + ", getWriter()=" + getWriter() + ", getGenre()=" + getGenre() + ", getPublisher()="
				+ getPublisher() + ", getPrice()=" + getPrice() + ", getRegdate()=" + getRegdate() + ", getViewcnt()="
				+ getViewcnt() + ", getReplycnt()=" + getReplycnt() + ", getFiles()=" + Arrays.toString(getFiles())
				+ ", getPublication_date()=" + getPublication_date() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getPublication_date() {
		return publication_date;
	}

	public void setPublication_date(String publication_date) {
		this.publication_date = publication_date;
	}

	
	

}
