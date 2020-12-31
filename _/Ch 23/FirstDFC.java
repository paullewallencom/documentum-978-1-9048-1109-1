import com.documentum.fc.client.*;
import com.documentum.fc.common.*;

import java.io.IOException;

public class FirstDFC{

//Main method
public static void main(String args[]){


	IDfSession session = null;
	IDfSessionManager sMgr = null;

	try
	{
		IDfClient client = new DfClient().getLocalClient();
		sMgr = client.newSessionManager();
		IDfLoginInfo loginInfo = new DfLoginInfo();
		
		loginInfo.setUser( "documentum" );
		loginInfo.setPassword( "solutions" );
		sMgr.setIdentity( "dev_doc", loginInfo );
		session = sMgr.getSession( "dev_doc" );

		System.out.println("Session created !!");

	}catch(DfException dfe){

		  System.out.println("DfException caught in main: " + dfe.getMessage());
	}
	catch(Exception e){

		  System.out.println("Catching generic exception in main: " + e.getMessage());
	}
	finally {

		sMgr.release( session );

	}


}// end of Main

}// end of class


