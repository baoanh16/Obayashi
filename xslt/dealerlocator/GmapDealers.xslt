<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <input type="hidden" id="hdnDealerLocatorSiteId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorLanguageId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectCountry">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectProvince">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectDistrict">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectZone">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorCulture">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/Culture"></xsl:value-of>
      </xsl:attribute>
    </input>
    <div style="display:none">
       <select class="form-select" id="ddlCountry"></select>
       <select class="form-select" id="ddlProvince">
          <option value="">
            <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
          </option>
        </select>
        <select class="form-select" id="ddlDistrict">
          <option value="">
            <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
          </option>
        </select>
         <input type="submit" id="edit-submit" class="btn-searchmap" style="display: none;">
            <xsl:attribute name="value">
              <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
            </xsl:attribute>
          </input>
           <input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
              <xsl:attribute name="placeholder">
                <xsl:value-of select="/DealerList/EnterLocationText"></xsl:value-of>
              </xsl:attribute>
            </input>
            <input type="submit" id="edit-submit" class="btn btn-large btn-primary">
              <xsl:attribute name="value">
                <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
              </xsl:attribute>
            </input>
            <input id="origin-direction" name="origin-direction" class="orides-txt" type="text" />
            <div id="results" class="dealer-list">
              <!--  <div id="ajax_msg" class="locate mrb15">
              </div> -->
              <ul class="noli list_system mrb15" style="display: block;" id="list">
              </ul>
            </div>
             <input type="hidden" id="distance" name="distance" value="1" />
    </div>
    <div class="container">
      <div class="row">
        <div class="col-12" id="dealer-map">
          <div id="map_canvas" class="map_system"></div>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
