package ua.com.controller;

import org.apache.commons.lang3.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.com.model.User;
import ua.com.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    private static final String TITLE = "title";
    private static final String EMAIL = "email";
    private static final String USERNAME = "username";
    private static final String USERS = "users";
    private static final String ERROR = "error";
    private static final String SUCCESS = "success";
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public String getUsersPage(final Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute(TITLE, "Users Page");
        model.addAttribute(USERS, users);
        return "users";
    }

    @GetMapping("/add")
    public String getAddUserPage(final Model model) {
        model.addAttribute(TITLE, "Add User Form");
        return "add-user";
    }

    @PostMapping("/add")
    public String addUser(
            @RequestParam(EMAIL) String email,
            @RequestParam(USERNAME) String username,
            final Model model,
            RedirectAttributes redirectAttributes) {
        model.addAttribute(TITLE, "Add User Form");
        if (StringUtils.isAnyEmpty(email, username)) {
            redirectAttributes.addFlashAttribute(ERROR, "Email and Username are required");
            return "redirect:/users/add";
        }
        saveUser(email, username);
        redirectAttributes.addFlashAttribute(SUCCESS, "User added successfully");
        return "redirect:/users";
    }

    @PostMapping("/delete")
    public String deleteUser(
            @RequestParam("userId") ObjectId userId,
            RedirectAttributes redirectAttributes) {
        userService.deleteUserById(userId);
        redirectAttributes.addFlashAttribute(SUCCESS, "User deleted successfully");
        return "redirect:/users";
    }

    private void saveUser(String email, String username) {
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setUsername(username);
        userService.save(newUser);
    }

}
