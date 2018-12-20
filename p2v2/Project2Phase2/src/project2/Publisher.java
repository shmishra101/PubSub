package project2;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;


public class Publisher 
{  
   BasicDBObject basicdb;
   public List<String> publish(String id, int eventid,String message) throws UnknownHostException
   {
	  MongoConnect mongoconnect=new MongoConnect();
	  DB db=mongoconnect.getConnection("Project2");
	  DBCollection collection=mongoconnect.getCollection(db, "publisher");
	  DBObject query=new BasicDBObject();
	  query.put("id",id);
	  BasicDBObject addevent=new BasicDBObject();
	  addevent.put("event_id",eventid+"");
	  addevent.put("message",message);
	  BasicDBObject update=new BasicDBObject();
	  update.put("$push", new BasicDBObject("event",addevent));
	  collection.update(query, update,true,true);
	  DBCursor dbcursor=collection.find(query);
	  List<String> subscriber=new ArrayList<String>();
	  while(dbcursor.hasNext())
	  {
		  DBObject dbobject=dbcursor.next();
		  BasicDBList dblist=(BasicDBList)dbobject.get("Subscriber");
		  int j=0;
			while(j<dblist.size())
			{
				subscriber.add(dblist.get(j).toString());
				j++;
			}
	  }

	  mongoconnect.closeConnection();
	  return subscriber;
   }
   public void notify(List<String> subscriber,String message,int eventid,String publisherid) throws UnknownHostException
   {   int j=0;
       MongoConnect mongoconnect=new MongoConnect();
	   DB db=mongoconnect.getConnection("Project2");
	   DBCollection collection=mongoconnect.getCollection(db, "subscriber");
	   while(j<subscriber.size())
	   {
		      DBObject query=new BasicDBObject();
			  query.put("id",subscriber.get(j));
			  BasicDBObject addevent=new BasicDBObject();
			  addevent.put("event_id",eventid+"");
			  addevent.put("message",message);
			  addevent.put("read", "0");
			  addevent.put("Publisher",publisherid);
			  BasicDBObject update=new BasicDBObject();
			  update.put("$push", new BasicDBObject("event",addevent));
			  collection.update(query, update,true,true);
              j++;
	   }
	   mongoconnect.closeConnection();
   }
   public List<String> allsubscriber(String id) throws UnknownHostException
   {   List<String> subscriberlist=new ArrayList<String>();
	   MongoConnect mongoconnect=new MongoConnect();
	   DB db=mongoconnect.getConnection("Project2");
	   DBCollection collection=mongoconnect.getCollection(db, "publisher");
	   BasicDBObject basidb=new BasicDBObject();
	   basicdb.put("id", id);
	   DBCursor dbcur=collection.find(basidb);
	   DBObject dbobject=dbcur.next();
	   BasicDBList dblist=(BasicDBList)dbobject.get("Subscriber");
		  int j=0;
			while(j<dblist.size())
			{
				subscriberlist.add(dblist.get(j).toString());
				j++;
			}
	   mongoconnect.closeConnection();
	   return subscriberlist;
   }
}
