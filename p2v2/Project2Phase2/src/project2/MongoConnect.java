package project2;
import java.net.UnknownHostException;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ServerAddress;

public class MongoConnect 
{
   DB db;
   MongoClient client;
   DBCollection collection;
   // Connect to MongoDB database and return db of given name if present 
   public  DB getConnection(String dbname) throws UnknownHostException
    {  
       
       
	   	client = new MongoClient(new MongoClientURI("mongodb://admin:admin@mongodb:27017"));
    	 //client=new MongoClient(new MongoClientURI("localhost:27017/"));  
	     if(client!=null)
    	   {
    		   db=client.getDB(dbname);
    	   }
        
        return db;
    } 
   // Return the collection from given db
    public  DBCollection getCollection(DB db,String colname)
    {
    	return db.getCollection(colname);
    }
    // Close the database connection
    public  void closeConnection()
    {
    	client.close();
    }

}
