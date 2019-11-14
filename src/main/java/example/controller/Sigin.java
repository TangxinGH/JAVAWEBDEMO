package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/signin")
public class Sigin {

    //注册请求
    @RequestMapping("/signinFormRequest")
 public  void signinFormRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        IndexController.loginindexsignin(request, response);
    }


}
