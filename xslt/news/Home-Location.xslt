<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<h2 class="small-title">
				<xsl:value-of disable-output-escaping="yes" select="/NewsList/ModuleTitle"></xsl:value-of>
			</h2>
			<div class="row no-gutters">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-sm-6 col-md-3">
			<article class="item">
				<a>
					<xsl:attribute name="data-src">
						<xsl:text disable-output-escaping="yes">#map_</xsl:text>
						<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-fancybox">
						<xsl:text disable-output-escaping="yes">h6_</xsl:text>
						<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
					</xsl:attribute>
					<div class="imgbox">
						<span class="home-6-imgbox">
							<xsl:attribute name="data-bg">
								<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<img class="lazyload">
								<xsl:attribute name="data-src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
							</img>
						</span>
					</div>
					<div class="info">
						<h4>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
						<p>
							<xsl:value-of disable-output-escaping="yes" select="FileUrl"></xsl:value-of>
						</p>
						<span class="viewmap" href="#">
							<span>View map</span>
							<span class="lnr lnr-arrow-right"></span>
						</span>
					</div>
				</a>
			</article>
			<div class="d-none">
				<div id="map_1">
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