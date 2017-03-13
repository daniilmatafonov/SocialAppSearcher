package com.socialsearcher.facebook.core;

import com.restfb.types.User;

public interface FaceBookSearcherService {

	public User findUser(String accessToken);
}
