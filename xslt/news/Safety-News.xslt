<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:if test="count(/ZoneList/Zone[position()=last()]/News) &gt;0">
			<div class="safety-5 pd-60">
				<div class="container">
					<h2 class="big-title">
						<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
					</h2>
					<div class="row safety-news" id="safety-news">
						<xsl:apply-templates select="/ZoneList/Zone[position()=last()]/News"></xsl:apply-templates>
					</div>
					<div class="row" id="safety-news-pagination"></div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-md-6">
			<div class="item">
				<time>
					<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
				</time>
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
				</h3>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>