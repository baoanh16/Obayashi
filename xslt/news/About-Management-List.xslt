<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container pb-60">
			<div class="row">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-sm-6 col-md-4 col-lg-3">
			<article class="manager-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">manage_</xsl:text>
							<xsl:text disable-output-escaping="yes">_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-src">
							<xsl:text disable-output-escaping="yes">#manage_</xsl:text>
							<xsl:text disable-output-escaping="yes">_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-bg">
							<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="href">
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
					</a>
				</div>
				<div class="info">
					<p>
						<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
					</p>
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
				</div>
				<div class="d-none">
					<div class="member-popup">
						<xsl:attribute name="id">
							<xsl:text disable-output-escaping="yes">manage_</xsl:text>
							<xsl:text disable-output-escaping="yes">_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
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
							<p>
								<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
							</p>
							<h3>
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h3>
						</div>
						<div class="brief-content">
							<p>
								<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
							</p>
						</div>
					</div>
				</div>
			</article>
		</div>
	</xsl:template>
</xsl:stylesheet>