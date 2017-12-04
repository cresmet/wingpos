xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ret="http://schema.ibd.specialized.com/pos/wing/return";
(:: import schema at "../Schemas/wingpos_return_order_response.xsd" ::)
declare namespace ins="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertReturnHeader";
(:: import schema at "../Schemas/InsertReturnHeader_table.xsd" ::)

declare variable $dossierNum as xs:integer external;
declare variable $InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::) external;

declare function local:funcInsertreturnheader($dossierNum as xs:integer
                                              ,$InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::)
                                             ) as element() (:: schema-element(ins:SbcCnExpeditorReturnHeaderCollection) ::) {
    <ins:SbcCnExpeditorReturnHeaderCollection>
        {
            for $ReturnOrders in $InvokeReturnOrders_OutputVariable.reply/ret:Rows/ret:ReturnOrders
            let $track := if(fn:string-length(fn:data($ReturnOrders/ret:Sid)) > 0) then fn:data($ReturnOrders/ret:Sid) else fn:data($ReturnOrders/ret:Id)
            return                        
            <ins:SbcCnExpeditorReturnHeader>
                <ins:dossierNumber>{fn:data($dossierNum)}</ins:dossierNumber>
                <ins:shipmentHeaderId>{fn:data($ReturnOrders/ret:Id)}</ins:shipmentHeaderId>
                <ins:shipmentNum>{fn:concat('R.',fn:data($ReturnOrders/ret:Id),fn:data($dossierNum))}</ins:shipmentNum>
                <ins:invoiceNum>{fn:data($ReturnOrders/ret:OriginalOrderNo)}</ins:invoiceNum>
                <ins:portName>TMALL</ins:portName>
                <ins:vesselName>WING</ins:vesselName>
                <!--ins:etdDate>{fn:substring(fn:replace(fn:string($ReturnOrders/ret:Created),'(\d{4})-(\d{2})-(\d{2})','$1/$2/$3'),1,10)}</ins:etdDate-->
                <ins:etdDate>{fn:concat(fn:substring(xs:string($ReturnOrders/ret:Created),1,10),'T',fn:substring(xs:string($ReturnOrders/ret:Created),12,8))}</ins:etdDate>
                <ins:freightBillNumber>{$track}</ins:freightBillNumber>                
                <!--ins:freightBillNumber>{fn:data($ReturnOrders/ret:Sid)}</ins:freightBillNumber-->
                <ins:comments>{fn:data($ReturnOrders/ret:ReceivName)}</ins:comments>
                <ins:lastUpdateDate>{fn:current-dateTime()}</ins:lastUpdateDate>
                <ins:creationDate>{fn:current-dateTime()}</ins:creationDate>
                <ins:createdBy>{fn:data($dossierNum)}</ins:createdBy>
                <ins:printedFlag>N</ins:printedFlag>
                <ins:lastUpdatedBy>{fn:data($dossierNum)}</ins:lastUpdatedBy>                
            </ins:SbcCnExpeditorReturnHeader>
        }
    </ins:SbcCnExpeditorReturnHeaderCollection>
};

local:funcInsertreturnheader($dossierNum,$InvokeReturnOrders_OutputVariable.reply)
