xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ret="http://schema.ibd.specialized.com/pos/wing/return";
(:: import schema at "../Schemas/wingpos_return_order_response.xsd" ::)
declare namespace ins="http://xmlns.oracle.com/pcbpel/adapter/db/top/InsertReturnDetail";
(:: import schema at "../Schemas/InsertReturnDetail_table.xsd" ::)

declare variable $dossierNum as xs:integer external;
declare variable $InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::) external;

declare function local:funcInserreturndetail($dossierNum as xs:integer
                                            ,$InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::)
                                            ) as element() (:: schema-element(ins:SbcCnPoOutboundDetailCollection) ::)
{
    <ins:SbcCnPoOutboundDetailCollection>
        {
            
            for $ReturnOrders in $InvokeReturnOrders_OutputVariable.reply/ret:Rows/ret:ReturnOrders
            return 
                for $ReturnOrderProducts in $InvokeReturnOrders_OutputVariable.reply/ret:Rows/ret:ReturnOrderProducts[ret:OMSRefundOrderId = $ReturnOrders/ret:Id]
                return                 
                <ins:SbcCnPoOutboundDetail>
                    <ins:dossierNumber>{fn:data($dossierNum)}</ins:dossierNumber>
                    <ins:shipmentHeaderId>{fn:data($ReturnOrderProducts/ret:OMSRefundOrderId)}</ins:shipmentHeaderId>
                    <ins:lineNumber>{fn:data($ReturnOrderProducts/ret:Id)}</ins:lineNumber>
                    <ins:itemNum>{fn:data($ReturnOrderProducts/ret:ProductCode)}</ins:itemNum>
                    <ins:quantity>{fn:data($ReturnOrderProducts/ret:Num)}</ins:quantity>
                    <ins:comments>{fn:data($ReturnOrderProducts/ret:Sku)}</ins:comments>
                    <ins:lastUpdateDate>{fn:current-date()}</ins:lastUpdateDate>
                    <ins:creationDate>{fn:current-date()}</ins:creationDate>
                    <ins:createdBy>{fn:data($dossierNum)}</ins:createdBy>
                    <ins:lastUpdatedBy>{fn:data($dossierNum)}</ins:lastUpdatedBy>
                </ins:SbcCnPoOutboundDetail>
        }
    </ins:SbcCnPoOutboundDetailCollection>
};

local:funcInserreturndetail($dossierNum,$InvokeReturnOrders_OutputVariable.reply)
