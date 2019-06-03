<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<div class="row">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position()=1">
			<div class="col-lg-6" data-aos="fade-up-right">
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
			<div class="col-lg-6" data-aos="fade-up-left" data-aos-delay="100">
				<div class="textbox">
					<h2 class="small-title">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h2>
					<div class="heading">
						<p class="big-title">
							<xsl:value-of disable-output-escaping="yes" select="SecondImageUrl"></xsl:value-of>
						</p>
						<a class="main-button">
							<xsl:attribute name="href">
								<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
							</xsl:attribute>
							<span>View Career</span>
							<span class="mdi mdi-arrow-right"></span>
						</a>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>