<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name = "interval" select = "60"/>
    
    <xsl:template match = "/">
        <html>
            <head>
                <title>Numbers of References per Speech</title>
            </head>
            
            <body>
                <svg width="100%" height="100%">
                    <g transform="translate(250, 750)">
                        <text x="675" y="-550" text-anchor="middle">Numbers of References per Speech (War, Religion, Economy, Social, Diplomacy)</text>
                            
                        <!-- to do == flip names so they come from top, add numbers on top axis, fit all names on the graph-->
                        <!-- y-axis -->
                        <line x1="20" x2="20" y1="0" y2="-750" stroke="black" stroke-width="1"/>
                        <!-- x-axis (top) -->
                        <line x1="20" x2="450" y1="-750" y2="-750" stroke="black" stroke-width="1"/>
                        <!-- x-axis (bottom)-->
                        <line x1="20" x2="450" y1="0" y2="0" stroke="black" stroke-width="1"/>
                        
                        <!-- labels the x-axis (bottom) -->
                        <text x="5" y="20" text-anchor="middle">0</text>
                        <text x="65" y="20" text-anchor="middle">5</text>
                        <text x="125" y="20" text-anchor="middle">10</text>
                        <text x="185" y="20" text-anchor="middle">15</text>
                        <text x="245" y="20" text-anchor="middle">20</text>
                        <text x="305" y="20" text-anchor="middle">25</text>
                        <text x="365" y="20" text-anchor="middle">30</text>
                        <text x="425" y="20" text-anchor="middle">35</text>
                        
                        <!-- labels the x-axis (top) -->
                        <text x="5" y="20" text-anchor="middle">0</text>
                        <text x="65" y="20" text-anchor="middle">5</text>
                        <text x="125" y="20" text-anchor="middle">10</text>
                        <text x="185" y="20" text-anchor="middle">15</text>
                        <text x="245" y="20" text-anchor="middle">20</text>
                        <text x="305" y="20" text-anchor="middle">25</text>
                        <text x="365" y="20" text-anchor="middle">30</text>
                        <text x="425" y="20" text-anchor="middle">35</text>
                        
                        <!-- Instead stead of using xsl:apply-templates and creating another xsl:template match, we use xsl:for-each -->
                        <xsl:for-each select="//address">
                            <!-- Local variables -->
                            <xsl:variable name="ypos" select="position() * $interval"/>
                            <xsl:variable name="xpos" select="(count(descendant::ref[@type]) *6 )+20"/>
                            
                            <!--rz: bars-->
                            <line x1="20" x2="{$xpos + 20}" y1="-{$ypos}" y2="{-$ypos}" stroke="black" stroke-width="5"/>
                            
                            <!-- labels each circle (bar) with its count of Alice's speaches -->
                            <text x="{$xpos + 30}" y="{-$ypos - 3}">
                                <xsl:value-of select="count(descendant::ref[@type])"/>
                            </text>
                            
                            <!--y-axis label -->
                            <text x="-100" y="-{$ypos}" text-anchor="middle"><xsl:value-of select="@name"/></text>
                            
                        </xsl:for-each>
                    </g>
                </svg>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>