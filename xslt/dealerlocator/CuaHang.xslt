<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />
  <xsl:template match="/">

    <div class="row">
      <div class="col">
        <div class="filter-wrapper filter-dearler">
          <div class="select">
            <div class="select-show">Chọn Tỉnh/ Thành phố</div>
            <ul class="select-list select-list-province navbar-nav">
              <xsl:apply-templates select="/Dealers/Province" mode="Select" />
            </ul>
          </div>
          <div class="select">
            <div class="select-show">
              <xsl:text>Thương hiệu</xsl:text>
            </div>
            <ul class="select-list select-list-center navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#" data-id="-1">
                  <xsl:text>Thương hiệu</xsl:text>
                </a>
              </li>
              <xsl:apply-templates select="/Dealers/Center" mode="Select" />
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col ajaxresponsedealer">
        <xsl:apply-templates select="/Dealers/Center" />
      </div>
    </div>


    <div class="modal-wrapper">
      <div class="modal-container">
        <div class="row no-gutters">
          <div class="col">
            <div class="modal-title">
              <div class="title">
                <h2 id="dealerTitle">
                </h2>
              </div>
              <div class="modal-close">
                <em class="mdi mdi-close"></em>
              </div>
            </div>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-4">
            <figure>
              <div class="img">
                <img class="w-100"  id="dealerImage">
                </img>
              </div>
              <figcaption>
                <ul>
                  <li>
                    <em class="fas fa-map-marker-alt"></em>
                    <p id="dealerAddress">
                    </p>
                  </li>
                  <li>
                    <em class="fas fa-phone-volume"></em>
                    <p id="dealerPhone">
                    </p>
                  </li>
                  <li>
                    <em class="far fa-clock"></em>
                    <p id="dealerWebsite">
                    </p>
                  </li>
                  <li>
                    <em class="fas fa-car-alt"></em>
                    <p id="dealerDescription">
                    </p>
                  </li>
                </ul>
              </figcaption>
            </figure>
          </div>
          <div class="col-lg-8">
            <div class="map">
             <div id="map" style="width:100%;height:300px"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </xsl:template>
  <xsl:template match="Center">

    <div class="shop-list ">
      <div class="title">
        <h2>
          <!-- <xsl:text>Hệ thống cửa hàng </xsl:text> -->
          <span>
            <xsl:value-of select="Name" />
          </span>
        </h2>
      </div>
      <div class="list">
        <!--Minh Tâm note : Fix luôn 5 Area Không sửa mọi chi tiết liên hệ Tó Tâm-->
        <div class="list-item">
          <xsl:apply-templates select="/Dealers/Province[Area = 1]">
            <xsl:with-param name="Center" select="ID" />
          </xsl:apply-templates>

        </div>
        <div class="list-item">
          <xsl:apply-templates select="/Dealers/Province[Area = 2]">
            <xsl:with-param name="Center" select="ID" />
          </xsl:apply-templates>
        </div>
        <div class="list-item">
          <xsl:apply-templates select="/Dealers/Province[Area = 3]">
            <xsl:with-param name="Center" select="ID" />
          </xsl:apply-templates>
        </div>
        <div class="list-item">
          <xsl:apply-templates select="/Dealers/Province[Area = 4]">
            <xsl:with-param name="Center" select="ID" />
          </xsl:apply-templates>
        </div>
        <div class="list-item">
          <xsl:apply-templates select="/Dealers/Province[Area = 5]">
            <xsl:with-param name="Center" select="ID" />
          </xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Province">
    <xsl:param name="Center" />
    <div class="item">
      <h3 class="ct-name">
        <xsl:value-of select="Name" />
      </h3>
      <ul class="navbar-nav">
        <xsl:apply-templates select="/Dealers/Dealer">
          <xsl:with-param name="ItGuid" select="ItemGuid" />
          <xsl:with-param name="Center" select="$Center" />
        </xsl:apply-templates>
      </ul>
    </div>
  </xsl:template>
  <xsl:template match="Dealer">
    <xsl:param name="ItGuid" />
    <xsl:param name="Center" />
    <xsl:if test="ProvinceGuid = $ItGuid and  CenterID = $Center">
      <li class="nav-item">
        <a class="nav-link btn-dearler-modal" href="#">
          <xsl:attribute name="data-title">
            <xsl:value-of select="Title"/>
          </xsl:attribute>
          <xsl:attribute name="data-image">
            <xsl:value-of select="ImageUrl"/>
          </xsl:attribute>
          <xsl:attribute name="data-address">
            <xsl:value-of select="Address"/>
          </xsl:attribute>
          <xsl:attribute name="data-phone">
            <xsl:value-of select="Phone"/>
          </xsl:attribute>
          <xsl:attribute name="data-website">
            <xsl:value-of select="Website"/>
          </xsl:attribute>
          <xsl:attribute name="data-description">
            <xsl:value-of select="Description"/>
          </xsl:attribute>
          <xsl:attribute name="data-latitude">
            <xsl:value-of select="Latitude"/>
          </xsl:attribute>
          <xsl:attribute name="data-longitude">
            <xsl:value-of select="Longitude"/>
          </xsl:attribute>
          <xsl:value-of select="Title" />
        </a>
      </li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="Center" mode="Select">
    <li class="nav-item">
      <a class="nav-link" href="#">
        <xsl:attribute name="data-id">
          <xsl:value-of select="ID" />
        </xsl:attribute>
        <xsl:value-of select="Name" />
      </a>

    </li>
  </xsl:template>
  <xsl:template match="Center" mode="Selected">
    <xsl:if test="IsActive = 'true'">
      <xsl:value-of select="Name" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="Province" mode="Select">
    <li class="nav-item">
      <a class="nav-link" href="#">
        <xsl:attribute name="data-id">
          <xsl:value-of select="ItemID" />
        </xsl:attribute>
        <xsl:value-of select="Name" />
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>
