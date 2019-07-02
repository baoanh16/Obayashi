<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position()=1">
			<div class="safety-1 pb-60">
				<div class="container">
					<xsl:apply-templates select="News" mode="Zone-News-1"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="safety-2 pb-60">
				<div class="container">
					<xsl:apply-templates select="News" mode="Zone-News-2"></xsl:apply-templates>
				</div>
			</div>
			<div class="safety-3" data-bg="/Data/Sites/1/media/img/safety/1.jpg"></div>
		</xsl:if>
		<xsl:if test="position()=3">
			<div class="safety-4 pt-60">
				<div class="container">
					<xsl:apply-templates select="News" mode="Zone-News-3"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=4 and count(News) &gt; 0">
			<div class="safety-5 pt-60">
				<div class="container">
					<h2 class="big-title">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h2>
					<div class="row manager-list">
						<xsl:apply-templates select="News" mode="Zone-News-4"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</xsl:if>
		<!-- <xsl:if test="position()=5 and count(News) &gt; 0"><div class="safety-5 pd-60"><div class="container"><h2 class="big-title"><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h2><div class="row"><xsl:apply-templates select="News" mode="Zone-News-5"></xsl:apply-templates></div></div></div></xsl:if> -->
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-1">
		<div class="row">
			<div class="col-12 pb-60">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="col-md-6">
				<h2 class="big-title">
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="col-md-6 textbox">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</p>
			</div>
		</div>
		<div class="row pt-60">
			<xsl:apply-templates select="NewsImages" mode="Zone1"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-2">
		<h3 class="big-title">
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</h3>
		<div class="row">
			<div class="col-md-6">
				<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			</div>
			<div class="col-md-6">
				<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-3">
		<div class="row">
			<div class="col-md-6">
				<h3 class="big-title">
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h3>
			</div>
			<div class="col-md-6 textbox">
				<p>
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</p>
			</div>
		</div>
		<xsl:choose>
			<xsl:when test="count(NewsImages) &gt; 0 and count(NewsImages) &lt; 3">
				<div class="row image-list pt-60">
					<xsl:apply-templates select="NewsImages" mode="Zone3"></xsl:apply-templates>
				</div>
			</xsl:when>
			<xsl:when test="count(NewsImages) &gt; 2">
				<div class="row image-list pt-60">
					<xsl:apply-templates select="NewsImages" mode="Zone3_3"></xsl:apply-templates>
				</div>
			</xsl:when>
		</xsl:choose>
		<!-- <xsl:if test="count(NewsImages) &gt; 0"><div class="row image-list pt-60"><xsl:apply-templates select="NewsImages" mode="Zone3"></xsl:apply-templates></div></xsl:if> -->
		<div class="row">
			<div class="col-12 pt-60">
				<div class="video">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-4">
		<xsl:if test="position() &lt; 9">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Zone-News-5">
		<xsl:if test="position() &lt; 9">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages" mode="Zone1">
		<xsl:if test="position()&gt;1">
			<div class="col-md-6">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages" mode="Zone3">
		<div class="col-sm-6">
			<article class="certificate-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">safety_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
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
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h3>
				</div>
			</article>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages" mode="Zone3_3">
		<div class="col-sm-6 col-lg-4">
			<article class="certificate-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">safety_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
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
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h3>
				</div>
			</article>
		</div>
	</xsl:template>
</xsl:stylesheet>