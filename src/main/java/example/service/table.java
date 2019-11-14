package example.service;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.CriteriaSpecification;

import java.util.List;

public class table {
    SessionFactory sf;
    Configuration cfg;
  public Object[] quary(){

//读取并解析配置文件
       cfg = new Configuration().configure();
//构建SessionFactory对象
       sf = cfg.buildSessionFactory();
       //打开session
       Session session = sf.openSession();
        //创建sql语句
        String sql = "SELECT * FROM userinfo";
        //获得SQLQuery对象
        SQLQuery query = session.createSQLQuery(sql);
        //设定结果结果集中的每个对象为Map类型
        query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
//        分页
      query.setFirstResult(0);//从o行开始
      query.setMaxResults(10);//取多少行
        //执行查询
        List list = query.list();
      Object[] str = list.toArray(); //这是转成了string 对象，而layui中要求数组对象，数组并且对象？、


//或者下面这个转json的也可以，用的是不同的包而已
//      Map map = null;
//      JSONObject jsonObject = null;
//      List jsonList = new ArrayList();
//      for(int i=0;i<list.size() ;i++){
//          map = (Map)list.get(i);
//          jsonObject = new JSONObject(map);
//          jsonList.add(jsonObject);
//      }
//
//      JSONArray json = new JSONArray(jsonList);
//      System.out.println( json.toString() );
//    String  todayInfo =  json.toString();



        //释放session
        session.close();

      //返回数据
      return str;
    }
}
