<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/ZoneList/Zone/Zone/Zone" mode="first"/>
  </xsl:template>
  <xsl:template match="Zone" mode="first">
    <div class="container">
      <h2 class="big-title">
        <xsl:value-of select="Title" disable-output-escaping="yes"/>
      </h2>
      <div class="row">
        <xsl:apply-templates select="Zone" mode="second"/>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="Zone" mode="second">
    <div class="col-lg-3 col-6">
      <h4 class="small-title">
        <xsl:value-of select="Title" disable-output-escaping="yes"/>
      </h4>
      <nav>
        <xsl:apply-templates select="Zone" mode="third"/>
      </nav>
    </div>
  </xsl:template>
  <xsl:template match="Zone" mode="third">
    <a href="#" class="btn-loadmap">
      <xsl:attribute name="data-id">
        <xsl:value-of select="ZoneId"></xsl:value-of>
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="Title"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
    </a>
  </xsl:template>
</xsl:stylesheet>
