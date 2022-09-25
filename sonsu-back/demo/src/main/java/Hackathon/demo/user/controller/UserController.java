package Hackathon.demo.user.controller;

import Hackathon.demo.user.domain.entity.ListData;
import Hackathon.demo.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;


//    @GettertMapping("/users")
//    public ResponseEntity<Object> getUsers() throws ExecutionException, InterruptedException {
//        List<Users> list = userService.getUsers();
//        return ResponseEntity.ok().body(list);
//
//    }

    @GetMapping("/getInfo/getNeedList") ResponseEntity<Object> getList() throws ExecutionException, InterruptedException {
        return ResponseEntity.ok().body(userService.getList());
    }

    @PostMapping("/getInfo/getHelperInfo") ResponseEntity<Object> getHelper() throws Exception {
        return ResponseEntity.ok().body(userService.getHelperDetail("정보석"));
    }

    @PostMapping("/helper/saveLocation")
    public ResponseEntity<Object> saveLocation(){
        return ResponseEntity.ok().body("success");
    }

}
