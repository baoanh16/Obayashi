<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="nav-3 pd-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<xsl:value-of disable-output-escaping="yes" select="/ZoneList/Description"></xsl:value-of>
					</div>
					<div class="col-lg-6">
						<div class="small-title" style="opacity: 0">.</div>
						<p>
							<xsl:value-of disable-output-escaping="yes" select="/ZoneList/SecondImageUrl"></xsl:value-of>
						</p>
					</div>
					<div class="col-12 pt-60">
						<div class="imgbox">
							<img class="lazyload">
								<xsl:attribute name="data-src">
									<xsl:value-of select="/ZoneList/ImageUrl"></xsl:value-of>
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
	</xsl:template>
</xsl:stylesheet>