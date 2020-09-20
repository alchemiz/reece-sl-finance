<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:a="http://reece.com.au/2010/integration/1">
<xsl:output method="html" indent="yes"/>
<xsl:template name="format_date">
    <xsl:param name="date"/>
    <xsl:choose>
        <xsl:when test="string-length($date) = 8">
            <xsl:value-of select="concat(substring($date,7,2),'/',substring($date,5,2),'/',substring($date,1,4))"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="'&#160;'"/>
        <xsl:otherwise>
    </xsl:choose>
</xsl:template>
<xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;&#xd;</xsl:text>
    <html>
        <head>
            <style>
                @media print
                {	
                    thead { font-size: 10px; font-weight: normal; display: table-header-group; }
                    tbody { font-size: 10px; font-weight: normal; display: table-row-group; page-break-inside: auto; }
                    tfoot { font-size: 10px; font-weight: normal; display: table-footer-group; }
                    .dataview thead th, .dataview tbody th,tr,.dataview tfoot th { padding: 0px 0px 0px 0px; }
                    body { margin: 0px; padding: 0px; height: 800px; width: 1056px; }
                }

                html, body{ width: 1056px; height: 100%; padding: 1px; margin: 0px }

                body{ font-family: Courier New, sans-serif; font-size: 12px; font-weight: normal; overflow-y: auto; overflow-x: hidden; }

                .wrapper { height: 95%; width: 1050; min-height: 700px; position: relative; }

                .container { height: 100%; border: 1px solid red; box-sizing:border-box; }

                .dataview{ table-layout: fixed; empty-cells: show; border-collapse: collapse; border-spacing: 0px; }

                .dataview thead { position: relative; top: 0px; }

                .dataview thead th,
                .dataview tbody th,tr,
                .dataview tfoot th { padding: 2px 0px 2px 0px; }

                .dataview thead th.column-name,
                .dataview tbody th.column-name{ color: red; border-right: 1px solid red; text-align: center; }

                .dataview thead th.column-name-no-border,
                .dataview tbody th.column-name-no-border{ color: red; text-align: center; }

                .dataview tbody td.left{ text-align: left; padding-left: 12px; }

                .dataview tbody td.right{ text-align: right; padding-right: 12px; }

                .dataview tbody td.center{ text-align: center; }

                .dataview tfoot { position: absolute; bottom: 0px; } 
                
                .dataview#edi-invoice thead{ border-bottom-style: none; }

                .dataview#edi-invoice tbody{ border-top-style: none; border-bottom-style: none; }

                .dataview#edi-invoice tfoot{ border-top: 1px solid red; padding-right: 10px; }

            </style>
        </head>
        <body>
            <div class="wrapper">
                <div class="container">
                    <table class="dataview" id="edi-invoice">
                        <thead>
                            <tr>
                                <th colspan="20" style="width:699px; text-align:left;text-indent:486px;">TAX INVOICE</th>
                                <th colspan="5"  style="width:175px;">&#160;</th>
                                <th colspan="5"  style="width:174px; text-align:left;">999999-9999999</th>
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="10" style="width:350px;text-align:left"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:partyIdentification"/>&#160;&#160;&#160;&#160;&#160;TBD</th>
                                <th colspan="3"  style="width:105px;text-align:right">Ship To</th>
                                <th colspan="15" style="width:524px;text-align:left">: <xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:name"/></th>
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="10" style="width:350px;text-align:left"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:name"/></th>
                                <th colspan="3"  style="width:105px;text-align:center">&#160;</th>
                                <th colspan="15" style="width:524px;text-align:left">: <xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:city"/></th>							
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="10" style="width:350px;text-align:left"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:addressLines[1]"/></th>
                                <th colspan="3"  style="width:105px;">&#160;</th>
                                <th colspan="15" style="width:524px;text-align:left">: <xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:state"/></th>							
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="10" style="width:350px;text-align:left"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:city"/></th>
                                <th colspan="3"  style="width:105px;">&#160;</th>
                                <th colspan="15" style="width:524px;text-align:left">: <xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:postCode"/></th>							
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="5"  style="width:175px;text-align:left"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:state"/></th>
                                <th colspan="5"  style="width:175px;text-align:right"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:postCode"/></th>
                                <th colspan="3"  style="width:105px">&#160;</th>
                                <th colspan="15" style="width:524px;text-align:left">: <xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:countryCode"/></th>							
                            </tr>
                            <tr>
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="5"  style="width:175px;text-align:left">Ph: (99) 9999 9999</th>
                                <th colspan="5"  style="width:175px;text-align:right">Fax: (03) 9999 9999</th>
                                <th colspan="3"  style="width:105px">&#160;</th>
                                <th colspan="5"  style="width:175px">&#160;</th>
                                <th colspan="5"  style="width:175px">&#160;</th>
                                <th colspan="5"  style="width:174px">&#160;</th>
                            </tr>
                            <tr  style="border-bottom: 1px solid red;">
                                <th colspan="2"  style="width:69px;">&#160;</th>
                                <th colspan="13" style="width:490px;text-align:left">ABN: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierPartyAustralianBusinessNumber/a:referenceNumber"/></th>
                                <th colspan="5"  style="width:175px;">&#160;</th>
                                <th colspan="5"  style="width:175px;">&#160;</th>
                                <th colspan="5"  style="width:174px;">&#160;</th>
                            </tr>							
                            <tr>
                                <th colspan="4" style="width:140px;text-align: left; ;color:red; padding-left: 15px;">INVOICE FROM:</th>
                                <th colspan="6" style="width:210px;border-right: 1px solid red; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:name"/></th>
                                <th colspan="4" style="width:140px;text-align: left; ;color:red; padding-left: 15px;">INVOICE TO:</th>
                                <th colspan="6" style="width:210px;border-right: 1px solid red; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:name"/></th>
                                <th colspan="4" style="width:140px;text-align: left; color:red; padding-left: 15px;">DELIVER TO:</th>
                                <th colspan="6" style="width:210px;text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:name"/></th>
                            </tr>
                            <tr>
                                <th colspan="4" style="text-align: center;"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:partyIdentification"/></th>
                                <th colspan="6" style="border-right: 1px solid red; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:addressLines[1]"/></th>
                                <th colspan="4" style="text-align: center;"><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:partyIdentification"/></th>
                                <th colspan="6" style="border-right: 1px solid red; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:addressLines[1]"/></th>
                                <th colspan="4" style="text-align: center;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:partyIdentification"/></th>
                                <th colspan="6" style="text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:addressLines[1]"/></th>
                            </tr>
                            <tr>
                                <th colspan="4" style="text-align: center; color:red">&#160;</th>
                                <th colspan="6" style="border-right: 1px solid red; text-align: left;">
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:city"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:state"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:countryCode"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:postCode"/>
                                </th>
                                <th colspan="4" style="text-align: center; ;color:red">&#160;</th>
                                <th colspan="6" style="border-right: 1px solid red; text-align: left;">
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:city"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:state"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:countryCode"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:postCode"/>                                
                                </th>
                                <th colspan="4" style="text-align: center; color:red">&#160;</th>
                                <th colspan="6" style="text-align: left;">
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:city"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:state"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:countryCode"/>&#160;
                                    <xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:postCode"/>                                
                                </th>
                            </tr>
                            <tr style="border-top: 1px solid red;">
                                <th colspan="5" style="width:175px;" class="column-name">ORDER NUMBER</th>
                                <th colspan="5" style="width:175px;" class="column-name">ORDER DATE</th>
                                <th colspan="5" style="width:175px;" class="column-name">DELIVERY NUMBER</th>
                                <th colspan="5" style="width:175px;" class="column-name">DELIVERY DATE</th>
                                <th colspan="5" style="width:175px;" class="column-name">INVOICE NUMBER</th>
                                <th colspan="5" style="width:175px;" class="column-name-no-border">INVOICE DATE</th>
                            </tr>
                            <tr style="border-bottom: 1px solid red;">
                                <th colspan="5" style="width:175px;border-right: 1px solid red;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerOrderNumber/a:referenceNumber"/></th>
                                <th colspan="5" style="width:175px;border-right: 1px solid red;"><xsl:variable name="order_date" select="a:Invoices/a:Invoice/a:purchaseDate/a:value"/>
                                    <xsl:call-template name="format_date">
                                        <xsl:with-param name="date" select="$order_date"/>
                                    </xsl:call-template>                                
                                </th>
                                <th colspan="5" style="width:175px;border-right: 1px solid red;"><xsl:value-of select="a:Invoices/a:Invoice/a:deliveryNumber/a:referenceNumber"/></th>
                                <th colspan="5" style="width:175px;border-right: 1px solid red;"><xsl:variable name="delivery_date" select="a:Invoices/a:Invoice/a:deliveryDate/a:value"/>
                                    <xsl:call-template name="format_date">
                                        <xsl:with-param name="date" select="$delivery_date"/>
                                    </xsl:call-template>                                
                                </th>
                                <th colspan="5" style="width:175px;border-right: 1px solid red;"><xsl:value-of select="a:Invoices/a:Invoice/a:invoiceNumber"/></th>
                                <th colspan="5" style="width:175px;"><xsl:variable name="invoice_date" select="a:Invoices/a:Invoice/a:invoiceDate/a:value"/>
                                    <xsl:call-template name="format_date">
                                        <xsl:with-param name="date" select="$invoice_date"/>
                                    </xsl:call-template>                                
                                </th>
                            </tr>									
                        </thead>
                        <tbody>
                            <tr style="border-bottom: 1px solid red;">
                                <th colspan="3"  style="width:104px;" class="column-name">PRODUCT</th>
                                <th colspan="12" style="width:420px;" class="column-name">PRODUCT DESCRIPTION</th>
                                <th colspan="2"  style="width:70px;" class="column-name">QTY</th>
                                <th colspan="3"  style="width:103px;" class="column-name">PRICE</th>
                                <th colspan="2"  style="width:67px;" class="column-name">DISC</th>
                                <th colspan="1"  style="width:35px;" class="column-name">UNIT</th>
                                <th colspan="2"  style="width:69px;" class="column-name">TAX</th>
                                <th colspan="5"  style="width:174px;" class="column-name-no-border">VALUE</th>
                            </tr>
                            <xsl:for-each select="a:Invoices/a:Invoice/a:productLines/a:productLine">
                                <tr>
                                    <td colspan="3"  class="left" >&#160;</td>
                                    <td colspan="12" class="left">
                                        <xsl:value-of select="a:itemDescription"/>
                                        <xsl:value-of disable-output-escaping="yes">&lt;br /&gt;</xsl:value-of>GST Amount: <xsl:value-of select="a:totalGoodsAndServicesTaxAmount/a:amount"/>
                                        <xsl:value-of disable-output-escaping="yes">&lt;br /&gt;</xsl:value-of>(CAT: <xsl:value-of select="a:additionalProducts/a:productPartNumber"/>)
                                    </td>
                                    <td colspan="2"  class="right" >
                                        <xsl:value-of select="format-number(a:invoiceQuantity/a:quantity, '#,###.00')"/>
                                    </td>
                                    <td colspan="3"  class="right" >
                                        <xsl:value-of select="a:totalItemAmountTaxExclusive/a:amount"/>
                                    </td>
                                    <td colspan="2"  class="right" >TBD</td>
                                    <td colspan="1"  class="center" ><xsl:value-of select="a:invoiceQuantity/a:unit"/></td>
                                    <td colspan="2"  class="right" ><xsl:value-of select="a:goodsAndServicesTax/a:rate"/></td>
                                    <td colspan="5"  class="right" ><xsl:value-of select="a:itemUnitPriceTaxExclusive/a:price"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="5" style="width: 174px; padding:3px 0px 3px 0px">&#160;</th>
                                <th colspan="5" style="width: 174px; padding:3px 0px 3px 0px">&#160;</th>
                                <th colspan="5" style="width: 174px; padding:3px 0px 3px 0px">&#160;</th>
                                <th colspan="5" style="width: 174px; padding:3px 0px 3px 0px">&#160;</th>
                                <th colspan="5" style="width: 172px; padding:3px 0px 3px 0px; border-right: 1px solid red;">&#160;</th>
                                <th colspan="5"  style="width: 174px; padding:3px 0px 3px 0px; text-align: center;">INVOICE TOTAL</th>
                            </tr>			
                            <tr>
                                <td colspan="10" >&#160;</td>
                                <td colspan="5"  > FREIGHT (64)</td>
                                <td colspan="5"  style="text-align: center;">0.00</td>
                                <td colspan="5"  >GST Exclusive Total</td>
                                <td colspan="5"  style="border-left: 1px solid red;text-align: right; padding-right: 15px;">
                                    <xsl:value-of select="format-number(number(a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount) - number(a:Invoices/a:Invoice/a:totalTaxAmount/a:amount), '##,###,###.00')"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" >&#160;</td>
                                <td colspan="5"  >&#160;</td>
                                <td colspan="5"  >&#160;</td>
                                <td colspan="5"  >GST Amount</td>
                                <td colspan="5"  style="border-left: 1px solid red;text-align: right; padding-right: 15px;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalTaxAmount/a:amount"/></td>
                            </tr>
                            <tr>
                                <td colspan="10" style="padding-bottom: 3px;">&#160;</td>
                                <td colspan="5"  style="padding-bottom: 3px;">&#160;</td>
                                <td colspan="5"  style="padding-bottom: 3px;">&#160;</td>
                                <td colspan="5"  style="padding-bottom: 3px;">GST Inclusive Total</td>
                                <td colspan="5"  style="padding-bottom: 3px; border-left: 1px solid red;text-align: right; padding-right: 15px;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount"/></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </body>
    </html>
	</xsl:template>
</xsl:stylesheet>
