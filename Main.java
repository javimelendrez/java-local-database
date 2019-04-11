import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Main
{
    public static void main(String[] args) throws Exception
    {
        //call function to connect
        getConnection();
        get();
    }
    //function to connect to database
    public static Connection getConnection() throws Exception{
        //try to connect to the database if successful print it to console otherwise print error
        try{
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/COMPANY";
            String username = "root";
            String password = "root";
            Class.forName(driver);

            Connection conn = DriverManager.getConnection(url,username,password);
            System.out.println("Connected");
            return conn;
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static ArrayList<String> get() throws Exception{
        try{
            Connection conn = getConnection();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM EMPLOYEE");
            ResultSet result = statement.executeQuery();
            ArrayList<String> array = new ArrayList<String>();
            while (result.next()){
                System.out.println(result.getString("Fname"));
                System.out.println(" ");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
}
