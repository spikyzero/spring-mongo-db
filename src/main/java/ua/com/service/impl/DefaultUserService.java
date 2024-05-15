package ua.com.service.impl;

import org.bson.types.ObjectId;
import org.springframework.stereotype.Service;
import ua.com.model.User;
import ua.com.repository.UserRepository;
import ua.com.service.UserService;

import java.util.List;

@Service
public class DefaultUserService implements UserService {

    private final UserRepository userRepository;

    public DefaultUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public void deleteUserById(ObjectId id) {
        userRepository.deleteById(id);
    }

}
