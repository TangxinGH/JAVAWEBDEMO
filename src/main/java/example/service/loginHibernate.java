package example.service;

import example.pojo.UserinfoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

// Hibernate 操作mysql
public class loginHibernate {
   // static String email = "23@ww";//测试数据
   // static String password = "202cb962ac59075b964b0712d234b70";
    static int signinstatement = 0;

    public  int sigin(String email,String password) {
            SessionFactory sf;
            Configuration cfg;

        UserinfoEntity u = new UserinfoEntity();
        //这些要放在函数里面才行，难怪找不到错误

        //  u.setEmail(email);
        // u.setPassword(password);


//读取并解析配置文件
        cfg = new Configuration().configure();
//构建SessionFactory对象
        sf = cfg.buildSessionFactory();
        //打开session
        Session session = sf.openSession();
        //开启事务
        Transaction tx = session.beginTransaction();
//执行持久化操作（插入？）
        //创建关于user对象的criteria对象
        //  Criteria criteria = session.createCriteria(UserinfoEntity.class); 过时
        DetachedCriteria criteria = DetachedCriteria.forClass(UserinfoEntity.class);
        //添加条件，and 用户与密码都正确
        Map<String, String> map = new HashMap<String, String>();
        map.put("email", email);
        map.put("password", password);
        criteria.add(Restrictions.allEq(map));

        //查询全部数据
        List list = criteria.getExecutableCriteria(session).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Iterator it = list.iterator();

        if (it.hasNext()) signinstatement = 1;
        else {
            //再查一次用户是否存在
            DetachedCriteria criteria2 = DetachedCriteria.forClass(UserinfoEntity.class);
            criteria2.add(Restrictions.eq("email", email));
            // 通过字段检索
            List l = criteria2.getExecutableCriteria(session).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
            Iterator i = l.iterator();

            if (i.hasNext())
                signinstatement = 3;
            else signinstatement = 4;

            System.out.print("output test ");
        }

//提交事务
        tx.commit();
//关闭session
        session.close();

   return  signinstatement;
    }

}
