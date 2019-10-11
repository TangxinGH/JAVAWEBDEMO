package example.controller;

import com.alibaba.fastjson.JSONObject;
import example.service.login;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.security.auth.login.LoginContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/signin")
public class Sigin {

    //注册请求
    @RequestMapping("/signinFormRequest")
 public  void signinFormRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String email=request.getParameter("email");
     String  password=request.getParameter("password");
        login login=new login();
     int statement=login.sigin(email,password);

        JSONObject object = new JSONObject();

        object.put("success", 2);object.put("info", "UNmysql");


        switch (statement){
          case  0 :  {object.put("success", 0); object.put("info","服务器内部错误或者为空");}break;
            case 1 : {object.put("success", 1);object.put("info", "login成功");}break;
            case 3 : {object.put("success", 3);object.put("info", "passwordError");}break;
            case 4 : {object.put("success", 4);object.put("info", "没有这个用户");}break;
            }
        out.write(object.toJSONString());//json字符串
    }
}
