package Lab1;

import java.sql.SQLException;

public class OperatingPerson {
    public void addPerson(Person p,DBConnector db) throws Exception{
        String sql = "insert into person values('"+p.getUsername()+"','"+p.getName()+"',"+p.getAge()+",'"+p.getTeleno()+"');";
        db.executeUpdateInsert("person",sql,p.getUsername());
    }
    public void deletePerson(String username,DBConnector db) throws Exception{
        //String sql = "insert into person values('"+p.getUsername()+"','"+p.getName()+"',"+p.getAge()+",'"+p.getTeleno()+"');";
        db.executeUpdateDelete("person",username);
    }
    public void clearPerson(DBConnector db){
        db.clear("person");
    }
    public void findPerson(String username,DBConnector db) throws SQLException {
        db.find("person",username);
    }
    public void updatePerson(String[] s, DBConnector db)throws SQLException{
        db.update("person",s);
    }
}