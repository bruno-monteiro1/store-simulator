package com.javasb.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javasb.course.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
