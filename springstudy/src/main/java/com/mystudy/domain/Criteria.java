package com.mystudy.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);		// 기본이 1page에  10개
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
