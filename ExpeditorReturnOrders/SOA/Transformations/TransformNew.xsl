<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://ibd.specialized.com/WingPOS/ExpeditorReturnOrders"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:tns="http://schema.ibd.specialized.com/pos/wing/return"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/WingPOS/ExpeditorReturnOrders/ReturnOrders">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ExpeditorReturnOrderProcess.wsdl"/>
        <oracle-xsl-mapper:rootElement name="process"
                                       namespace="http://ibd.specialized.com/WingPOS/ExpeditorReturnOrders"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ReturnOrders.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ReturnOrderRequest"
                                       namespace="http://schema.ibd.specialized.com/pos/wing/return"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAY 25 14:24:08 PDT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ReturnOrderRequest>
          <xsl:variable name="getCNTime">
            <xsl:value-of select="concat(&quot;select sbcfnd_util_pkg.sbc_get_local_time(sysdate,concat(&quot;'&quot;,Asia/Shanghai,&quot;'&quot;) from dual)"/>
            <!--xsl:value-of select="'select line from dbwh_item_category_planning where inventory_item_id = 5666'"/-->
            <!--xsl:value-of select="concat(&quot;select line from dbwh_item_category_planning where item_number='&quot;,$sku,&quot;'&quot;)"/-->
          </xsl:variable>    
      <tns:APP_KEY>
        <xsl:value-of select="&quot;service&quot;"/>
      </tns:APP_KEY>
      <tns:ENDDATE>
        <xsl:value-of select="xp20:current-dateTime ( )"/>
      </tns:ENDDATE>
      <tns:FIELDS>
        <xsl:value-of select="dvm:lookupValue('oramds:/apps/DVMs/WingReturnOrders.dvm','Property','fields','Value','TBD')"/>
      </tns:FIELDS>
      <tns:METHOD>
        <xsl:value-of select="dvm:lookupValue('oramds:/apps/DVMs/WingReturnOrders.dvm','Property','method','Value','TBD')"/>
      </tns:METHOD>
      <tns:STATUS>
        <xsl:value-of select="&quot;10&quot;"/>
      </tns:STATUS>
      <tns:STARTDATE>
        <xsl:value-of select="oraext:query-database($getCNTime, false(), false(), 'jdbc/soaAppsDev')"/>
      </tns:STARTDATE>
      <tns:TIMESTAMP>
        <xsl:value-of select="xp20:current-dateTime ( )"/>
      </tns:TIMESTAMP>
      <tns:V>
        <xsl:value-of select="dvm:lookupValue('oramds:/apps/DVMs/WingReturnOrders.dvm','Property','version','Value','TBD')"/>
      </tns:V>
      <tns:REFUNDORDERID>
        <xsl:value-of select="/ns0:process/ns0:RefundOrderID"/>
      </tns:REFUNDORDERID>
    </tns:ReturnOrderRequest>
  </xsl:template>
</xsl:stylesheet>