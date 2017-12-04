xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ord="http://schema.ibd.specialized.com/pos/wing/order";
(:: import schema at "../Schemas/wingpos_order_response.xsd" ::)

declare namespace ins="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertOrdersNew";
(:: import schema at "../Schemas/InsertOrdersNew_table.xsd" ::)

declare namespace ora="http://schemas.oracle.com/xpath/extension";

declare namespace fn-bea="http://www.bea.com/xquery/xquery-functions";

declare variable $batchNum as xs:integer external;

declare variable $ordSts as xs:integer external;

declare variable $CallOrders_getOrderList_OutputVariable.reply as element() (:: schema-element(ord:OrderResponse) ::) external;

declare function local:funcInsertordersnew($batchNum as xs:integer
                                           ,$CallOrders_getOrderList_OutputVariable.reply as element() (:: schema-element(ord:OrderResponse) ::)
                                          )as element() (:: schema-element(ins:SbcExpeditorSentOlCollection) ::) 
{
    <ins:SbcExpeditorSentOlCollection>
    {
      for $Orders in $CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:Orders
         ,$OrderProducts at $ln_cnt in $CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:OrderProducts[ord:OMSOnlineOrderId = $Orders/ord:Id]
         
         let $mv :=fn:count($CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:OrderProducts[ord:OMSOnlineOrderId = $Orders/ord:Id])
         let $linecnt := fn:count($CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:OrderProducts/ord:OMSOnlineOrderId)
         
         let $sqlstring := concat('SELECT UPC FROM DBWH_ITEM_CATEGORY_PLANNING where item_number=''',fn:data($OrderProducts/ord:Sku),'''')
      return    
        <ins:SbcExpeditorSentOl>
            <ins:deliveryId>{fn:data($Orders/ord:Id)}</ins:deliveryId>
            <ins:deliveryDetailId>{fn:data($OrderProducts/ord:Id)}</ins:deliveryDetailId>
            <ins:sourceHeaderId>{fn:data($Orders/ord:Id)}</ins:sourceHeaderId>
            <ins:sourceLineId>{fn:data($OrderProducts/ord:Id)}</ins:sourceLineId>
            <ins:status>SENT</ins:status>
            <ins:creationDate>{fn:current-dateTime()}</ins:creationDate>
            <ins:createdBy>{fn:data($batchNum)}</ins:createdBy>
            <ins:lastUpdatedBy>{fn:data($batchNum)}</ins:lastUpdatedBy>
            <ins:lastUpdateDate>{fn:current-dateTime()}</ins:lastUpdateDate>
            <ins:batchNumber>{fn:data($batchNum)}</ins:batchNumber>
            <ins:countryCode>CN</ins:countryCode>
            <ins:shipToOrgId>{fn:concat(fn:data($Orders/ord:Id), fn:data($Orders/ord:Id))}</ins:shipToOrgId>
            <!--ins:shipToOrgId>{fn:concat(99999,fn:data($Orders/ord:OrderShopId))}</ins:shipToOrgId-->
            <!--ins:shipToOrgId>{fn:concat(fn:data($Orders/ord:Id),fn:data($Orders/ord:Id))}</ins:shipToOrgId-->
            <ins:invoiceToOrgId></ins:invoiceToOrgId>
            <ins:waybill>{fn:concat('T',fn:data($Orders/ord:Id))}</ins:waybill>
            <ins:waybillLineNr>{$ln_cnt}</ins:waybillLineNr>
            <ins:fileLines>{$linecnt}</ins:fileLines>
            <ins:lineNumber></ins:lineNumber>
            <ins:segment1>{fn:data($OrderProducts/ord:ProductCode)}</ins:segment1>
            <ins:descriptionJa>{fn:data($OrderProducts/ord:Title)}</ins:descriptionJa>
            <ins:industryStandardCod>{fn:data($OrderProducts/ord:Sku)}</ins:industryStandardCod>
            <ins:quantity>{fn:data($OrderProducts/ord:Num)}</ins:quantity>
            <ins:customerNumber>{fn:concat(99999,fn:data($Orders/ord:OrderShopId))}</ins:customerNumber>
            <ins:customerName>{fn:data($Orders/ord:ReceivName)}</ins:customerName>
            <ins:address1>{fn:data($Orders/ord:ReceivAddress)}</ins:address1>
            <ins:address2>{fn:data($Orders/ord:ReceivProvinceName)}</ins:address2>
            <ins:shipToContact>{fn:data($Orders/ord:UserNick)}</ins:shipToContact>
            <ins:shipToPhone>{fn:data($Orders/ord:ReceivMobile)}</ins:shipToPhone>
            <ins:postalCode>{fn:data($Orders/ord:ReceivZip)}</ins:postalCode>
            <ins:city>{fn:data($Orders/ord:ReceivCityName)}</ins:city>
            <ins:state>{fn:data($Orders/ord:ReceivAreaName)}</ins:state>
            <ins:country>CN</ins:country>
            <ins:sellingPrice>{fn:data($OrderProducts/ord:Price)}</ins:sellingPrice>
            <ins:listPrice>{fn:data($OrderProducts/ord:StandardPrice)}</ins:listPrice>
            <ins:lineTotalAmount>{fn:data($OrderProducts/ord:RealAmount)}</ins:lineTotalAmount>
            <ins:orderTotalAmount>{fn:data($Orders/ord:OrderAmount)}</ins:orderTotalAmount>
            <ins:codFlag>N</ins:codFlag>
            <ins:shipMethod>{fn:data($Orders/ord:ShipperCode)}</ins:shipMethod>
            <ins:customerVendorCode></ins:customerVendorCode>
            <ins:custPoNumber>{fn:data($Orders/ord:Id)}</ins:custPoNumber>
            <ins:descriptionUs>{fn:data($OrderProducts/ord:Title)}</ins:descriptionUs>
            <ins:requestDate>{fn:substring(fn:replace(fn:string($Orders/ord:OrderDate),'(\d{4})-(\d{2})-(\d{2})','$1/$2/$3'),1,10)}</ins:requestDate>
            <ins:promisedDate>{fn:substring(fn:replace(fn:string(fn:current-date()),'(\d{4})-(\d{2})-(\d{2})','$1/$2/$3'),1,10)}</ins:promisedDate>
            <ins:headerNote>{fn:data($Orders/ord:SellerMemo)}</ins:headerNote>
            <ins:lineNote>{fn:data($Orders/ord:BuyerMessage)}</ins:lineNote>
            <ins:format>WING</ins:format>
            <ins:lines></ins:lines>
            <ins:precision></ins:precision>
            <ins:shipToContactId></ins:shipToContactId>
            <ins:orderNumber>{fn:data($Orders/ord:Id)}</ins:orderNumber>
            <ins:orderLineNumber>{$ln_cnt}</ins:orderLineNumber>
            <ins:itemType></ins:itemType>
            <ins:alertSent></ins:alertSent>
            <ins:orderClass>TMALL</ins:orderClass>
            <ins:customerPhone>{fn:data($Orders/ord:ReceivPhone)}</ins:customerPhone>
            <ins:shipToName>{fn:data($Orders/ord:ShopTitle)}</ins:shipToName>
            <ins:freightAmount>{fn:data($Orders/ord:ShipAmount)}</ins:freightAmount>
        </ins:SbcExpeditorSentOl>
        }
    </ins:SbcExpeditorSentOlCollection>
};

local:funcInsertordersnew($batchNum,$CallOrders_getOrderList_OutputVariable.reply)
