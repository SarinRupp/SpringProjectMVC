package sarin.app.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.util.AntPathMatcher;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	
		/*auth.
			inMemoryAuthentication().withUser("user").password("user").roles("USER");
		auth.
			inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
		auth.
			inMemoryAuthentication().withUser("dba").password("dba").roles("ADMIN","DBA");
		
		*/
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery("SELECT username,password,enabled FROM users Where username = ?")
			.authoritiesByUsernameQuery("SELECT username, rolename from user_role where username = ?");
			
	}
@Override
protected void configure(HttpSecurity http) throws Exception {

	http
		.authorizeRequests()
		.antMatchers("/","/home").permitAll()
		.antMatchers("/admin/**").access("hasRole('ADMIN')")
		.antMatchers("/user/**").access("hasRole('USER')")
		.antMatchers("/dba/**").access("hasRole('DBA')");
	http
	.formLogin()
	.loginPage("/login")
	.usernameParameter("username")
	.passwordParameter("password")
	;
	http.logout().logoutUrl("/logout");
	http.exceptionHandling().accessDeniedPage("/accessdeniced");
}
}
