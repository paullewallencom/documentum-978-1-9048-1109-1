import com.documentum.fc.client.*;
import com.documentum.fc.common.*;
import java.io.IOException;

public class CreateUsersDFC{

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
		
		IDfUser userObj = null;
		userObj = (IDfUser)session.newObject( "dm_user" );
		// Seting client capability as 'contributor'
		userObj.setClientCapability(2);
		userObj.setDefaultFolder("/Dummy User",false);
		userObj.setDescription("User created via DFC");
		userObj.setHomeDocbase("dev_doc");
		userObj.setUserAddress("user001@xyz.com");
		// Setting user as member of 'content author' group
		userObj.setUserGroupName("content author");
		userObj.setUserName("Dummy User");
		// Setting user's OS name and Windows domain
		userObj.setUserOSName("user001","sysdomain");
		// Setting extended privileges as 8(config audit) + 16(purge audit) + 32(view audit)
		userObj.setUserXPrivileges(56);
		userObj.save();
		
		System.out.println("User created in DocBase!!");

	}catch(Exception e){

		  System.out.println("Catching generic exception in main: " + e.getMessage());
	}
	finally {

		sMgr.release( session );

	}
}// end of Main

}// end of class


