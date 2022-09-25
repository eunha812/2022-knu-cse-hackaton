package Hackathon.demo.user.service;

import Hackathon.demo.user.dao.UserDao;
import Hackathon.demo.user.domain.entity.Helper;
import Hackathon.demo.user.domain.entity.ListData;
import Hackathon.demo.user.domain.entity.Needer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserDao userDao;

    public List<Helper> getHelpers() throws ExecutionException, InterruptedException {
        return userDao.getHelpers("helper");
    }

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

    public String addList(Needer needer) throws Exception {
        ListData newData = new ListData(needer);
        return userDao.insertList(newData);
    }

    public List<ListData> getList() throws ExecutionException, InterruptedException {
        //System.out.println(userDao.getNeederList());
//        List<ListData> listBefore = userDao.getNeederList();
//        List<ListData> listAfter = new ArrayList<>();

//        for(int i=0;i<listBefore.size();i++){
//            long time1 = Time.valueOf(listBefore.get(i).getTime()).getTime();
//            long time2 = System.currentTimeMillis ();
//
//            if(( time2 - time1 ) / 1000.0  <600){
//                listAfter.add(listBefore.get(i));
//            }
//        }

        return userDao.getNeederList();
    }
}
