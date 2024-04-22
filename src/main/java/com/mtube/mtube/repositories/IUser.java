package com.mtube.mtube.repositories;

import com.mtube.mtube.models.User;

public interface IUser {
    boolean register(User user);
    User login(String email, String password);
    User getById (int id);
}
