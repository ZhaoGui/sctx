package com.scujcc.sctx;


@Component
public class UserDao {
	
	@Autowired
	private JdbcTemplate template;

	public boolean findUserByNameAndPassword(String u, String p) {
		List result = template.query("select * from t_user", new ColumnMapRowMapper());

		if (null != result && result.size() > 0) {
			return true;
		} else {
			return false;
		}

	}
}