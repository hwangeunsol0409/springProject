package org.eunsol.domain;

import lombok.Data;

@Data
//원본파일 이름,  파일 경로, uuid값, 이미지여부정보를 하나로 묶어서
//전달하는 용도이다.
public class AttachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
