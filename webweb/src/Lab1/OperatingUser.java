package Lab1;

import java.sql.SQLException;

public class OperatingUser{
    public void addUser(User u,DBConnector db) throws Exception {
        String sql = "insert into users values('"+u.getUsername()+"','" +u.getPassword() +"');";
        db.executeUpdateInsert("users",sql,u.getUsername());
    }
    public void deleteUser(String username,DBConnector db) throws Exception{
        //String sql = "insert into person values('"+p.getUsername()+"','"+p.getName()+"',"+p.getAge()+",'"+p.getTeleno()+"');";
        db.executeUpdateDelete("users",username);
    }
    public void clearUsers(DBConnector db){
        db.clear("users");
    }
    public void findUser(String username,DBConnector db) throws SQLException {
        db.find("users",username);
    }
    public void updateUser(String[] s,DBConnector db)throws SQLException{
        db.update("users",s);
    }
}