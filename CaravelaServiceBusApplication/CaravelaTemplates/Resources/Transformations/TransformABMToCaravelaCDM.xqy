xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.novabase.pt/Caravela/Oracle/ProcessSelector";
(:: import schema at "../Schemas/ProcessSelector.xsd" ::)

declare namespace com = "http://www.novabase.pt/Caravela/Oracle/CDM/CommonTypes";

declare variable $ecid as xs:string external;
declare variable $processURI as xs:string external;
declare variable $integrationPattern as xs:string external;
declare variable $operation as xs:string external;
declare variable $source as xs:string external;
declare variable $target as xs:string external;
declare variable $traceDomain as xs:string external;
declare variable $traceProcess as xs:string external;
declare variable $traceStep as xs:string external;
declare variable $traceMessage as xs:string external;
declare variable $traceDomainFault as xs:string external;
declare variable $inputBody as element() external;

declare function local:TransformABMToCaravelaCDM($ecid as xs:string, 
                                                 $processURI as xs:string, 
                                                 $integrationPattern as xs:string, 
                                                 $operation as xs:string, 
                                                 $source as xs:string, 
                                                 $target as xs:string, 
                                                 $traceDomain as xs:string, 
                                                 $traceProcess as xs:string, 
                                                 $traceStep as xs:string, 
                                                 $traceMessage as xs:string, 
                                                 $traceDomainFault as xs:string, 
                                                 $inputBody as element()) 
                                                 as element() (:: schema-element(ns1:Request) ::) {
    <ns1:Request>
      <com:RequestCDM>
            <com:ecid>{fn:data($ecid)}</com:ecid>
            <com:processURI>{fn:data($processURI)}</com:processURI>
            <com:integrationPattern>{fn:data($integrationPattern)}</com:integrationPattern>
            <com:operation>{fn:data($operation)}</com:operation>
            <com:source>{fn:data($source)}</com:source>
            <com:target>{fn:data($target)}</com:target>
            <com:DomainTraceLog>
                <com:Domain>{fn:data($traceDomain)}</com:Domain>
                <com:Process>{fn:data($traceProcess)}</com:Process>
                <com:Step>{fn:data($traceStep)}</com:Step>
                <com:Message>{fn:data($traceMessage)}</com:Message>
                <com:DomainFault>{fn:data($traceDomainFault)}</com:DomainFault>
            </com:DomainTraceLog>
      </com:RequestCDM>
      <com:BusinessApplicationRequest>
        {fn:data($inputBody)}
      </com:BusinessApplicationRequest>
    </ns1:Request>
};

local:TransformABMToCaravelaCDM($ecid, $processURI, $integrationPattern, $operation, $source, $target, $traceDomain, $traceProcess, $traceStep, $traceMessage, $traceDomainFault, $inputBody)
