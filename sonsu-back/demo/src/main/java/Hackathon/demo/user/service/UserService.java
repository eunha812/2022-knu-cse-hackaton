package Hackathon.demo.user.service;

import Hackathon.demo.user.dao.UserDao;
import Hackathon.demo.user.domain.entity.Users;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ExecutionException;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserDao userDao;

    public List<Users> getUsers() throws ExecutionException, InterruptedException {
        return userDao.getUsers("needer");
    }
}
