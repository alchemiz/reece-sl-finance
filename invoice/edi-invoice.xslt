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
        </xsl:otherwise>
    </xsl:choose>
	</xsl:template>
	<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;&#xd;</xsl:text>
	<html>
	<head>
		<title>EDI INVOICE <xsl:value-of select="a:Invoices/a:Invoice/a:invoiceNumber"/></title>
		<style>
			html	{ height: 100vh; padding: 0px; margin:0px; overflow: hidden; }

			body	{ width: 1058px; height: 99%; margin: 2px auto 2px auto; background-color: grey; font-family:'Courier New', Courier, monospace, sans-serif; font-size: 12px;  font-weight: normal; }

			table	{ box-sizing: border-box; width: 100%; height: 99%; margin: 0px auto; padding: 0px; table-layout: fixed; empty-cells: show; border-collapse: collapse; border-spacing: 0px;  border: 1px solid red; background-color: white;}

			thead,
			tbody,
			tr 		{ display: table; width: 100%; table-layout: fixed;}

			tbody	{ display: block; overflow-y: auto; overflow-x: hidden; table-layout: fixed; max-height: calc(100vh - 295px)}

			div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> table tbody td	{ word-wrap:normal; vertical-align: middle; display: inline-block; height: 52px;}

			div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> table tbody tr	{ display: block;}

			div * {
    			white-space: nowrap;
			}

			#container	{ height: 99.2%; width: 1058px; position: relative; display: block;}

			#edi-footer { position: relative; bottom: 73px; border: 1px solid red; border-bottom-style: none; width: 1056px; margin: 0px; padding: 0px;} 

			.page-header,
			.page-header-space	{ height: 192px; width: 1055px; display: table; margin-left: 2px;}

			.page-footer,
			.page-footer-space	{ height: 73px; width: 1055px; display: block;}

			.page-header	{ position: fixed; top: 6px; background: white; line-height: 14px; vertical-align: middle; border-bottom: 1px solid red;}

			.page-header div	{ display: inline-block; width: 100%;}
			.page-footer div	{ display: block; width: 100%;}

			.row div	{ line-height: 14px; vertical-align: middle;}

			.col-head	{ display: inline-block;  padding-top: 4px;  text-align: center; }

			.row-detail <xsl:text disable-output-escaping="yes">&gt;</xsl:text> td	{ width: 100%; padding-top: 3px; padding-bottom: 3px;}

			.row-detail <xsl:text disable-output-escaping="yes">&gt;</xsl:text> td <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div	{ display:inline-block;  vertical-align: middle;}

			@media print{ 
				@page	{ size: A4 landscape; }
				
				body	{ width: 1058px; height: 99%; margin: 2px auto 2px auto; font-family:'Courier New', Courier, monospace, sans-serif; font-size: 12px; font-weight: normal; }
				
				thead { display: table-header-group; }
				
				tbody { display: table-row-group; overflow: hidden; }
				
				table thead, tbody, tfoot {page-break-inside: avoid; page-break-before: avoid; page-break-after: avoid;}
				
				table tr:nth-child(8n) {page-break-after: always;}
			}
		</style>
	</head>
	<body>
		<div id="container">
			<div class="page-header">
				<div style="text-align: center;">TAX INVOICE</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierNumber"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierState"/></div>
					<div style="width: 7%; text-align: right;">Ship To :</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:name"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierName"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:addressLines[1]"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine1"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:city"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine2"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:state"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine3"/></div>
					<div style="width: 8%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierPostCode"/></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:postCode"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 19%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Ph: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierPhoneNumber"/></div>
					<div style="width: 19%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Fax: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierFaxNumber"/></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:countryCode"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 16px;">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>ABN: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierPartyAustralianBusinessNumber/a:referenceNumber"/></div>
					<div style="width: 8%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row" style="display: block; height: 12px; white-space: nowrap; border-top: 1px solid red;">
					<div style="width: 34%; height: 12px; display: inline-block; padding-left: 15px; border-right: 1px solid red; padding-top: 2px;">
						<div style="width: 29%; text-align: right;  color:red;">INVOICE FROM :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:name"/></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block; border-right: 1px solid red; padding-top: 2px;">
						<div style="width: 25%; text-align: left; color:red;">INVOICE TO :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:name"/></div>                  
					</div>
					<div style="width: 32%;height: 12px; display: inline-block;">
						<div style="width: 26%; text-align: left; color:red;">DELIVER TO :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:name"/></div>                  
					</div>
				</div>
				<div class="row" style="display: block; height: 12px; white-space: nowrap;">
					<div style="width: 34%; height: 12px; display: inline-block; padding-left: 15px; border-right: 1px solid red; padding-top: 2px;">
						<div style="width: 29%; text-align: right;  color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:addressLines[1]"/></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block; border-right: 1px solid red; padding-top: 2px;">
						<div style="width: 25%; text-align: right; color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:addressLines[1]"/></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block;">
						<div style="width: 26%; text-align: right; color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:addressLines[1]"/></div>
					</div>
				</div>
				<div class="row" style="display: block; height: 16px; white-space: nowrap; border-bottom: 1px solid red; margin-bottom: -2px;"> 
					<div style="width: 34%; height: 12px; display: inline-block; padding-left: 15px; border-right: 1px solid red; padding-top: 4px;"> 
						<div style="width: 29%; text-align: right;  color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:postCode"/></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block; border-right: 1px solid red; padding-top: 4px;"> 
						<div style="width: 25%; text-align: right; color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:postCode"/></div>
					</div> 
					<div style="width: 32%;height: 12px; display: inline-block;"> 
						<div style="width: 26%; text-align: right; color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:postCode"/></div>
					</div>
				</div>
				<div class="row" style="display: block; height: 12px; white-space: nowrap; color: red; "> 
					<div style="width: 34%; height: 12px; display: inline-block; padding-left: 15px;"> 
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red; padding-top: 0px; line-height: 16px;">ORDER NUMBER</div> 
						<div style="width: 47.9%; text-align: center; border-right: 1px solid red; padding-top: 0px;">ORDER DATE</div> 
					</div> 
					<div style="width: 32%;height: 12px; display: inline-block;"> 
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red; padding-top: 0px;">DELIVERY NUMBER</div> 
						<div style="width: 48%; text-align: center; border-right: 1px solid red; padding-top: 0px;">DELIVERY DATE</div> 
					</div> 
					<div style="width: 32%;height: 12px; display: inline-block;"> 
						<div style="width: 50%; text-align: center; border-right: 1px solid red; padding-top: 0px;">INVOICE NUMBER</div> 
						<div style="width: 50%; text-align: center; padding-top: 0px;">INVOICE DATE</div> 
					</div> 
				</div> 
				<div class="row" style="display: block; height: 16px; white-space: nowrap; color: black; border-bottom: 1px solid red; padding-top: 2px;">
					<div style="width: 34%; height: 12px; display: inline-block; padding-left: 15px;">
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerOrderNumber/a:referenceNumber"/></div>
						<div style="width: 47.9%; text-align: center; border-right: 1px solid red; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="order_date" select="a:Invoices/a:Invoice/a:purchaseDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$order_date"/>
						</xsl:call-template></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block;">
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:deliveryNumber/a:referenceNumber"/></div>
						<div style="width: 48%; text-align: center; border-right: 1px solid red; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="delivery_date" select="a:Invoices/a:Invoice/a:deliveryDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$delivery_date"/>
						</xsl:call-template></div>
					</div>
					<div style="width: 32%;height: 12px; display: inline-block;">
						<div style="width: 50%; text-align: center; border-right: 1px solid red; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:invoiceNumber"/></div>
						<div style="width: 50%; text-align: center; padding-top: 3px;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="invoice_date" select="a:Invoices/a:Invoice/a:invoiceDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$invoice_date"/>
						</xsl:call-template></div>
					</div>
				</div>
				<div class="row" style="display: block; height: 16px; white-space: nowrap; color: red; text-align: center; line-height: 16px;">
					<div class="col-head" style="width: 15%">PRODUCT</div>
					<div class="col-head" style="width: 36.4%; border-right: 1px solid red;">PRODUCT DESCRIPTION</div>
					<div class="col-head" style="width: 7%;border-right: 1px solid red;">QTY SUPP</div>
					<div class="col-head" style="width: 7.5%;border-right: 1px solid red;">PRICE</div>
					<div class="col-head" style="width: 4%;border-right: 1px solid red;">DISC</div>
					<div class="col-head" style="width: 5%;border-right: 1px solid red;">UNIT</div>
					<div class="col-head" style="width: 5.2%;border-right: 1px solid red;">TAX</div>
					<div class="col-head" style="width: 14.5%;padding-top: 4px; text-align: center; ">VALUE</div>
				</div>				
			</div>
			 <table>
				 <thead>
					<tr><td><div class="page-header-space"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div></td></tr>
				 </thead>
				 <tbody>
					<tr><th style="height:12px;"><div style="visibility:hidden">space</div></th></tr>
					<xsl:for-each select="a:Invoices/a:Invoice/a:productLines/a:productLine">
						<tr class="row-detail" >
						<td>
							<div style="width: 19%; text-align: center;">
								<xsl:for-each select="a:additionalProducts">
									<xsl:variable name="productPartNumberId" select="a:productPartNumberId"/>
									<xsl:choose>
										<xsl:when test="$productPartNumberId = 'IN'">
											<xsl:value-of select="a:productPartNumber" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'&#160;'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<xsl:if test="a:buyingGuide">
									<xsl:value-of select="a:buyingGuide/a:productNumber"/>
								</xsl:if>
								<xsl:if test="not(a:buyingGuide)">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:if>
							</div>
							<div style="width: 31.5%; text-align: left;">
								<xsl:if test="a:buyingGuide">
									<xsl:value-of select="a:buyingGuide/a:productDescription"/><xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
									GST Amount: <xsl:value-of select="a:totalGoodsAndServicesTaxAmount/a:amount"/><xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
									(<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>CAT:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="a:buyingGuide/a:cat"/><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>APN:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="a:buyingGuide/a:apn"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>)
								</xsl:if>
								<xsl:if test="not(a:buyingGuide)">
									<xsl:value-of select="a:itemDescription/a:descriptionLine"/><xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>GST Amount: <xsl:value-of select="a:totalGoodsAndServicesTaxAmount/a:amount"/>
									<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
									(<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:for-each select="a:additionalProducts">
										<xsl:if test="a:productPartNumberId='SA'">CAT:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:productPartNumber"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
										<xsl:if test="a:productPartNumberId='EN'">APN:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:productPartNumber"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:if>
									</xsl:for-each><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>)
								</xsl:if>
							</div>
							<div style="width: 7%; text-align: right;"><xsl:value-of select="format-number(a:invoiceQuantity/a:quantity, '#########.00')"/></div>
							<div style="width: 8%; text-align: right;"><xsl:value-of select="format-number(a:itemUnitPriceTaxExclusive/a:price, '##########.00')"/></div>
							<div style="width: 4%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
							<div style="width: 4.5%; text-align: center;"><xsl:value-of select="a:invoiceQuantity/a:unit"/></div>
							<div style="width: 5.2%; text-align: right;"><xsl:value-of select="a:goodsAndServicesTax/a:rate"/></div>
							<div style="width: 13.5%; text-align: right; margin-right: 12px;"><xsl:value-of select="a:totalItemAmountTaxExclusive/a:amount"/></div>
						</td>
						</tr>					
					</xsl:for-each>
				 </tbody>
				 <tfoot>
					<tr>
					  <td>
						<div class="page-footer-space"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					  </td>
					</tr>
				  </tfoot>
			</table>
			<div id="edi-footer" class="page-footer">
				<div style="display: block; height: 18px; line-height: 18px; white-space: nowrap; color: red; text-align: center; padding-bottom: 0px;">
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 19.6%; display: inline-block; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 14%; display: inline-block; font-weight: bold;"><u>INVOICE TOTAL</u></div>
				</div>            
				<div style="display: block; height: 18px; line-height: 18px;  white-space: nowrap; color: black; padding-bottom: 0px;">
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<!-- FREIGHT -->
					<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) = a:Invoices/a:Invoice/a:freightCost/a:amount">
						<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) > 0">
							<div style="width: 15.3%; display: inline-block; text-align: left;">FREIGHT (64)</div>
							<div style="width: 7%; display: inline-block; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:freightCost/a:amount"/></div>
						</xsl:if>
						<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) = 0">
							<div style="width: 15.3%; display: inline-block; text-align: left; visibility: hidden;">FREIGHT (64)</div>
							<div style="width: 7%; display: inline-block; text-align: left; visibility: hidden;">0.00</div>
						</xsl:if>						
					</xsl:if>
					<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) != a:Invoices/a:Invoice/a:freightCost/a:amount">
						<div style="width: 15.3%; display: inline-block; text-align: left; visibility: hidden;">FREIGHT (64)</div>
						<div style="width: 7%; display: inline-block; text-align: left; visibility: hidden; ">0.00</div>
					</xsl:if>
					<xsl:if test="not(a:Invoices/a:Invoice/a:freightCost/a:qualifier)">
						<div style="width: 15.3%; display: inline-block; text-align: left; visibility: hidden;">FREIGHT (64)</div>
						<div style="width: 7%; display: inline-block; text-align: left; visibility: hidden; ">0.00</div>					  
					</xsl:if>
					<div style="width: 19.9%; display: inline-block; text-align: left; border-right: 1px solid red;">GST Exclusive Total</div>
					<div style="width: 13%; display: inline-block; text-align: right;"><xsl:value-of select="format-number(number(a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount) - number(a:Invoices/a:Invoice/a:totalTaxAmount/a:amount), '########.00')"/></div>
				</div>            
				<div style="display: block; height: 18px;  line-height: 18px; white-space: nowrap; color: black;margin-bottom: -2px;">
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>                        
					<div style="width: 19.9%; display: inline-block; text-align: left; border-right: 1px solid red;">GST Amount</div>
					<div style="width: 13%; display: inline-block; text-align: right;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalTaxAmount/a:amount"/></div>
				</div>
				<div style="display: block; height: 18px; line-height: 18px; white-space: nowrap; color: black; padding-bottom: 0px;">
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%; display: inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>            
					<div style="width: 19.9%; display: inline-block; text-align: left; border-right: 1px solid red;">GST Inclusive Total</div>            
					<div style="width: 13%; display: inline-block; text-align: right;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount"/></div>
				</div>
			</div>
		</div>
	</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
