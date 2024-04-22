package com.mtube.mtube.services;

import com.mtube.mtube.models.User;
import com.mtube.mtube.repositories.IUser;
import com.mtube.mtube.repositories.IUserDb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class UserService implements IUser {

    //DI
    @Autowired
    IUserDb repository;
    @Override
    public boolean register(User user) {
        try {
            repository.save(user);
            return true;
        }
        catch(Exception ex){
            return false;
        }
    }

    @Override
    public User login(String email, String password) {
        return repository.login(email, password);
    }

    @Override
    public User getById(int id) {
        return repository.findById(id).get();
    }
}
