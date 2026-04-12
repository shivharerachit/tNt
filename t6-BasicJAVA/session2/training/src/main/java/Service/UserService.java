package Service;

import org.springframework.stereotype.Service; 

@Service
public class UserService {
    public String getUser() {
        return "Hello, User!";
    }
}