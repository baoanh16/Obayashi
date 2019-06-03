<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<h2 data-aos="zoom-in" data-aos-delay="100">
				<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
			</h2>
			<div class="row">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
				<xsl:apply-templates select="/ZoneList/Zone" mode="About"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position()&gt;1">
			<div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
				<div class="service-item">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<article>
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
							<div class="info">
								<h3>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h3>
								<div class="description">
									<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
								</div>
							</div>
						</article>
					</a>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="About">
		<xsl:if test="position()=1">
			<div class="col-12">
				<a class="main-button">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<span>About Us</span>
					<span class="mdi mdi-arrow-right"></span>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>