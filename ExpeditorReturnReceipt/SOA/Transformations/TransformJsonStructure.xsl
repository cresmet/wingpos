<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ReceiptDetalsDB"
                xmlns:tns="http://schema.ibd.specialized.com/pos/wing/return"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/WingPOS/ExpeditorReturnReceipt/ReceiptDetalsDB"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:client="http://xmlns.oracle.com/WingPOS/ExpeditorReturnReceipt/UpdateReturnOrders"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ReceiptDetalsDB.wsdl"/>
        <oracle-xsl-mapper:rootElement name="OutputParameters"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ReceiptDetalsDB"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/UpdateReturnOrders.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Root-Element"
                                       namespace="http://schema.ibd.specialized.com/pos/wing/return"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JUL 20 09:35:26 PDT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:Root-Element>
      <tns:OriginalOrderNo>
        <xsl:value-of select="/ns0:OutputParameters/ns0:P_OUTSTR/ns0:ORIGINALORDERNO"/>
      </tns:OriginalOrderNo>
      <xsl:for-each select="/ns0:OutputParameters/ns0:P_OUTSTR/ns0:OMSSTORAGEINPRODUCT/ns0:OMSSTORAGEINPRODUCT_ITEM">
        <tns:OMSStorageInProduct>
          <tns:Num>
            <xsl:value-of select="ns0:NUM"/>
          </tns:Num>
          <tns:ROWSTATUS>
            <xsl:value-of select="ns0:ROWSTATUS"/>
          </tns:ROWSTATUS>
          <tns:Sku>
            <xsl:value-of select="ns0:SKU"/>
          </tns:Sku>
        </tns:OMSStorageInProduct>
      </xsl:for-each>
      <tns:IESStoreId>
        <xsl:value-of select="/ns0:OutputParameters/ns0:P_OUTSTR/ns0:IESSTOREID"/>
      </tns:IESStoreId>
      <tns:ROWSTATUS>
        <xsl:value-of select="/ns0:OutputParameters/ns0:P_OUTSTR/ns0:ROWSTATUS"/>
      </tns:ROWSTATUS>
      <tns:OMSRefundOrderId>
        <xsl:value-of select="/ns0:OutputParameters/ns0:P_OUTSTR/ns0:OMSREFUNDORDERID"/>
      </tns:OMSRefundOrderId>
    </tns:Root-Element>
  </xsl:template>
</xsl:stylesheet>
