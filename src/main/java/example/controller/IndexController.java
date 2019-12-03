package example.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import example.service.captcha;
import example.service.loginHibernate;
import example.service.table;
import extend.ONEAPI;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import static extend.ONEAPI.getJson;


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
    @RequestMapping("/signinFormRequest")
    public void signinFormRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        loginindexsignin(request, response);
    }

    static void loginindexsignin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe=request.getParameter("rememberMe") ;
        loginHibernate login = new loginHibernate();
        int statement = login.sigin(email, password);

        JSONObject object = new JSONObject();

        object.put("success", 2);
        object.put("info", "UNmysql");


        switch (statement) {
            case 0: {
                object.put("success", 0);
                object.put("info", "服务器内部错误或者为空");
            }
            break;
            case 1: {
                object.put("success", 1);
                object.put("info", "login成功");
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                //使用request对象的getSession()获取session，如果session不存在则创建一个
                HttpSession session = request.getSession();
                //将数据存储到session中
                session.setAttribute("email", email);//用于判断是否登录，
                if(rememberMe=="value2") { //不选中是undefined
                    session.setMaxInactiveInterval(30*60*2);//一个小时内session,默认是30分钟
                }

            }
            break;
            case 3: {
                object.put("success", 3);
                object.put("info", "passwordError");
            }
            break;
            case 4: {
                object.put("success", 4);
                object.put("info", "没有这个用户");
            }
            break;
        }
        out.write(object.toJSONString());//json字符串
        out.flush();
        out.close();
    }

    @RequestMapping("/HomePage")
    public static String doGet(HttpServletRequest request,HttpServletResponse  response ) throws IOException { //重写 doget方法？？？？ 在jsp实例化后截住

        HttpSession session = request.getSession();

        //获取session的Id
        String sessionId = session.getId();
        //判断session是不是新创建的
        if (sessionId != null)
            if (session.getAttribute("email")==null ) {
            //未登录
//                response.sendRedirect("/login/signin");//旧的
                return "redirect:/signin";//https://www.cnblogs.com/xiaoluohao/p/11354145.html
            } else {


                return "/welcome/Hello";
            }

//        return "/welcome/Hello";
        return "/login/signin";
    }

    //欢迎字体页
    @RequestMapping("/welcome")
    public String welcome() {
        return "/welcome/Hello";
    }

    //     <!--数据表格的数据接口-->
    @RequestMapping("/table/user/*")
    public void  table(HttpServletRequest request, HttpServletResponse response) throws IOException {
               request.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        table table =new table();
       Object[] str = table.quary();

        //构造json
        JSONObject objectjson = new JSONObject();
        objectjson.put("status",0);
        objectjson.put("msg","");
        objectjson.put("total",8);
        objectjson.put("count",8);//结果总数
        objectjson.put("data",str);

//        返回,layui的话，返回还要在js中写回调函数
            out.write(objectjson.toJSONString());
            out.flush();
            out.close();



    }

    /**
     * 生成验证码
     */
    @RequestMapping("/getCodeImg")
    public void getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        captcha imgCheckCode=new captcha();
        String code=imgCheckCode.getRandomCodeStr();
        BufferedImage buffImg= imgCheckCode.getImgCode(code);
        System.out.println("Code is " +code);
        // 将四位数字的验证码保存到Session中。
        HttpSession session = request.getSession();
        session.setAttribute("CODE_SESSION_NAME",code);
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(buffImg, "jpeg", sos);
        sos.close();
    }





    /**
     * 检查提交的验证码是否正确
     */
    @RequestMapping("/checkCode")
    public  void  checkCode(HttpServletRequest request,HttpServletResponse  response ) throws IOException {
        String code = request.getParameter("codeImg");
        PrintWriter out=response.getWriter();

        String sessionCode=request.getSession().getAttribute("CODE_SESSION_NAME").toString();
        code=code.toUpperCase();
        if(sessionCode.equals(code)){
            out.write("true");
        }else{
            out.write("false");
        }}

    @RequestMapping ("/flower")
    public String   flower(){

        return "welcome/flower";
    }

//    每日一读
    @RequestMapping("/one")
    public void oneRead(HttpServletRequest request,HttpServletResponse response ) throws UnsupportedEncodingException {
        PrintWriter out=null;
        request.setCharacterEncoding("GB2312");
        response.setHeader("Content-type", "application/json;charset=GB2312");
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String num = request.getParameter("num");
        if(num==null||Integer.parseInt(num)==-0){num="0";}
         if(Integer.parseInt(num)<=0)
         {

             String s;
             s = getJson(Integer.parseInt(num));//应该是负数吧
             if (s == null) out.write("s为空，读文件发生io出错");

//      返回json数据
          else   out.write(s);
//        System.out.println(s);
         }
         else out.write("请求大于当前日期");

    }



//    bing
//  ——
    @RequestMapping("/bing")
    public String bing() {

//        return "Home/homepage";
        return "Home/bootlayout";
    }

    @RequestMapping("/bingImg")
    public void bingImg(HttpServletResponse response ,HttpServletRequest request ) throws IOException {
        JSONArray jsonArray = new JSONArray();
        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/javascript;charset=utf-8");
        PrintWriter out = response.getWriter();
for (int i=0;i<7;i++)
        {
        String  httpUrl=" https://cn.bing.com/HPImageArchive.aspx?format=js&idx="+i+"&n=1&mkt=zh-CN";

          String j= ONEAPI.request(httpUrl,null);
//构造json

            jsonArray.add(i,JSON.parseObject(j));
    }

//        String code = request.getParameter("code");
//if(code.equals("1"))   out.write("Handler("+jsonArray.toJSONString()+")");
        out.write("localHandler("+jsonArray.toJSONString()+")");
System.out.println(jsonArray.toJSONString());
    }
}
