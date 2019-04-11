import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;  // Import the Scanner class
public class Main
{
    public static void main(String[] args) throws Exception
    {
        //call function to connect
        getConnection();
        //ask user for into to get data
        System.out.println("Enter the table you want to get data from. Note: mysql is case sensitive!");
        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        String table = myObj.nextLine();  // Read user input
        System.out.println("Enter the column you'd like to see.");
        String col = myObj.nextLine();  // Read user input
        //ask the user if they want the data to be sorted
        System.out.println("Would you like the data to be sorted. ( y / n ) ?");
        String sort = myObj.nextLine();  // Read user input
        //get the data
        get(table, col, sort);
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
            System.out.println("Connection to database Successful");
            return conn;
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static ArrayList<String> get(String table, String col, String sort) throws Exception{
        try{
            Connection conn = getConnection();
            //DEPENDING ON USER CHOICE SORT OR NOT
            //sorting is not working
            //i tried these methods not sure why it is not working
            //https://www.w3schools.com/sql/sql_orderby.asp

            if (sort == "y")
            {
                PreparedStatement statement = conn.prepareStatement("SELECT * FROM "+table+" ORDER BY DESC");
                ResultSet result = statement.executeQuery();
                ArrayList<String> array = new ArrayList<String>();
                while (result.next()){
                    System.out.println(result.getString(""+col));
                    System.out.println(" ");
                    array.add(result.getString(col));
                    return array;
                }
            }else {
                PreparedStatement statement = conn.prepareStatement("SELECT * FROM " + table);
                ResultSet result = statement.executeQuery();
                ArrayList<String> array = new ArrayList<String>();
                while (result.next()) {
                    System.out.println(result.getString("" + col));
                    System.out.println(" ");
                    array.add(result.getString(col));
                }
                return array;

            }
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
}
