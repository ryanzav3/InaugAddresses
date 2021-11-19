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
                <title>United States Presidents' Inaugural Speeches</title>
            </head>
            
            
            <body>
                <h1>United States Presidents' Inaugural Speeches</h1>
                <h2>Table of Contents</h2>
                <ol><xsl:apply-templates select = "descendant::address" mode ="toc">
                    <xsl:sort select = "count(descendant::ref[@type = 'war'])" order = "descending"/>
                </xsl:apply-templates></ol>
                <hr/>
                
                <xsl:apply-templates select="descendant::address"/>
                
            </body>
            
        </html>
    </xsl:template>
    
    <xsl:template match = "p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match = "address" mode = "toc">
        <li><a href="#id{@n}"><strong><xsl:apply-templates select = "@name, ' ', @date"/>
        <xsl:apply-templates select="descendant::address"/></strong></a>
        <xsl:text> [Refs: </xsl:text><xsl:value-of select = "count(descendant::ref[@type = 'war'])"/><xsl:text>]</xsl:text></li>    
    </xsl:template>
    
    <xsl:template match = "address">
        <h2 id = "id{@n}"><xsl:apply-templates select = "@n , ' ', @name, ' ', @date"/></h2>
        <xsl:apply-templates select="descendant::p"/>
    </xsl:template>
    
    <xsl:template match = "ref[@type = 'social']">
        <span class = "social"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match = "ref[@type = 'economy']">
        <span class = "economy"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match = "ref[@type = 'diplomacy']">
        <span class = "diplomacy"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match = "ref[@type = 'religion']">
        <span class = "religion"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match = "ref[@type = 'war']">
        <span class = "war"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>