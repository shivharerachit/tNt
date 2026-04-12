package Controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import Service.UserService; 
import org.springframework.web.bind.annotation.PostMapping;

@RestController("/user")
public class UserController {
    @Autowired
    UserService userService;
    @PostMapping("/getUser")
    public String getUser() {
        return userService.getUser();
    }
}

// Controller -> Service -> Repository -> Database