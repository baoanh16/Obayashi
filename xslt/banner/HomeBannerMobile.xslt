<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="home-banner-2">
			<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<xsl:if test="position()=1">
			<div class="imgbox">
				<xsl:attribute name="data-bg">
					<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<div class="caption">
					<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>