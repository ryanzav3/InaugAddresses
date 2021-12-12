<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name = "interval" select = "100"/>
    
    <xsl:template match = "/">
        <html>
            <head>
                <title>Length of References per Speech</title>
                <link rel="stylesheet" href="/InaugAddresses/html-css/index.css"/>
            </head>
            
            <body>
                <h1>Length of References per Speech (War, Religion, Economy, Social, Diplomacy)</h1>
                <svg width="150%" height="850%">
                    <g transform="translate(250, 50)">
                            
                        <!-- to do == flip names so they come from top, add numbers on top axis, fit all names on the graph-->
                        <!-- y-axis -->
                        <line x1="20" x2="20" y1="0" y2="{(59 * $interval) + 100}" stroke="black" stroke-width="1"/>
                        <!-- x-axis (bottom) -->
                        <line x1="20" x2="1400" y1="{(59 * $interval) + 100}" y2="{(59 * $interval) +100}" stroke="black" stroke-width="1"/>
                        <!-- x-axis (top)-->
                        <line x1="20" x2="1400" y1="0" y2="0" stroke="black" stroke-width="1"/>
                        
                        <!-- labels the x-axis (bottom) -->
                        <text x="20" y="{(59 * $interval) + 120}" text-anchor="middle">0 (Words Per Speech)</text>
                        <text x="150" y="{(59 * $interval) + 120}" text-anchor="middle">1000</text>
                        <text x="280" y="{(59 * $interval) + 120}" text-anchor="middle">2000</text>
                        <text x="410" y="{(59 * $interval) + 120}" text-anchor="middle">3000</text>
                        <text x="540" y="{(59 * $interval) + 120}" text-anchor="middle">4000</text>
                        <text x="670" y="{(59 * $interval) + 120}" text-anchor="middle">5000</text>
                        <text x="800" y="{(59 * $interval) + 120}" text-anchor="middle">6000</text>
                        <text x="930" y="{(59 * $interval) + 120}" text-anchor="middle">7000</text>
                        <text x="1060" y="{(59 * $interval) + 120}" text-anchor="middle">8000</text>
                        <text x="1190" y="{(59 * $interval) + 120}" text-anchor="middle">9000</text>
                        <text x="1320" y="{(59 * $interval) + 120}" text-anchor="middle">10000</text>
                        
                        <!-- labels the x-axis (top) -->
                        <text x="20" y="-10" text-anchor="middle">0 (Words Per Speech)</text>
                        <text x="150" y="-10" text-anchor="middle">1000</text>
                        <text x="280" y="-10" text-anchor="middle">2000</text>
                        <text x="410" y="-10" text-anchor="middle">3000</text>
                        <text x="540" y="-10" text-anchor="middle">4000</text>
                        <text x="670" y="-10" text-anchor="middle">5000</text>
                        <text x="800" y="-10" text-anchor="middle">6000</text>
                        <text x="930" y="-10" text-anchor="middle">7000</text>
                        <text x="1060" y="-10" text-anchor="middle">8000</text>
                        <text x="1190" y="-10" text-anchor="middle">9000</text>
                        <text x="1320" y="-10" text-anchor="middle">10000</text>
                        
                        <!-- Instead stead of using xsl:apply-templates and creating another xsl:template match, we use xsl:for-each -->
                        <xsl:for-each select="//address">
                            <!-- Local variables -->
                            <xsl:variable name="ypos" select="position() * $interval"/>
                            <xsl:variable name="xpos" select="(count(descendant::ref[@type]) *20 )+20"/>
                            
                            <xsl:variable name="xposW" select="string-length(normalize-space(string-join(descendant::ref[@type = 'war'])))*.125+20"/>
                            <xsl:variable name="xposS" select="string-length(normalize-space(string-join(descendant::ref[@type = 'social'])))*.125+20"/>
                            <xsl:variable name="xposD" select="string-length(normalize-space(string-join(descendant::ref[@type = 'diplomacy'])))*.125+20"/>
                            <xsl:variable name="xposE" select="string-length(normalize-space(string-join(descendant::ref[@type = 'economy'])))*.125+20"/>
                            <xsl:variable name="xposR" select="string-length(normalize-space(string-join(descendant::ref[@type = 'religion'])))*.125+20"/>
                            
                            <!--bars (war, social, economy, diplomacy, religion-->
                            <line x1="20" x2="{$xposW}" y1="{$ypos}" y2="{$ypos}" stroke="red" stroke-width="15"/>
                            <line x1="20" x2="{$xposS}" y1="{$ypos+15}" y2="{$ypos+15}" stroke="blue" stroke-width="15"/>
                            <line x1="20" x2="{$xposD}" y1="{$ypos+30}" y2="{$ypos+30}" stroke="green" stroke-width="15"/>
                            <line x1="20" x2="{$xposE}" y1="{$ypos+45}" y2="{$ypos+45}" stroke="orange" stroke-width="15"/>
                            <line x1="20" x2="{$xposR}" y1="{$ypos+60}" y2="{$ypos+60}" stroke="magenta" stroke-width="15"/>
                            
                            <!-- labels each bar with its count -->
                            <text x="{$xposW + 10}" y="{$ypos+5}">
                                 War: <xsl:value-of select="string-length(normalize-space(string-join(descendant::ref[@type = 'war'])))"/>
                            </text>
                            
                            <text x="{$xposS + 10}" y="{$ypos + 20}">
                                Social: <xsl:value-of select="string-length(normalize-space(string-join(descendant::ref[@type = 'social'])))"/>
                            </text>
                            
                            <text x="{$xposD + 10}" y="{$ypos+ 35}">
                                Diplomacy: <xsl:value-of select="string-length(normalize-space(string-join(descendant::ref[@type = 'diplomacy'])))"/>
                            </text>
                            
                            <text x="{$xposE + 10}" y="{$ypos + 50}">
                                Economy: <xsl:value-of select="string-length(normalize-space(string-join(descendant::ref[@type = 'economy'])))"/>
                            </text>
                            
                            <text x="{$xposR + 10}" y="{$ypos + 65}">
                                Relgion: <xsl:value-of select="string-length(normalize-space(string-join(descendant::ref[@type = 'religion'])))"/>
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