<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="row item">
			<div class="col-md-6 title">
				<h3>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h3>
			</div>
			<div class="col-md-6 info">
				<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				<p>
					<sppan class="mdi mdi-map"></sppan>
					<a class="btn-viewmap" data-src="#map_1">
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">map_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-src">
							<xsl:text disable-output-escaping="yes">#map_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<xsl:text disable-output-escaping="yes">View map</xsl:text>
					</a>
				</p>
			</div>
			<div class="col-12 d-none">
				<div class="viewmap-popup">
					<xsl:attribute name="id">
						<xsl:text disable-output-escaping="yes">map_</xsl:text>
						<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>