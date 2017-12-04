xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace shi1="http://schema.ibd.specialized.com/pos/wing/shipment";
(:: import schema at "../Schemas/wingpos_updateShipment_request.xsd" ::)
declare namespace shi="http://xmlns.oracle.com/pcbpel/adapter/db/top/ShipmentInfo";
(:: import schema at "../Schemas/ShipmentInfo_table.xsd" ::)

declare variable $ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection as element() (:: schema-element(shi:SbcExpeditorShipconfirmCollection) ::) external;

declare function local:funcTransformshipmentrequest($ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection as element() (:: schema-element(shi:SbcExpeditorShipconfirmCollection) ::)) as element() (:: schema-element(shi1:ShipmentUpdateRequest) ::) {
    <shi1:ShipmentUpdateRequest/>
};

local:funcTransformshipmentrequest($ReceiveInput_InputVariable.SbcExpeditorShipconfirmCollection)
