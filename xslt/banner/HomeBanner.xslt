<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/BannerList/Banner" mode="Video"></xsl:apply-templates>
				<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
			</div>
			<div class="scroll-down">
				<span class="lnr lnr-chevron-down"></span>
				<span>Scroll</span>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-navigation">
				<div class="swiper-prev-button">
					<span class="lnr lnr-chevron-left"></span>
				</div>
				<div class="swiper-next-button">
					<span class="lnr lnr-chevron-right"></span>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Banner" mode="Video">
		<xsl:if test="Title != ''">
			<div class="swiper-slide video-slide">
				<div class="video">
					<video autoplay="" muted="">
						<source src="/Data/Sites/1/media/video/BannerClip.mp4">
							<xsl:attribute name="src">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</xsl:attribute>
						</source>
					</video>
				</div>
				<xsl:if test="Description != ''">
					<div class="text">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
						</p>
					</div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Banner">
		<xsl:if test="Title = ''">
			<div class="swiper-slide">
				<div class="img">
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<xsl:if test="Description != ''">
					<div class="text">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
						</p>
					</div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>