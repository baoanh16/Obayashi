<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<div class="company-information pb-60">
				<xsl:apply-templates select="/NewsList/News" mode="Info"></xsl:apply-templates>
			</div>
			<div class="our-location pb-60">
				<xsl:apply-templates select="/NewsList/News" mode="Location"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Info">
		<xsl:if test="position()=1">
			<div class="row">
				<xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div class="row">
				<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Location">
		<xsl:if test="position()&gt;1">
			<div class="row item">
				<div class="col-md-6 title">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<h4>
						<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
					</h4>
				</div>
				<div class="col-md-6 info">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<xsl:if test="position()=1 or position()=5">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-md-6"&gt;</xsl:text>
		</xsl:if>
		<div class="item">
			<div class="title">
				<h3>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</h3>
			</div>
			<div class="content">
					<xsl:if test="position()=1">
						<xsl:attribute name="style">
							<xsl:text disable-output-escaping="yes">color: #00933a</xsl:text>
						</xsl:attribute>
					</xsl:if>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</div>
		</div>
		<xsl:if test="position()=4 or position() = last()">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages">
		<div class="col-md-6">
			<div class="imgbox">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>