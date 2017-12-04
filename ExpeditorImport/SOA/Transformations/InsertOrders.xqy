xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ord="http://schema.ibd.specialized.com/pos/wing/order";
(:: import schema at "../Schemas/wingpos_order_response.xsd" ::)
declare namespace ins="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertOrders";
(:: import schema at "../Schemas/InsertOrders_table.xsd" ::)

declare namespace ora="http://schemas.oracle.com/xpath/extension";

declare namespace funcRBX="http://www.w3.org/2005/xquery-local-functions";

declare variable $batchNum as xs:integer external;

declare variable $CallOrders_getOrderList_OutputVariable.reply as element() (:: schema-element(ord:OrderResponse) ::) external;

declare function local:funcInsertorders($batchNum as xs:integer
                                       ,$CallOrders_getOrderList_OutputVariable.reply as element() (:: schema-element(ord:OrderResponse) ::)
                                       ) as element() (:: schema-element(ins:SbcExpeditorStgTblCollection) ::) 
{
    <ins:SbcExpeditorStgTblCollection>
    {
      for $Orders in $CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:Orders[ord:OrderStatus=4]
         ,$OrderProducts at $ln_cnt in $CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:OrderProducts[ord:OMSOnlineOrderId = $Orders/ord:Id]
         
         let $mv :=fn:count($CallOrders_getOrderList_OutputVariable.reply/ord:Rows/ord:OrderProducts[ord:OMSOnlineOrderId = $Orders/ord:Id])
         
         let $sqlstring := concat('SELECT UPC FROM DBWH_ITEM_CATEGORY_PLANNING where item_number=''',fn:data($OrderProducts/ord:Sku),'''')
      return
        <ins:SbcExpeditorStgTbl>
            <ins:batchNumber>{fn:data($batchNum)}</ins:batchNumber>
            <ins:transactionId>{fn:data($OrderProducts/ord:Id)}</ins:transactionId>
            <ins:orderNumber>{fn:data($Orders/ord:Id)}</ins:orderNumber>
            <ins:orderDate>{fn:concat(fn:substring(xs:string($Orders/ord:OrderDate),1,10),'T',fn:substring(xs:string($Orders/ord:OrderDate),12,8))}</ins:orderDate>            
            <ins:orderStatus>{fn:data($Orders/ord:OrderStatus)}</ins:orderStatus>
            <ins:orderLineId>{fn:data($OrderProducts/ord:Id)}</ins:orderLineId>
            <ins:orderLineNumber>{$ln_cnt}</ins:orderLineNumber>            
            <ins:item>{fn:data($OrderProducts/ord:Sku)}</ins:item>
            
            <ins:upcCode>{fn:data($OrderProducts/ord:Sku)}</ins:upcCode>
            
            <ins:itemDescription>{fn:data($OrderProducts/ord:Title)}</ins:itemDescription>
            <ins:orderLineQuantity>{fn:data($OrderProducts/ord:Num)}</ins:orderLineQuantity>
            <ins:skuSpec>{fn:data($OrderProducts/ord:SkuSpec)}</ins:skuSpec>
            <ins:productCode>{fn:data($OrderProducts/ord:ProductCode)}</ins:productCode>
            <ins:productWeight>{fn:data($OrderProducts/ord:StandardWeight)}</ins:productWeight>
            <ins:price>{fn:data($OrderProducts/ord:Price)}</ins:price>
            <ins:standardPrice>{fn:data($OrderProducts/ord:StandardPrice)}</ins:standardPrice>
            <ins:adjustAmount>{fn:data($OrderProducts/ord:AdjustAmount)}</ins:adjustAmount>
            <ins:discountAmount>{fn:data($OrderProducts/ord:DiscountAmount)}</ins:discountAmount>
            <ins:averageDiscount>{fn:data($OrderProducts/ord:AverageDiscount)}</ins:averageDiscount>
            <ins:lineTotalAmount>{fn:data($OrderProducts/ord:RealAmount)}</ins:lineTotalAmount>
            <ins:orderTotalAmount>{fn:data($Orders/ord:OrderAmount)}</ins:orderTotalAmount>
            <ins:refundid>{fn:data($OrderProducts/ord:RefundId)}</ins:refundid>
            <ins:refundStatus>{fn:data($OrderProducts/ord:RefundStatus)}</ins:refundStatus>
            <ins:refundQuantity>{fn:data($OrderProducts/ord:RefundQty)}</ins:refundQuantity>
            <ins:omsonlineorderid>{fn:data($OrderProducts/ord:OMSOnlineOrderId)}</ins:omsonlineorderid>
            <ins:orderShopName>{fn:data($Orders/ord:OrderShopName)}</ins:orderShopName>
            <ins:orderShopId>{fn:data($Orders/ord:OrderShopId)}</ins:orderShopId>
            <ins:status>NEW</ins:status>
            <ins:createdBy>{123}</ins:createdBy>
            <ins:creationDate>{fn:current-dateTime()}</ins:creationDate>
            <ins:lastUpdatedBy>123</ins:lastUpdatedBy>
            <ins:lastUpdateDate>{fn:current-dateTime()}</ins:lastUpdateDate>            
            <ins:shipperId>{fn:data($Orders/ord:ShipperId)}</ins:shipperId>
            <ins:logisticsNumber>{fn:data($Orders/ord:LogisticsNumber)}</ins:logisticsNumber>
            
            <ins:shipperName>{fn:data($Orders/ord:ShipperName)}</ins:shipperName>
            
            <ins:shipperCode>{fn:data($Orders/ord:ShipperCode)}</ins:shipperCode>
            <ins:shortAddress>{fn:data($Orders/ord:ShortAddress)}</ins:shortAddress>
            <ins:customerName>{fn:data($Orders/ord:ReceivName)}</ins:customerName>
            <ins:customerAddress>{fn:data($Orders/ord:ReceivAddress)}</ins:customerAddress>
            <ins:customerAreaName>{fn:data($Orders/ord:ReceivAreaName)}</ins:customerAreaName>
            <ins:customerCityName>{fn:data($Orders/ord:ReceivCityName)}</ins:customerCityName>
            <ins:customerProvinceName>{fn:data($Orders/ord:ReceivProvinceName)}</ins:customerProvinceName>
            <ins:customerZip>{fn:data($Orders/ord:ReceivZip)}</ins:customerZip>
            <ins:customerPhone>{fn:data($Orders/ord:ReceivPhone)}</ins:customerPhone>
            <ins:customerMobile>{fn:data($Orders/ord:ReceivMobile)}</ins:customerMobile>
            <ins:productAmount>{fn:data($Orders/ord:ProductAmount)}</ins:productAmount>
            <ins:receivedAmount>{fn:data($Orders/ord:ReceivedAmount)}</ins:receivedAmount>
            <ins:shipAmount>{fn:data($Orders/ord:ShipAmount)}</ins:shipAmount>
            <ins:codAmount>{fn:data($Orders/ord:CodAmount)}</ins:codAmount>
            <ins:payType>{fn:data($Orders/ord:PayType)}</ins:payType>
            <ins:platform>{fn:data($Orders/ord:PlatForm)}</ins:platform>
            <ins:modifiedDate>{fn:concat(fn:substring(xs:string($Orders/ord:ModifiedDate),1,10),'T',fn:substring(xs:string($Orders/ord:ModifiedDate),12,8))}</ins:modifiedDate>
            <!--<ins:modifierid>{fn:data($Orders/ord:ModifierId)}</ins:modifierid>-->
            <ins:buyerMessage>{fn:data($Orders/ord:BuyerMessage)}</ins:buyerMessage>
            <ins:sellerMemo>{fn:data($Orders/ord:SellerMemo)}</ins:sellerMemo>
            <ins:insideRemark>{fn:data($Orders/ord:InSideRemark)}</ins:insideRemark>
            <ins:invoiceHeader>{fn:data($Orders/ord:InvoiceHeader)}</ins:invoiceHeader>
            <ins:invoiceContent>{fn:data($Orders/ord:InvoiceContent)}</ins:invoiceContent>
            <ins:presaleStatus>{fn:data($Orders/ord:PreSaleStatus)}</ins:presaleStatus>
            <ins:auditTime>{fn:concat(fn:substring(xs:string($Orders/ord:AuditTime),1,10),'T',fn:substring(xs:string($Orders/ord:AuditTime),12,8))}</ins:auditTime>
            <ins:extendText>{fn:data($Orders/ord:ExtendText)}</ins:extendText>
            <ins:drpstorename>{fn:data($Orders/ord:DrpStoreName)}</ins:drpstorename>
            <ins:shoptitle>{fn:data($Orders/ord:ShopTitle)}</ins:shoptitle>
            <ins:sendstoreCode>{fn:data($Orders/ord:SendStoreCode)}</ins:sendstoreCode>                      
        </ins:SbcExpeditorStgTbl>
        }
    </ins:SbcExpeditorStgTblCollection>
};

local:funcInsertorders($batchNum,$CallOrders_getOrderList_OutputVariable.reply)
