xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ret="http://schema.ibd.specialized.com/pos/wing/return";
(:: import schema at "../Schemas/wingpos_return_order_response.xsd" ::)
declare namespace fil="http://schema.ibd.specialized.com/pos/wing/return/file";
(:: import schema at "../Schemas/nxsd_return_order_file.xsd" ::)

declare variable $batchNum as xs:integer external;

declare variable $InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::) external;

declare function local:funcTransformwritefile($batchNum as xs:integer
                                            ,$InvokeReturnOrders_OutputVariable.reply as element() (:: schema-element(ret:ReturnOrderResponse) ::)
                                             ) as element() (:: schema-element(fil:ReturnOrderFile) ::) 
    {
    <fil:ReturnOrderFile>
        {
            for $ReturnOrderProducts in $InvokeReturnOrders_OutputVariable.reply/ret:Rows/ret:ReturnOrderProducts
               ,$ReturnOrders at $ln_cnt in $InvokeReturnOrders_OutputVariable.reply/ret:Rows/ret:ReturnOrders[ret:Id = $ReturnOrderProducts/ret:OMSRefundOrderId]
            let $nl := "&#13;&#10;"
            let $string := fn:concat(1,$nl)
            return 
                <fil:Orders>                
                <fil:ShipmentNumber>{fn:concat('B2CRETURN.',$batchNum)}</fil:ShipmentNumber>
                <fil:LineNumber>{$ln_cnt}</fil:LineNumber>
                <fil:SupplierName>{fn:data($ReturnOrders/ret:ReceivName)}</fil:SupplierName>
                <fil:ContainerNumber>B2CRETURN</fil:ContainerNumber>
                <fil:ItemNumber>{fn:data($ReturnOrderProducts/ret:ProductCode)}</fil:ItemNumber>
                <!--fil:ExpectedReceiptDate>{fn:substring(fn:replace(fn:string($ReturnOrderProducts/ret:CreationDate),'(\d{4})-(\d{2})-(\d{2})','$3-$2-$1'),1,10)}</fil:ExpectedReceiptDate-->
                <fil:ExpectedReceiptDate>{fn:substring(fn:replace(fn:string($ReturnOrderProducts/ret:CreationDate),'\d{2}(\d{2})-(\d{2})-(\d{2})','$3-$2-$1'),1,10)}</fil:ExpectedReceiptDate>
                <fil:QuantityExpected>{fn:data($ReturnOrderProducts/ret:Num)}</fil:QuantityExpected>
                <fil:PurchaseOrder>{fn:data($ReturnOrders/ret:OriginalOrderNo)}</fil:PurchaseOrder>
                <fil:PurchaseOrderLine>1</fil:PurchaseOrderLine>
                </fil:Orders>
        }
    </fil:ReturnOrderFile>
};

local:funcTransformwritefile($batchNum,$InvokeReturnOrders_OutputVariable.reply)
