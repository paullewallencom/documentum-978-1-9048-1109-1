<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>	
<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" xmlns:xalan="http://xml.apache.org/xalan" exclude-result-prefixes="xalan java fo">

<xsl:output method="html" encoding="ISO-8859-1" indent="yes"/>
<xsl:param name="DMS_SESSION_ID" select="'default value'"/>
<xsl:param name="DMS_INPUT_OBJECT_ID"/>
<xsl:strip-space elements="*"/>
<xsl:template match="*|@*|comment()|processing-instruction()|text()">
	<xsl:copy>
		<xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
	</xsl:copy>
</xsl:template>

<!-- variable storing the DQL query -->
<xsl:variable name = "dqlQuery">select r_object_id, object_name from dm_document where r_object_id = '<xsl:value-of select="$DMS_INPUT_OBJECT_ID"/>'</xsl:variable>
	
<!-- variable storing the DQL query results -->
<xsl:variable name = "query_results">
	<xsl:call-template name="XDQL">
	<xsl:with-param name="dql" select="string($dqlQuery)"/>
	</xsl:call-template>
</xsl:variable>

<!-- variable storing the 'object_name' attribute from query results -->
<xsl:variable name="ObjectName">
	<xsl:for-each select="xalan:nodeset($query_results)/xdql/object">
	<xsl:value-of select="object_name"/>
	</xsl:for-each>
</xsl:variable>	

<!-- Matching content XML file root element -->
<xsl:template match="ROOTTAG">
	<table border='0'>
	<tr>
	<th>File name:</th>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<tr>
		<!-- Displaying the name of the file ('object_name' attribute) -->
		<td><b><u><xsl:value-of select="$ObjectName"/></u></b></td>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<tr>
		<!-- Displaying short description -->
		<td><xsl:copy-of select="SHORTDESC"/></td>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	</table>
</xsl:template>

<!--Template code for integrating DQL queries in XSL Starts -->
<xsl:template name="XDQL">
	<xsl:param name="dql"/>
	<xsl:param name="roottag" select="string('xdql')"/>
	<xsl:param name="UpperTags" select="string('false')"/>
	<xsl:param name="MaxRows" select="10"/>
	<xsl:param name="RowIDAttrName" select="ID"/>
	<xsl:param name="RowsetTag" select="Row"/>
	<xsl:param name="UseGivenCaseTagNames" select="true"/>
	<xsl:param name="UseNullAttrIndicator" select="false"/>
	<xsl:variable name="xdql" select="java:com.documentum.xml.xdql.DfXmlQuery.new()"/>
	<xsl:variable name="init" select="java:init($xdql)"/>
	<xsl:variable name="param" select="java:setDql($xdql,$dql)"/>
	<xsl:variable name="param1" select="java:setRootNode($xdql,$roottag)"/>
	<xsl:variable name="param3" select="java:includeContent($xdql,false())"/>
	<xsl:variable name="setContentEncoding" select="java:setContentEncoding($xdql,string('dom'))"/>
	<xsl:variable name="setContentFormat" select="java:setContentFormat($xdql,string('xml'))"/>
	<xsl:variable name="execute" select="java:execute($xdql, 'DF_READ_QUERY', $DMS_SESSION_ID)"/>
	<xsl:variable name="queryresult" select="java:getXMLDOM($xdql)"/>
	<xsl:copy-of select="$queryresult"/>
</xsl:template>
<!--Template code for integrating DQL queries in XSL Ends -->

</xsl:stylesheet>
