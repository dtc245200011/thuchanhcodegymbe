package com.codegym.service;

import com.codegym.model.Customer;
import java.util.List;

/**
 * Interface CustomerService dinh nghia cac thao tac nghiep vu quan ly khach hang.
 */
public interface CustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void update(int id, Customer customer);
    void remove(int id);
}
