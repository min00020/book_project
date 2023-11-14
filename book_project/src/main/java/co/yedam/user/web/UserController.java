package co.yedam.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.user.service.UserService;
import lombok.Setter;


public class UserController {
	 @Setter(onMethod_ = {@Autowired})
	 private UserService userservice;
	 
	 @ResponseBody
		/* @GetMapping("/idcheck") */
	 public ResponseEntity<String> idcheck(@RequestParam("user_id") String user_id) {
		ResponseEntity<String> entity = null;
		
		String isUseId = "";
		if(userservice.IdCheck(user_id) != null) {
			isUseId = "no"; 
		} else {
			isUseId = "yes";
		}
		
		entity = new ResponseEntity<String>(isUseId, HttpStatus.OK);
		
		return entity;
	 }
}
