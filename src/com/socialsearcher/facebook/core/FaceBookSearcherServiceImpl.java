package com.socialsearcher.facebook.core;

import org.springframework.stereotype.Service;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.types.User;

public class FaceBookSearcherServiceImpl implements FaceBookSearcherService{

	FacebookClient faceBookClient;
	@SuppressWarnings("deprecation")
	@Override
	public User findUser(String accessToken) {
		faceBookClient = new DefaultFacebookClient(accessToken);
		User user = faceBookClient.fetchObject("me", User.class);
		return user;
	}

}
