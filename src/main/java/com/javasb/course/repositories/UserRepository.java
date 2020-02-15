package com.javasb.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javasb.course.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
