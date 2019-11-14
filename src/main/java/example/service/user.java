package example.service;

import com.alibaba.fastjson.JSONObject;
import example.pojo.UserinfoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;


public class user extends HttpServlet {

    @Size (min=3, max=20, message="用户名长度只能在3-20之间")
    private String userName;

    @Size(min=6, max=20, message="密码长度只能在6-20之间")
    private String password;

    @Pattern(regexp="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message="邮件格式错误")
    private String email;

    public String getUserName() {
        return userName;
    }

    public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        request.setCharacterEncoding("utf-8");
//    此行代码必须写在最前面或者所有request.getParameter("");方法之前，如果在此前进行任何request.getPragrmber()方法都会使字符转换失效！
// 必须要在读取request的getParameter()和 getReader() 方法之前调用 否则字符转换失效
        response.setHeader("Content-type", "text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
         email=request.getParameter("email"); //得到邮箱
         password=request.getParameter("password");//得到密码

//        if(email!=null)out.write(email);else out.write("email为空");
//        if(password!=null)out.write(password);else out.write("密码为空");
//

//String sql="SELECT email FROM userinfo where email='"+email+"';";
        checkuser find=new checkuser();
               int result= find.check(email);
               if(result==1)out.write( "true");
        //返回双引号的true或false
               else out.write( "false");

    }

    public void register(HttpServletRequest request,HttpServletResponse response) throws IOException {

        PrintWriter out=response.getWriter();
       email=request.getParameter("email");
        password=request.getParameter("password");
       String fistName=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
//       参数验证,服务器端验证

//                userName=null;
//
//              ObjectError error
//                    System.out.println(error.getDefaultMessage());
String sql = "INSERT INTO userinfo(email, firstname,lastname,password)VALUES('"+email+"','"+fistName+"','"+lastname+"','"+password+"');";
System.out.println(sql);
MysqlHibernate book=new MysqlHibernate();
if(book.myhi(email,password,fistName,lastname)==1) {
    JSONObject object = new JSONObject();
    object.put("success", 1);
    object.put("info", "注册成功");

    out.write(object.toJSONString());//json字符串
}else {
    JSONObject object = new JSONObject();
    object.put("success", 0);
    object.put("info", "注册失败");

    out.write(object.toJSONString());//json字符串
}
    }

}

class  MysqlHibernate{
int success=-1;
   int  myhi(String email,String password,String firstname,String lastname){
       SessionFactory sf;
       Configuration cfg;

       UserinfoEntity r = new UserinfoEntity();
       r.setEmail(email);//这些要放在函数里面才行，难怪找不到错误
       r.setLastname(lastname);
       r.setFirstname(firstname);
       r.setPassword(password);

//读取并解析配置文件
       cfg = new Configuration().configure();
//构建SessionFactory对象
       sf = cfg.buildSessionFactory();
//打开session
       Session session = sf.openSession();
//开启事务
       Transaction tx = session.beginTransaction();
//执行持久化操作
       session.save(r);
//提交事务
       tx.commit();

       DetachedCriteria criteria = DetachedCriteria.forClass(UserinfoEntity.class);
       //添加条件，and 用户与密码都正确

       criteria.add(Restrictions.eq("email",email));

       //查询全部数据
       List list = criteria.getExecutableCriteria(session).list();
       Iterator it = list.iterator();
       if(it.hasNext())success=1;else success=0;
//关闭session
       session.close();
       return success ;//返回插入结果
   }
}
class  checkuser{
   int  check (String email){
       SessionFactory sf;
       Configuration cfg;
int result=0;

//读取并解析配置文件
       cfg = new Configuration().configure();
//构建SessionFactory对象
       sf = cfg.buildSessionFactory();
//打开session
       Session session = sf.openSession();
//开启事务
       Transaction tx = session.beginTransaction();

//提交事务
       tx.commit();

       DetachedCriteria criteria = DetachedCriteria.forClass(UserinfoEntity.class);


       criteria.add(Restrictions.eq("email",email));

       //查询全部数据
       List list = criteria.getExecutableCriteria(session).list();
       Iterator it = list.iterator();
       if(it.hasNext()) result  =0;else result=1;
//关闭session
       session.close();
       return result ;//返回插入结果
    }
}
//     ResultSet executeQuery(String sql); 执行SQL查询，并返回ResultSet 对象。
//        int executeUpdate(String sql); 可执行增，删，改，返回执行受到影响的行数。
//        boolean execute(String sql); 可执行任何SQL语句，返回一个布尔值，表示是否返回ResultSet 。
//        ————————————————
//        版权声明：本文为CSDN博主「weiqiangGG」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
//        原文链接：https://blog.csdn.net/weiqiangGG/article/details/82890204