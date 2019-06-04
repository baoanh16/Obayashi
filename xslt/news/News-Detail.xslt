<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="news-detail container">
			<div class="row">
				<div class="col-lg-8">
					<div class="content">
						<time>
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/CreatedDate"></xsl:value-of>
						</time>
						<xsl:if test="floor(/NewsDetail/ShowOption div 1) mod 2 = 1">
							<span class="type-1">Internal News</span>
						</xsl:if>
						<xsl:if test="floor(/NewsDetail/ShowOption div 2) mod 2 = 1">
							<span class="type-2">CSR</span>
						</xsl:if>
						<xsl:if test="floor(/NewsDetail/ShowOption div 4) mod 2 = 1">
							<span class="type-3">Safety</span>
						</xsl:if>
						<xsl:if test="floor(/NewsDetail/ShowOption div 8) mod 2 = 1">
							<span class="type-4">Design</span>
						</xsl:if>
						<h1 class="big-title">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="full-content">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
						</div>
						<div class="social-share">
							<a href="#">
								<xsl:attribute name="href">
									<xsl:text disable-output-escaping="yes">https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Sites/1/skins/default/img/fb.jpg" alt="" />
							</a>
							<a href="#">
								<xsl:attribute name="href">
									<xsl:text disable-output-escaping="yes">https://twitter.com/home?status=</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Sites/1/skins/default/img/twt.jpg" alt="" />
							</a>
							<a href="#">
								<xsl:attribute name="href">
									<xsl:text disable-output-escaping="yes">https://pinterest.com/pin/create/button/?url=&amp;media=&amp;description=</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Sites/1/skins/default/img/pin.jpg" alt="" />
							</a>
							<a href="#">
								<img src="/Data/Sites/1/skins/default/img/mail.jpg" alt="" />
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg"></div>
				<xsl:if test="count(/NewsDetail/NewsOther) &gt; 0">
					<div class="col-lg-3">
						<div class="other-news">
							<h2 class="big-title">Latest news</h2>
							<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
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
	</xsl:template>
</xsl:stylesheet>