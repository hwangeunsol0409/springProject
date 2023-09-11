package org.eunsol.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GalleryBoardVO {
	private int gno;
	private String title;
	private String writer;
	private String content;
	private String filename;
	private Date regdate;
	private Date updatedate;
	private String uploadpath;
	private String fullname;
	private String rnum;
}
