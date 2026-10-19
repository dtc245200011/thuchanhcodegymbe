package com.codegym.service;

import com.codegym.model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Lớp triển khai ProductService giả lập cơ sở dữ liệu lưu trữ danh sách sản phẩm bằng Map.
 */
public class ProductServiceImpl implements ProductService {
    private static final Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "iPhone 15 Pro", 999.0, "Titanium design, A17 Pro chip", "Apple"));
        products.put(2, new Product(2, "Samsung Galaxy S24", 899.0, "Galaxy AI, Dynamic AMOLED 2X", "Samsung"));
        products.put(3, new Product(3, "MacBook Pro 14", 1599.0, "M3 chip, 8GB RAM, 512GB SSD", "Apple"));
        products.put(4, new Product(4, "Dell XPS 15", 1399.0, "Intel i7, 16GB RAM, OLED Display", "Dell"));
        products.put(5, new Product(5, "Sony WH-1000XM5", 399.0, "Wireless Noise Canceling Headphones", "Sony"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        if (name == null || name.trim().isEmpty()) {
            return findAll();
        }
        for (Product product : products.values()) {
            if (product.getName().toLowerCase().contains(name.trim().toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }
}
