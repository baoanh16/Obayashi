<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container career-detail pt-60">
			<div class="row">
				<div class="col-lg-8">
					<div class="content">
						<h2 class="small-title">
							<!-- <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/ZoneTitle"></xsl:value-of> -->
							Career
						</h2>
						<h1 class="big-title">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="full-content">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
						</div>
						<a class="main-button" href="#">
							<span>Apply for job</span>
							<span class="mdi mdi-arrow-right"></span>
						</a>
						<div class="form-apply">
							<iframe>
								<xsl:attribute name="src">
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/ApplyUrl"></xsl:value-of>
								</xsl:attribute>
							</iframe>
						</div>
					</div>
				</div>
				<div class="col-lg-1"></div>
				<xsl:if test="count(/NewsDetail/NewsOther) &gt; 0">
					<div class="col-lg-3">
						<div class="other-news">
							<h2 class="big-title">Other Jobs</h2>
							<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="item">
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
			<span><xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of></span>
		</div>
	</xsl:template>
</xsl:stylesheet>