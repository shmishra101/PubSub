package project2;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class Subscriber 
{
	public boolean subscribepublisher(String id,String publisherid) throws UnknownHostException
	   {
		  MongoConnect mongoconnect=new MongoConnect();
		  // Inserting new publisher to Subscriber database
		  DB db=mongoconnect.getConnection("Project2");
		  DBCollection collection=mongoconnect.getCollection(db, "subscriber");
		  BasicDBObject query=new BasicDBObject();
		  query.put("id",id);
		  BasicDBObject update=new BasicDBObject();
		  update.put("$push", new BasicDBObject("Publisher",publisherid));
		  collection.update(query, update,true,true);
		  // Adding subscriber to Publisher database
		  DBCollection pubcollection=mongoconnect.getCollection(db, "publisher");
		  BasicDBObject publishquery=new BasicDBObject();
		  publishquery.put("id",publisherid);
		  BasicDBObject publishupdate=new BasicDBObject();
		  publishupdate.put("$push", new BasicDBObject("Subscriber",id));
		  pubcollection.update(publishquery, publishupdate,true,true);
		  mongoconnect.closeConnection();
		  return true;
	   }
	public boolean unsubscribe(String id,String publisherid) throws UnknownHostException
	   {  MongoConnect mongoconnect=new MongoConnect();
		  DB db=mongoconnect.getConnection("Project2");
		  // Deleting Publisher from Subscriber
		  DBCollection collection=mongoconnect.getCollection(db, "subscriber");
		  BasicDBObject query=new BasicDBObject();
		  query.put("id",id);
		  BasicDBObject update=new BasicDBObject();
		  update.put("$pull", new BasicDBObject("Publisher",publisherid));
		  collection.update(query, update,true,true);
		  collection=null;
		  // Deleting Subscriber From Publisher
		  collection=mongoconnect.getCollection(db, "publisher");
		  BasicDBObject publishquery=new BasicDBObject();
		  publishquery.put("id",publisherid);
		  BasicDBObject publishupdate=new BasicDBObject();
		  publishupdate.put("$pull", new BasicDBObject("Subscriber",id));
		  collection.update(publishquery, publishupdate,true,true);
		  mongoconnect.closeConnection();
		  return true;
	   }
	public List<String> allpublisher() throws UnknownHostException
	{   List<String> publisherlist=new ArrayList<String>();
		MongoConnect mongoconnect=new MongoConnect();
		DB db=mongoconnect.getConnection("Project2");
		DBCollection collection=mongoconnect.getCollection(db, "publisher");
		DBCursor dbcur=collection.find();
		while(dbcur.hasNext())
		{
			DBObject dbobject=dbcur.next();
			publisherlist.add(dbobject.get("id").toString());
		}
		mongoconnect.closeConnection();
		return publisherlist;
	}
	public List<String> subscribedpublisher(String id) throws UnknownHostException
	   {   List<String> subscriberlist=new ArrayList<String>();
		   MongoConnect mongoconnect=new MongoConnect();
		   DB db=mongoconnect.getConnection("Project2");
		   DBCollection collection=mongoconnect.getCollection(db, "subscriber");
		   BasicDBObject basicdb=new BasicDBObject();
		   basicdb.put("id", id);
		   DBCursor dbcur=collection.find(basicdb);
		   String publish=null;
		   while(dbcur.hasNext())
			{
				DBObject dbobject=dbcur.next();
				BasicDBList dblist=(BasicDBList)dbobject.get("Publisher");
				int j=0;
				while(j<dblist.size())
				{
					subscriberlist.add(dblist.get(j).toString());
					j++;
				}
			}
		  
		   mongoconnect.closeConnection();
		   return subscriberlist;
	  }
	public List<String> availablepublisher(List<String> subsribedpublisher,List<String> allpublisher)
	{
		int j=0;
		while(j<subsribedpublisher.size())
		{
			if(allpublisher.contains(subsribedpublisher.get(j)))
			  {
				allpublisher.remove(subsribedpublisher.get(j));
			  }
			j++;
		}
	  return allpublisher;
	}
	public List<String> getMessage(String id) throws UnknownHostException
	{      List<String> message=new ArrayList<String>();
		   MongoConnect mongoconnect=new MongoConnect();
		   DB db=mongoconnect.getConnection("Project2");
		   DBCollection collection=mongoconnect.getCollection(db, "subscriber");
		   BasicDBObject basicdb=new BasicDBObject();
		   basicdb.put("id", id);
		   DBCursor dbcur=collection.find(basicdb);
		   int i=0;
		   while(dbcur.hasNext())
		   { DBObject dbobject=dbcur.next();
		     BasicDBList dblist=(BasicDBList)dbobject.get("event");
		    if(dblist!=null)
		    { int j=0;
		     while(j<dblist.size())
		     { DBObject dblistobject=(DBObject)dblist.get(j);
		       if(dblistobject.get("read").equals("0"))
		       { 
		         message.add(i, dblistobject.get("event_id").toString());
		         message.add(i+1,dblistobject.get("message").toString());
		         message.add(i+2,dblistobject.get("Publisher").toString());
		         i=i+3;
		       }
		      j++;
		     }
		    }
		   }
		   return message;
     }
	public void updatemessagestatus(String id,String eventid) throws UnknownHostException
	{
		MongoConnect mongoconnect=new MongoConnect();
		DB db=mongoconnect.getConnection("Project2");
		DBCollection collection=mongoconnect.getCollection(db, "subscriber");
		BasicDBObject basicdb=new BasicDBObject();
		basicdb.put("id", id);
		basicdb.put("event.event_id", eventid);
		BasicDBObject update=new BasicDBObject();
		update.put("$set", new BasicDBObject("event.$.read","1"));
		collection.update(basicdb, update);
    }
}
