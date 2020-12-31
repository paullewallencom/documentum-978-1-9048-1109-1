import com.documentum.fc.client.*;
import com.documentum.fc.common.*;

import java.io.IOException;

public class RunningMethodThroughDFC{

static final String methodName = "dm_DataDictionaryPublisher";
static final String jobName = "dm_DataDictionaryPublisher";
static final String methodArguments = 
"-docbase_name dev_doc.dev_doc -user_name documentum -method_trace_level 5";

//Main method
public static void main(String args[]){

IDfSession session = null;
IDfSessionManager sMgr = null;

try
{
String strDocbaseName = "dev_doc";

	//Connecting to DocBase
	IDfClient client = new DfClient().getLocalClient();
	sMgr = client.newSessionManager();
	IDfLoginInfo loginInfo = new DfLoginInfo();
	
	loginInfo.setUser( "documentum" );
	loginInfo.setPassword( "solutions" );
	sMgr.setIdentity(strDocbaseName, loginInfo );
	session = sMgr.getSession(strDocbaseName);
	
	System.out.println("Connected to DocBase..");

	IDfQuery q = null;
	IDfCollection coll = null;
	String methodCmd = null;
	String methResult = null;
	String methObjectId = null;

	 // Fetching method reference
	 q = new DfQuery();
	 q.setDQL("select r_object_id from dm_method where object_name='" + methodName + "'");
	 coll = q.execute(session, DfQuery.DF_READ_QUERY);
	 while (coll.next()) {
		 methObjectId = coll.getId("r_object_id").toString();
	 }

	 coll.close();


	 System.out.println("Object ID of the method:  " + methObjectId );

	 // Fetching associated job reference
	 IDfQuery qry = null;
	 IDfCollection colln = null;
	 String jobObjectId = null;

	 qry = new DfQuery();
	 qry.setDQL("select r_object_id from dm_job where object_name='" + jobName + "'");
	 colln = qry.execute(session, DfQuery.DF_READ_QUERY);
	 while (colln.next()) {
		 jobObjectId = colln.getId("r_object_id").toString();
	 }

	 colln.close();


	methodCmd="DO_METHOD,METHOD,S," + methodName + ",TIME_OUT,I,200,SAVE_RESULTS,B,T,ARGUMENTS,S,"
	+ methodArguments + " -job_id " + jobObjectId;

	//Obtaining handle to the method
	IDfId sysObjID = new DfId(methObjectId);
	IDfSysObject sysObject = (IDfSysObject)session.getObject(sysObjID);
	// Executing the method
	methResult = sysObject.apiGet("apply", methodCmd);

	System.out.println("Result of executing the method: " + methResult );

	sysObject.save();

	System.out.println("method executed successfully!!");


}catch(Exception e){
      System.out.println("main::Exception is " + e.getMessage());
}
finally {
sMgr.release( session );

}



}


}