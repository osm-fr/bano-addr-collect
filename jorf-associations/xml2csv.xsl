<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

   <xsl:strip-space elements="*"/>
   <xsl:output method="text" encoding="utf-8" />

   <xsl:template match="ANNONCE_REF">
     <xsl:value-of select="IDASSOC"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="IDENTIFIANT"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="TYPE"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="@datedeclaration"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="LIEU_DECLARATION"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="@cp"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="TITRE"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="ANCIEN_TITRE"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="NOUVEAU_TITRE"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="OBJET"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="NOUVEL_OBJET"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="ADDITIF_OBJET"/><xsl:text>&#x9;</xsl:text>

    <xsl:for-each select="THEMES/THEME">
      <xsl:value-of select="@code"/>
      <xsl:if test="not(position() = last())">
        <xsl:text>,</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>&#x9;</xsl:text>

     <xsl:value-of select="SIEGE_SOCIAL"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="INTERNET/@http"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="INTERNET/@smtp"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="/PARUTION_JO_ASSOCIATION/@dateparution"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="/PARUTION_JO_ASSOCIATION/@numparution"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="PAGES/@debut"/><xsl:text>&#x9;</xsl:text>
     <xsl:value-of select="PAGES/@fin"/><xsl:text>&#xA;</xsl:text>
   </xsl:template>

</xsl:stylesheet>

