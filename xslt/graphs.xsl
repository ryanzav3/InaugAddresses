<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name = "interval" select = "100"/>
    
    <xsl:template match = "/">
        <html>
            <head>
                <title>Numbers of References per Speech</title>
                <link rel="stylesheet" href="/InaugAddresses/html-css/index.css"/>
            </head>
            
            <body>
                <svg width="100%" height="800%">
                    <g transform="translate(250, 50)">
                        <text x="775" y="550" text-anchor="middle">Numbers of References per Speech (War, Religion, Economy, Social, Diplomacy)</text>
                            
                        <!-- to do == flip names so they come from top, add numbers on top axis, fit all names on the graph-->
                        <!-- y-axis -->
                        <line x1="20" x2="20" y1="0" y2="{(59 * $interval) + 100}" stroke="black" stroke-width="1"/>
                        <!-- x-axis (bottom) -->
                        <line x1="20" x2="650" y1="{(59 * $interval) + 100}" y2="{(59 * $interval) +100}" stroke="black" stroke-width="1"/>
                        <!-- x-axis (top)-->
                        <line x1="20" x2="650" y1="0" y2="0" stroke="black" stroke-width="1"/>
                        
                        <!-- labels the x-axis (bottom) 
                        <text x="5" y="20" text-anchor="middle">0</text>
                        <text x="65" y="20" text-anchor="middle">5</text>
                        <text x="125" y="20" text-anchor="middle">10</text>
                        <text x="185" y="20" text-anchor="middle">15</text>
                        <text x="245" y="20" text-anchor="middle">20</text>
                        <text x="305" y="20" text-anchor="middle">25</text>
                        <text x="365" y="20" text-anchor="middle">30</text>
                        <text x="425" y="20" text-anchor="middle">35</text>-->
                        
                        <!-- labels the x-axis (top) 
                        <text x="5" y="20" text-anchor="middle">0</text>
                        <text x="65" y="20" text-anchor="middle">5</text>
                        <text x="125" y="20" text-anchor="middle">10</text>
                        <text x="185" y="20" text-anchor="middle">15</text>
                        <text x="245" y="20" text-anchor="middle">20</text>
                        <text x="305" y="20" text-anchor="middle">25</text>
                        <text x="365" y="20" text-anchor="middle">30</text>
                        <text x="425" y="20" text-anchor="middle">35</text>-->
                        
                        <!-- Instead stead of using xsl:apply-templates and creating another xsl:template match, we use xsl:for-each -->
                        <xsl:for-each select="//address">
                            <!-- Local variables -->
                            <xsl:variable name="ypos" select="position() * $interval"/>
                            <xsl:variable name="xpos" select="(count(descendant::ref[@type]) *20 )+20"/>
                            
                            <xsl:variable name="xposW" select="(count(descendant::ref[@type='war']) *20 )+20"/>
                            <xsl:variable name="xposS" select="(count(descendant::ref[@type='social']) *20 )+20"/>
                            <xsl:variable name="xposE" select="(count(descendant::ref[@type='economy']) *20 )+20"/>
                            <xsl:variable name="xposD" select="(count(descendant::ref[@type='diplomacy']) *20 )+20"/>
                            <xsl:variable name="xposR" select="(count(descendant::ref[@type='religion']) *20 )+20"/>
                            
                            <!--bars (war, social, economy, diplomacy, religion-->
                            <line x1="20" x2="{$xposW}" y1="{$ypos}" y2="{$ypos}" stroke="red" stroke-width="15"/>
                            <line x1="20" x2="{$xposS}" y1="{$ypos+15}" y2="{$ypos+15}" stroke="blue" stroke-width="15"/>
                            <line x1="20" x2="{$xposD}" y1="{$ypos+30}" y2="{$ypos+30}" stroke="green" stroke-width="15"/>
                            <line x1="20" x2="{$xposE}" y1="{$ypos+45}" y2="{$ypos+45}" stroke="orange" stroke-width="15"/>
                            <line x1="20" x2="{$xposR}" y1="{$ypos+60}" y2="{$ypos+60}" stroke="purple" stroke-width="15"/>
                            
                            <!-- labels each bar with its count -->
                            <text x="{$xposW + 10}" y="{$ypos}">
                                <xsl:value-of select="count(descendant::ref[@type='war'])"/>
                            </text>
                            
                            <text x="{$xposS + 10}" y="{$ypos + 20}">
                                <xsl:value-of select="count(descendant::ref[@type='social'])"/>
                            </text>
                            
                            <text x="{$xposD + 10}" y="{$ypos+ 35}">
                                <xsl:value-of select="count(descendant::ref[@type='diplomacy'])"/>
                            </text>
                            
                            <text x="{$xposE + 10}" y="{$ypos + 50}">
                                <xsl:value-of select="count(descendant::ref[@type='economy'])"/>
                            </text>
                            
                            <text x="{$xposR + 10}" y="{$ypos + 65}">
                                <xsl:value-of select="count(descendant::ref[@type='religion'])"/>
                            </text>
                            
                            <!--y-axis label -->
                            <text x="-100" y="{$ypos+30}" text-anchor="middle"><xsl:value-of select="@name"/></text>
                            
                        </xsl:for-each>
                    </g>
                </svg>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>