import java.sql.*;

public class Demo1 {
    static Connection con; //声明 Connection 对象
    static PreparedStatement pStmt=null;//声明预处理 PreparedStatement 对象
    static ResultSet res,set;//声明结果 ResultSet 对象
    static Statement stt;

    static String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
    static String user = "root";
    static String password = "884899";

    public static void main(String[] args) {//主方法

        //代码块（1）：加载数据库驱动类
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("数据库驱动加载成功");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //System.out.println("Hello");
        //代码块（2）：通过访问数据库的URL获取数据库连接对象
        try {
            con = DriverManager.getConnection(url,user,password);
            System.out.println("数据库连接成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //3.写sql
        //String sql = "INSERT INTO test_tb_user(id,name,psd)values (1,2,3)";
        //执行SQL语句
        try {
            String Sql = "select * from user";
            stt = con.createStatement();
            set = stt.executeQuery(Sql);
            while (set.next()) {

                System.out.println("用户名:" + set.getString(1) + "\t密码:"
                        + set.getString(2));

            }
            /*
            pStmt = con.prepareStatement("insert into mytable1(sex,name,age) values(?,?,?)");
            //pStmt = con.prepareStatement();
            //执行SQL，处理结果
            int x;
            for(x=0;x<10;x++){
                pStmt.setString(1,"female");
                pStmt.setString(2,"name"+x);
                pStmt.setInt(3,x);
                pStmt.executeUpdate();
            }*/
            //关闭链接，释放资源
            //pStmt.close();
            con.close();
            System.out.println("Information was inserted into table");
        }catch(SQLException e){
            System.out.println("Inserting failed");
            e.printStackTrace();
        }
        }
}