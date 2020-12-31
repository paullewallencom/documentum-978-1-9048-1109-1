import com.documentum.fc.client.*;
import com.documentum.fc.common.*;
import java.io.IOException;

public class LinkingFileDFC{

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

		//Linking a text document to a DocBase cabinet
		IDfDocument document = null;
		document = (IDfDocument)session.newObject( "dm_document" );
		document.setObjectName( "testing_link_file" );
		document.setContentType( "crtext" );
		document.setFile( "C:\\test\\DummyLinkedFile.txt" );
		document.link("/Custom_Cabinet/Custom_Fld");
		document.save();

		System.out.println("Object saved and linked!!");
		
	}catch(DfException dfe){

		System.out.println("DfException caught in main: " + dfe.getMessage());
		
	}catch(Exception e){

		 System.out.println("main::Exception is " + e.getMessage());
	}
	finally {

		sMgr.release( session );

	}

	}// end of Main

} // end of class

