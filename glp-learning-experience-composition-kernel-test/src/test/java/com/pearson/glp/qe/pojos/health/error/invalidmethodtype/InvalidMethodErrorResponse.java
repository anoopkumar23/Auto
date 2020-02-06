package com.pearson.glp.qe.pojos.health.error.invalidmethodtype;

import lombok.Getter;
import lombok.Setter;

public class InvalidMethodErrorResponse {

	@Getter
	@Setter
	String timestamp;

	@Getter
	@Setter
	String path;

	@Getter
	@Setter
	int status;

	@Getter
	@Setter
	String error;

	@Getter
	@Setter
	String message;

}
