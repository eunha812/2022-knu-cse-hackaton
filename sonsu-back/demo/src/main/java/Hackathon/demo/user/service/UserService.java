package Hackathon.demo.user.service;

import Hackathon.demo.user.dao.UserDao;
import Hackathon.demo.user.domain.entity.Helper;
import Hackathon.demo.user.domain.entity.Needer;
import Hackathon.demo.user.domain.entity.Users;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ExecutionException;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserDao userDao;

    public List<Helper> getHelpers() throws ExecutionException, InterruptedException {
        return userDao.getHelpers("helper");
    }

//    public List<Needer> getNeeders() throws ExecutionException, InterruptedException {
//        return userDao.getNeeders("needer");

//    }
    public Helper getHelperDetail(String id) throws Exception {
        return userDao.getHelperDetail(id, "helper");
    }
    public Needer getNeederDetail(String id) throws Exception {
        return userDao.getNeederDetail(id, "needer");
    }

    public String addHelperCount(Helper helper) throws Exception {
        int helpcount = Integer.parseInt(helper.getHelpCount())+1;

        helper.setHelpCount(String.valueOf(helpcount));
        return userDao.updateHelper(helper);
    }
}
