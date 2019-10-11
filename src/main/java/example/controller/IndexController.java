package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class IndexController {

    //欢迎页
   @RequestMapping("/")
    public String index() {
        return "index";
    }
//登录页面
    @RequestMapping("/signin")
    public String Login() {
        return "/login/signin";
    }

    //注册页面
    @RequestMapping("/signup")
    public String register() {
        return "/login/signup";
    }

    //登录请求
    @RequestMapping("/singinFormRequest")
    public  String loginRequest(){
       return "1";
    }

    @RequestMapping("/HomePage")
        public String HomePage(){

            return "/Home/homepage";
        }

}

