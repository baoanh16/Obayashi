<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<div class="project-list">
				<div class="swiper-container">
					<div class="swiper-nav">
						<div class="btn-prev mdi mdi-arrow-left"></div>
						<div class="btn-next mdi mdi-arrow-right"></div>
					</div>
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="imgbox">
				<a>
					<xsl:attribute name="data-bg">
						<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="info">
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