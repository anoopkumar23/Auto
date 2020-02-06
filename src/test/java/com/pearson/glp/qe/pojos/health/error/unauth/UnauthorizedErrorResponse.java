package com.pearson.glp.qe.pojos.health.error.unauth;

import lombok.Getter;
import lombok.Setter;

public class UnauthorizedErrorResponse {

	@Getter
	@Setter
	int errorCode;

	@Getter
	@Setter
	String errorDesc;

	@Getter
	@Setter
	String 	_userDesc;

}
