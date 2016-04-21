package com.scujcc.sctx;


@Component
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDao dao;

	@RequestMapping("/login")
	public Response login(String u, String p) {
		Response res = new Response();
			
		boolean result = dao.findUserByNameAndPassword(u, p);
		//dao.findUserDetailByName(u)
		if (result) {

			User u = findUserDetail(u);
			res.setSuccess(true);
			res.data = u;
		} else {
			Response res = new Response();
			res.setSuccess(false);
			res.setMessage("user not found");
		}

		return res;

	}

	// @RequestMapping("/logout")
	// public Response logout() {

	// }
}

// http://12.3.3.3/user/login
// {
// 	'success' : true,
// 	'data' : {
// 		'username': 'tom',
// 		'age': 23
// 	}
// }

// {
// 	'success' : false,
// 	'message' : 'user not found'
// }