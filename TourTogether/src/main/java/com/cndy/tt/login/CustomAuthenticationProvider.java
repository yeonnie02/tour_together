package com.cndy.tt.login;

import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.cndy.tt.member.Member;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	String tag= " [ CustomAuthenticationProvider ] ";
	
	@Resource(name="customUserDetailsService")
	private CustomUserDetailsServiceImpl userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public Authentication authenticate(Authentication authentication) throws AuthenticationException{			
		System.out.println(tag+" authentication: "+authentication);
		
		//사용자가 입력한 정보
		String username = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		System.out.println(tag+" username: "+username);
		System.out.println(tag+" rawPassword: "+password);
		
		Member member = null;
		Collection<? extends GrantedAuthority> authorities = null;
		
		try {
			member = userService.loadUserByUsername(username); // DB에서의 사용자의 정보
			String encodedPassword = member.getPassword();
			System.out.println(tag+" encodedPassword: "+ encodedPassword);
			
			if(!passwordEncoder.matches(password, encodedPassword)) {
				System.out.println(tag+" 비밀번호 불일치");
				throw new BadCredentialsException("비밀번호 불일치");
			}
			
			authorities = member.getAuthorities();
			System.out.println(tag+" authorities"+authorities.toString());
			
		}catch(UsernameNotFoundException e) {
			e.printStackTrace();
			throw new UsernameNotFoundException(e.getMessage());
		}catch(BadCredentialsException e) {
			e.printStackTrace();
			throw new BadCredentialsException(e.getMessage());
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		return new UsernamePasswordAuthenticationToken(username, password, authorities);		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
}