package com.example.project.service;

import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

@Service
public class CategoryService {
    public Map<Integer, String> getCategoryMap() {
        Map<Integer, String> categoryMap = new TreeMap<>();
        categoryMap.put(1, "Consoles");
        categoryMap.put(2, "Mobiles and Tablets");
        categoryMap.put(3, "Tv, Appliances, Electronics");
        categoryMap.put(4, "Home and Kitchen");
        categoryMap.put(5, "Mens's Fashion");
        categoryMap.put(6, "Women's Fashion");
        categoryMap.put(7, "Sports, Fitness, Bags");
        categoryMap.put(8, "Books");
        categoryMap.put(9, "Movies, Music & Video Games");
        categoryMap.put(10, "Toys, Baby Products, Kids' Fashion");
        return categoryMap;
    }

}
