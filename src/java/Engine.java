/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nutan Gupta
 */
import javax.sql.*;
import java.sql.*;

public class Engine {
    
    Connection con;
    Statement st;
    
    public Engine()
    {
       try
        {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
        st=con.createStatement();
        }catch(Exception e){
            
        }
    }
          
    public int getNewId(String query,String Column,int index)
    {
        
        try{
      String lastcompany="";
      int newid1=0;
      ResultSet rs2=st.executeQuery(query);
      if(rs2.next())
      {
            lastcompany=rs2.getString(Column);
            String id1=lastcompany.substring(index,lastcompany.length());
            newid1=(Integer.parseInt(id1));
            ++newid1;
       return newid1;     
      }
        }
        catch(Exception e)
        {
            
        }
        return 0;
    }
    
    public void executeQuery(String query)
    {
         
        try{
        st.executeUpdate(query);
        }catch(Exception e){}
    }
    
}
