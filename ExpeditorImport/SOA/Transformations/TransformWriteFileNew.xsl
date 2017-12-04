<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:tns="http://schema.ibd.specialized.com/pos/wing/order/file"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertOrdersNew"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/WingPOS/ExpeditorImport/InsertOrdersNew"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/ftp/WingPOS/ExpeditorImport/WriteFile">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/InsertOrdersNew.wsdl"/>
        <oracle-xsl-mapper:rootElement name="SbcExpeditorSentOlCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertOrdersNew"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/WriteFile.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Orders" namespace="http://schema.ibd.specialized.com/pos/wing/order/file"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JAN 26 20:33:54 PST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:Orders>
      <xsl:for-each select="/ns0:SbcExpeditorSentOlCollection/ns0:SbcExpeditorSentOl">
        <tns:Order>
          <!-- -->
          <xsl:variable name="sku"></xsl:variable>
          <xsl:variable name="apos">'</xsl:variable>
          <xsl:variable name="showNumQuery">
            <xsl:value-of select="concat(&quot;select line from dbwh_item_category_planning where item_number='&quot;,ns0:segment1,&quot;'&quot;)"/>
            <!--xsl:value-of select="'select line from dbwh_item_category_planning where inventory_item_id = 5666'"/-->
            <!--xsl:value-of select="concat(&quot;select line from dbwh_item_category_planning where item_number='&quot;,$sku,&quot;'&quot;)"/-->
          </xsl:variable>
          <xsl:if test="ns0:waybill">
            <tns:WAYBILL>
              <xsl:value-of select="ns0:waybill"/>
            </tns:WAYBILL>
          </xsl:if>
          <tns:LINE_NUMBER>
            <xsl:value-of select="ns0:orderLineNumber"/>
          </tns:LINE_NUMBER>
          <tns:INDUSTRY_STANDARD_COD>
            <xsl:value-of select="ns0:industryStandardCod"/>
          </tns:INDUSTRY_STANDARD_COD>
          <xsl:if test="ns0:segment1">
            <tns:SEGMENT1>
              <xsl:value-of select="ns0:segment1"/>
            </tns:SEGMENT1>
          </xsl:if>
          <tns:DESCRIPTION_JA>
            <xsl:value-of select="ns0:descriptionJa"/>
          </tns:DESCRIPTION_JA>
          <xsl:if test="ns0:quantity">
            <tns:QUANTITY>
              <xsl:value-of select="ns0:quantity"/>
            </tns:QUANTITY>
          </xsl:if>
          <tns:CUSTOMER_NUMBER>
            <xsl:value-of select="ns0:customerNumber"/>
          </tns:CUSTOMER_NUMBER>
          <tns:SHIP_TO_ORG_ID>
            <xsl:value-of select="ns0:shipToOrgId"/>
          </tns:SHIP_TO_ORG_ID>
          <tns:CUSTOMER_NAME>
            <xsl:value-of select="ns0:customerName"/>
          </tns:CUSTOMER_NAME>
          <xsl:if test="ns0:address1">
            <tns:SHIP_TO_ADDRESS1>
              <xsl:value-of select="ns0:address1"/>
            </tns:SHIP_TO_ADDRESS1>
          </xsl:if>
          <xsl:if test="ns0:address2">
            <tns:SHIP_TO_ADDRESS2>
              <xsl:value-of select="ns0:address2"/>
            </tns:SHIP_TO_ADDRESS2>
          </xsl:if>
          <xsl:if test="ns0:city">
            <tns:SHIP_TO_CITY>
              <xsl:value-of select="ns0:city"/>
            </tns:SHIP_TO_CITY>
          </xsl:if>
          <xsl:if test="ns0:state">
            <tns:SHIP_TO_STATE>
              <xsl:value-of select="ns0:state"/>
            </tns:SHIP_TO_STATE>
          </xsl:if>
          <tns:SHIP_TO_POSTAL_CODE>
            <xsl:value-of select="ns0:postalCode"/>
          </tns:SHIP_TO_POSTAL_CODE>
          <xsl:if test="ns0:country">
            <tns:SHIP_TO_COUNTRY>
              <xsl:value-of select="ns0:country"/>
            </tns:SHIP_TO_COUNTRY>
          </xsl:if>
          <tns:SHIP_TO_CONTACT>
            <xsl:value-of select="ns0:shipToContact"/>
          </tns:SHIP_TO_CONTACT>
          <tns:SHIP_TO_PHONE>
            <xsl:value-of select="ns0:shipToPhone"/>
          </tns:SHIP_TO_PHONE>
          <tns:SELLING_PRICE>
            <xsl:value-of select="format-number(ns0:sellingPrice,'#.####')"/>
          </tns:SELLING_PRICE>
          <tns:LIST_PRICE>
            <xsl:value-of select="format-number(ns0:listPrice,'#.####')"/>
          </tns:LIST_PRICE>
          <tns:LINE_TOTAL_AMOUNT>
            <xsl:value-of select="format-number(ns0:lineTotalAmount,'#.####')"/>
          </tns:LINE_TOTAL_AMOUNT>
          <tns:ORDER_TOTAL_AMOUNT>
            <xsl:value-of select="format-number(ns0:orderTotalAmount,'#.####')"/>
          </tns:ORDER_TOTAL_AMOUNT>
          <tns:CUST_PO_NUMBER>
            <xsl:value-of select="ns0:custPoNumber"/>
          </tns:CUST_PO_NUMBER>
          <tns:REQUEST_DATE>
            <!--xsl:value-of select='xp20:format-dateTime(ns0:requestDate,"[Y0001]/[M01]/[D01]")'/-->
            <xsl:value-of select="ns0:requestDate"/>
          </tns:REQUEST_DATE>
          <tns:PROMISED_DATE>
            <xsl:value-of select="ns0:promisedDate"/>
          </tns:PROMISED_DATE>
          <tns:HEADER_NOTE>
            <xsl:value-of select="concat (ns0:headerNote, ns0:lineNote )"/>
          </tns:HEADER_NOTE>
          <!--
          <tns:LINE_NOTE>
            <xsl:value-of select="ns0:lineNote"/>
          </tns:LINE_NOTE>
          -->
          <tns:ORDER_NUMBER>
            <xsl:value-of select="ns0:orderNumber"/>
          </tns:ORDER_NUMBER>
          <tns:ORDER_LINE_NUMBER>
            <xsl:value-of select="ns0:orderLineNumber"/>
          </tns:ORDER_LINE_NUMBER>
          <xsl:variable name="itmType">
            <xsl:value-of select="oraext:query-database($showNumQuery, false(), false(), 'jdbc/soaAppsDev')"/>
          </xsl:variable>
          <tns:ITEM_TYPE>
            <xsl:choose>
              <xsl:when test="not($itmType = 'B')">
                <xsl:value-of select='"E"'/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$itmType"/>
              </xsl:otherwise>
            </xsl:choose>
            <!--xsl:value-of select="oraext:query-database($showNumQuery, false(), false(), 'jdbc/soaAppsDev')"/-->
            <!--
            <xsl:choose>
            <xsl:when test="not(oraext:query-database($showNumQuery, false(), false(), 'jdbc/soaAppsDev')) = 'E'">
                <xsl:value-of select="E"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="oraext:query-database($showNumQuery, false(), false(), 'jdbc/soaAppsDev')"/>
            </xsl:otherwise>
            </xsl:choose>
            -->
          </tns:ITEM_TYPE>
          <tns:SHIP_METHOD>
            <!--xsl:value-of select="dvm:lookupValue('oramds:/apps/DVMs/WingShipMethod.dvm', 'Property',ns0:shipperCode, 'Value', 'TBD')"/-->
            <xsl:value-of select="ns0:shipMethod"/>
          </tns:SHIP_METHOD>
          <tns:ORDER_CLASS>
            <xsl:value-of select="ns0:orderClass"/>
          </tns:ORDER_CLASS>
          <tns:CUSTOMR_PHONE>
            <xsl:value-of select="ns0:customerPhone"/>
          </tns:CUSTOMR_PHONE>
          <tns:FREIGHT_AMOUNT>
            <xsl:value-of select='concat(format-number(ns0:freightAmount,"#.####")," ")'/>
          </tns:FREIGHT_AMOUNT>
        </tns:Order>
      </xsl:for-each>
    </tns:Orders>
  </xsl:template>
</xsl:stylesheet>
