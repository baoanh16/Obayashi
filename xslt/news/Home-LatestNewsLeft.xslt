<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="news-list" data-aos="fade-up-right">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="item">
			<time>
				<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
			</time>
			<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
				<span class="type-1">Internal News</span>
			</xsl:if>
			<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
				<span class="type-2">CSR</span>
			</xsl:if>
			<xsl:if test="floor(ShowOption div 4) mod 2 = 1">
				<span class="type-3">Safety</span>
			</xsl:if>
			<xsl:if test="floor(ShowOption div 8) mod 2 = 1">
				<span class="type-4">Design</span>
			</xsl:if>
			<div class="title">
				<h3>
					<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h3>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>