package com.pearson.glp.qe.pojos.health.error.notfound;

import lombok.Getter;
import lombok.Setter;

public class NotFoundErrorResponse {

	@Getter
	@Setter
	public int errorCode;

	@Getter
	@Setter
	public String  errorDesc;

	@Getter
	@Setter
	public String _userDesc;
}
