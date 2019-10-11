package example.controller;

import example.service.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@Controller
@RequestMapping("/signup")
public class Sigup {

    //注册请求
    @RequestMapping("/signupFormRequest")
    public  void registerRequest(HttpServletResponse response, HttpServletRequest request) throws IOException {
        user user = new user();
        user.register(request,response);
    }
    //检查用户名
    @RequestMapping(value = "/signupCheckEmail",method = RequestMethod.GET)
    public void signupCheckEmail(HttpServletResponse response, HttpServletRequest request) throws IOException, SQLException, ClassNotFoundException {
        user u = new user();
        u.checkUserName(request,response);
//       return null;
    }


}
