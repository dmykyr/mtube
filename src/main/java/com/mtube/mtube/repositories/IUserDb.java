package com.mtube.mtube.repositories;

import com.mtube.mtube.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface IUserDb extends CrudRepository<User, Integer> {

    //SQL query for database
    //HQL query for Hibernate
    @Query("from User u where u.email = :email and u.password = :password ")
    User login(@Param("email") String email, @Param("password")String password);
}
