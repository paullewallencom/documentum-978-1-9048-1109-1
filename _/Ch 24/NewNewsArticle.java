package com.newsarticle.content;

import com.documentum.fc.client.*;
import com.documentum.fc.common.DfException;
import com.documentum.fc.common.DfId;
import com.documentum.web.common.ArgumentList;
import com.documentum.web.common.ErrorMessageService;
import com.documentum.web.common.LocaleService;
import com.documentum.web.form.Control;
import com.documentum.web.form.Form;
import com.documentum.web.form.IControlListener;
import com.documentum.web.form.control.*;
import com.documentum.web.form.control.databound.DataDropDownList;
import com.documentum.web.form.control.databound.DataListBox;
import com.documentum.web.form.control.databound.TableResultSet;
import com.documentum.web.form.control.databound.DataOptionList;
import com.documentum.web.formext.component.Component;
import com.documentum.web.formext.control.docbase.DocbaseAttribute;
import com.documentum.web.formext.control.docbase.DocbaseAttributeValue;
import com.documentum.web.formext.control.docbase.DocbaseObject;
import com.documentum.wp.app.WcmHttpAppContext;
import com.documentum.wp.app.WpStatusUtil;
import com.documentum.nls.NlsResourceBundle;

import java.util.*;

/**
 * This class is a behaviour class for News Article component.
 * @author : Gaurav Kathuria
 * @version : 1.0, 29/11/2005
 *
 */
 public class NewNewsArticle extends Component
     
{
    private String m_strObjectId;
    private String m_strObjectType;

	private Text txt_news_article_name;
	private Text txt_news_summary;
	private DataDropDownList txt_display_order;


// Constructor
    public NewNewsArticle()
    {
   
        m_strObjectId = null;
		txt_news_article_name = null;
        txt_news_summary = null;
		txt_display_order = null;
   
    }

 /**
     * News Article component initializer method
     *
     * @param argumentlist : ArgumentList
     */
    public void onInit(ArgumentList argumentlist)
    {
        super.onInit(argumentlist);
        m_strObjectId = argumentlist.get("objectId");
        initControls();
   
	}


/**
     * Method for initializing controls
     */

    private void initControls()
    {
        txt_news_article_name = (Text) getControl("txt_news_article_name", 
		com.documentum.web.form.control.Text.class);    
        txt_news_summary = (Text) getControl("txt_news_summary", com.documentum.web.form.control.Text.class);
		txt_display_order = (DataDropDownList) getControl("txt_display_order", 
		com.documentum.web.form.control.databound.DataDropDownList.class);
		initializeOrderDropdown();
		        
    }

	/**
     * Method for initializing display order dropdown
     */
    private void initializeOrderDropdown()
    {
        String strId = "", strLabel = "";
        IDfCollection idfcollection = null;
        IDfQuery dfquery = new DfQuery();
        IDfSession dfSession = null;
	
        TableResultSet tableresultset = new TableResultSet(new String[]{"DISPLAY_ORDER_ID", "DISPLAY_ORDER_VALUE"});

        try
        {
            dfSession = getDfSession();
            dfquery.setDQL("select col1,col2 from dm_dbo.table1");
            idfcollection = dfquery.execute(dfSession, IDfQuery.DF_READ_QUERY);
        
            while (idfcollection.next())
            {
                strId = idfcollection.getString("col1");
	            strLabel = idfcollection.getString("col2");
		        tableresultset.add(new String[]{strId, strLabel});
            }


        }
        catch (DfException dfe)
        {
            ErrorMessageService.getService().setNonFatalError(this, "MSG_ERROR_ORDER_DROPDOWN_POPULATION", dfe);
			System.out.println("Execption caught!!");
            setReturnError("MSG_ERROR_ORDER_DROPDOWN_POPULATION", null, dfe);
            return;
        }
        finally
        {
            try
            {
                if (idfcollection != null && idfcollection.getState() != IDfCollection.DF_CLOSED_STATE)
                    idfcollection.close();
            }
            catch (DfException dfexception1)
            {
                //logMessage.warn(dfexception1.getMessage(), dfexception1);
            }
        }

        txt_display_order.getDataProvider().setResultSet(tableresultset, null);

      
    }



	 /**
     * This Function is executed when user wants want to commit changes by clicking on OK button
     */
    public boolean onCommitChanges()
    {
		try
        {
			IDfSession sessionObj = getDfSession();
			IDfSysObject idfsysobject = (IDfSysObject) sessionObj.newObject("cust_newsarticle");

			String newsArticleNameValue = txt_news_article_name.getValue();
			 
			 if (newsArticleNameValue != null)
            {
                idfsysobject.setString("object_name", newsArticleNameValue);
            }

			String newsSummaryValue = txt_news_summary.getValue();
			 
			 if (newsSummaryValue != null)
            {
                idfsysobject.setString("cust_news_summary", newsSummaryValue);
            }

			 //Get the the link level from the datadropdown list.
			DataDropDownList displayOrderControl = (DataDropDownList) getControl("txt_display_order", 
			DataDropDownList.class);
			String displayOrderID = displayOrderControl.getValue();

			 if (displayOrderID != null)
            {
                idfsysobject.setString("cust_news_display_order", displayOrderID);
            }

		    if (idfsysobject.isDirty())  // Checking if object is not updated
				if (idfsysobject.isCheckedOut())  // If object has been checkout
				{
					idfsysobject.saveLock();  // Retains the lock on the object
				}
				else
				{
					idfsysobject.save(); // Saves changes. If object not checked out.
				}

            return true;
		}
		catch (DfException dfe)
        {
            ErrorMessageService.getService().setNonFatalError(this, "MSG_ERROR_SAVE_OPERATION", dfe);
            setReturnError("MSG_ERROR_SAVE_OPERATION", null, dfe);
            return false;
        }

	}




}