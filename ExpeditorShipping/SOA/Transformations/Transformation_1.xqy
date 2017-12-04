xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace shi="http://xmlns.oracle.com/pcbpel/adapter/db/top/ShipmentInfo";
(:: import schema at "../Schemas/ShipmentInfo_table.xsd" ::)

declare variable $ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection as element() (:: schema-element(shi:SbcExpeditorShipconfirmCollection) ::) external;

declare function local:funcTransformation_1($ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection as element() (:: schema-element(shi:SbcExpeditorShipconfirmCollection) ::)) 
                 as element() (:: element(*, shi:SbcExpeditorShipconfirmCollection) ::) 
{
    <shi:SbcExpeditorShipconfirmCollection>
        {
            for $SbcExpeditorShipconfirm in fn:distinct-values($ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection/shi:SbcExpeditorShipconfirm/shi:waybill)
            return 
            <shi:SbcExpeditorShipconfirm>
                {
                    if ($SbcExpeditorShipconfirm/shi:waybill)
                    then <shi:waybill>{fn:data($SbcExpeditorShipconfirm/shi:waybill)}</shi:waybill>
                    else ()
                }
                {
                    if ($SbcExpeditorShipconfirm/shi:trackingNumber)
                    then <shi:trackingNumber>{fn:data($SbcExpeditorShipconfirm/shi:trackingNumber)}</shi:trackingNumber>
                    else ()
                }
            </shi:SbcExpeditorShipconfirm>
        }
    </shi:SbcExpeditorShipconfirmCollection>
};

local:funcTransformation_1($ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection)
