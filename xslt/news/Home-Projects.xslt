<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates select="/NewsList/News" mode="Big">
				<xsl:with-param select="/NewsList/ModuleTitle" name="MTitle"></xsl:with-param>
			</xsl:apply-templates>
			<div class="row bottom-list">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Big">
		<xsl:param name="MTitle"></xsl:param>
		<xsl:if test="position()=1">
			<div class="row">
				<div class="col-lg-6">
					<div class="zone-info">
						<h2 class="small-title" data-aos="fade-up">
							<xsl:value-of disable-output-escaping="yes" select="$MTitle"></xsl:value-of>
						</h2>
						<p class="big-title" data-aos="fade-up" data-aos-delay="200">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</p>
						<a class="main-button" href="#" data-aos="fade-up" data-aos-delay="300">
							<xsl:attribute name="href">
								<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
							</xsl:attribute>
							<span>Our Projects</span>
							<span class="mdi mdi-arrow-right"></span>
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="project-item big" data-aos="fade-up" data-aos-delay="400">
						<article>
							<div class="imgbox">
								<a href="#">
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
								<span>Completed Projects</span>
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
									<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</article>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News">
		<xsl:if test="position()&gt;1">
			<div class="col-lg-4 col-md-6">
				<div class="project-item" data-aos="fade-up" data-aos-delay="400">
					<xsl:attribute name="data-aos-delay">
						<xsl:value-of disable-output-escaping="yes" select="(position()+2)*100"></xsl:value-of>
					</xsl:attribute>
					<article>
						<div class="imgbox">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
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
							<span>Completed Projects</span>
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
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							</h3>
						</div>
					</article>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>