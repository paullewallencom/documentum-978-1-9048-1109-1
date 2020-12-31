<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>	
<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" xmlns:xalan="http://xml.apache.org/xalan" exclude-result-prefixes="xalan java fo">
<xsl:output method="html" encoding="ISO-8859-1" indent="yes"/>

<xsl:strip-space elements="*"/>

	<xsl:template match="*|@*|comment()|processing-instruction()|text()">
	<xsl:copy>
	<xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
	</xsl:copy>
	</xsl:template>

<!-- Matching content XML file root element -->
<xsl:template match="NEWSART">
	<table border='0'>
	<tr>
	<th>News web site:</th>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<tr>
		<!-- Capturing location path of inserted banner image -->
		<xsl:variable name="imagePath"><xsl:value-of select="BANNERIMG/img/@src"/></xsl:variable>
		<!-- Capturing alternative text of inserted banner image -->
		<xsl:variable name="imageAltText"><xsl:value-of select="IMGALTTEXT"/></xsl:variable>
		<td><img src="{$imagePath}" alt="{$imageAltText}"></img></td>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<tr>
		<!-- Displaying news article date -->
		<td><b><u><xsl:copy-of select="DATE"/></u></b></td>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<tr>
		<!-- Displaying news article body text -->
		<td><xsl:copy-of select="BODYTEXT"/></td>
	</tr>
	<tr>
	<td><br></br></td>
	</tr>
	<!-- Iterating through multiple next article links -->
	<xsl:for-each select="REPEATBLOCK">
		<tr>
			<td><a href="{NEXTLINKURL}"><xsl:copy-of select="NEXTLINKNAME"/></a></td>
		</tr>
	</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>
