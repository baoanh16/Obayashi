<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="nav-1 pd-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<!-- <h2 class="small-title">Our Award</h2><p class="big-title"><xsl:value-of disable-output-escaping="yes" select="/ZoneList/ZoneTitle"></xsl:value-of></p> -->
						<xsl:value-of disable-output-escaping="yes" select="/ZoneList/Description"></xsl:value-of>
					</div>
					<div class="col-lg-6">
						<nav class="row no-gutters">
							<xsl:apply-templates select="/ZoneList/Zone" mode="Link"></xsl:apply-templates>
						</nav>
						<select data-nav="">
							<xsl:apply-templates select="/ZoneList/Zone" mode="Select"></xsl:apply-templates>
						</select>
						<p style="margin-top: 30px">
							<xsl:value-of disable-output-escaping="yes" select="/ZoneList/SecondImageUrl"></xsl:value-of>
						</p>
						
					</div>
					<xsl:apply-templates select="/ZoneList/Zone" mode="Image"></xsl:apply-templates>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Link">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match="Zone" mode="Select">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Zone" mode="Image">
		<xsl:if test="IsActive='true'">
			<xsl:if test="ImageUrl != ''">
				<div class="col-12 pt-60">
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
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Caption">
		<xsl:if test="IsActive='true'">
			<xsl:if test="ImageUrl != ''">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="SecondImageUrl"></xsl:value-of>
				</p>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>