<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<xsl:if test="position()=1">
			<div class="history-1 pb-60">
				<div class="container">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-lg-6">
								<div class="full-content">
									<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</div>
							</div>
							<div class="col-lg-6">
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
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="history-2 pb-60">
				<div class="container">
					<div class="row pb-60">
						<xsl:apply-templates select="NewsImages" mode="News-2"></xsl:apply-templates>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="brief-content">
								<p>
									<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
								</p>
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="full-content">
								<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=3">
			<div class="history-3 pb-60">
				<div class="container">
					<div class="grid">
						<div class="grid-sizer"></div>
						<xsl:apply-templates select="NewsImages" mode="News-3"></xsl:apply-templates>
					</div>
					<div class="row pt-60">
						<div class="col-lg-6">
							<div class="brief-content">
								<p><xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of></p>
							</div>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="col-lg-6">
							<div class="full-content">
								<p><xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages" mode="News-2">
		<div class="col-sm-6">
			<div class="history-item">
				<div class="imgbox">
					<a>
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
					</a>
				</div>
				<div class="info">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h3>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages" mode="News-3">
		<div class="grid-item">
			<div class="history-item">
				<div class="imgbox">
					<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
					</a>
				</div>
				<div class="info">
					<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h3>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>