package ua.com.repository;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import ua.com.model.User;

public interface UserRepository extends MongoRepository<User, ObjectId> {

}
