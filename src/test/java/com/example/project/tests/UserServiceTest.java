package com.example.project.tests;

import com.example.project.model.UserModel;
import com.example.project.repositories.UserRepo;

import com.example.project.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import org.springframework.security.core.userdetails.UserDetails;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserRepo userRepo;

    @BeforeEach
    void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testLoadUserByUsername_ShouldReturnSpringUserDetails() {
        UserModel user = new UserModel();
        user.setEmail("admin@example.com");
        user.setPassword("$2a$10$encodedBcryptHashString");
        user.setRole("ADMIN");

        when(userRepo.findByEmail("admin@example.com")).thenReturn(user);

        UserDetails userDetails = userService.loadUserByUsername("admin@example.com");

        assertNotNull(userDetails);
        assertEquals("admin@example.com", userDetails.getUsername());
        assertEquals("$2a$10$encodedBcryptHashString", userDetails.getPassword());
        assertTrue(userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN")));
    }

    @Test
    void testLoadUserByUsername_ShouldReturnNullWhenUserNotFound() {
        when(userRepo.findByEmail("missing@example.com")).thenReturn(null);

        UserDetails userDetails = userService.loadUserByUsername("missing@example.com");

        assertNull(userDetails);
    }

    @Test
    void testGetIdByEmail_ShouldReturnUserId() {
        UserModel user = new UserModel();
        user.setId(5);
        user.setEmail("test@example.com");

        when(userRepo.findByEmail("test@example.com")).thenReturn(user);

        int userId = userService.getIdByEmail("test@example.com");
        assertEquals(5, userId);
    }
}