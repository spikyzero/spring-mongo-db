package ua.com.service;

import org.bson.types.ObjectId;
import ua.com.model.User;

import java.util.List;

public interface UserService {

    void save(User user);

    List<User> getAllUsers();

    void deleteUserById(ObjectId id);

}
