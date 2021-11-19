<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match = "/">
        <html>
            <head>
                <title>References by Each President</title>
            </head>
            
            <body>
                <h1>References By Each President</h1>
                
                <table>
                    <tr>
                        <th>Name</th>
                        <th>War</th>
                        <th>Social</th>
                        <th>Diplomacy</th>
                        <th>Economy</th>
                        <th>Religion</th>
                        <th>Total Refs</th>
                    </tr>
                    
                    <xsl:for-each select = "descendant::address[@name]">
                        <tr>
                            <td><xsl:value-of select = "@name, @n"/></td>
                            <td><xsl:value-of select = "count(descendant::ref[@type = 'war'])"/></td>
                            <td><xsl:value-of select = "count(descendant::ref[@type = 'social'])"/></td>
                            <td><xsl:value-of select = "count(descendant::ref[@type = 'diplomacy'])"/></td>
                            <td><xsl:value-of select = "count(descendant::ref[@type = 'economy'])"/></td>
                            <td><xsl:value-of select = "count(descendant::ref[@type = 'religion'])"/></td>
                            <td><xsl:value-of select = "count(descendant::ref)"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>