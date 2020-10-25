<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:a="http://reece.com.au/2010/integration/1">
<xsl:output method="html" indent="yes"/>

	<xsl:template name="calc_num_padded_px">
		<xsl:param name="item_count"/>
		<xsl:value-of select="(9 - number(number($item_count) mod 9)) * 45" />
	</xsl:template>
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
	<xsl:variable name="product_line_count" select="a:Invoices/a:Invoice/a:numberOfLineItems" />
	<xsl:variable name="last_page_padded_px">
		<xsl:call-template name="calc_num_padded_px">
			<xsl:with-param name="item_count" select="$product_line_count"/>
		</xsl:call-template>
	</xsl:variable>
	<html>
	<head>
		<title>EDI INVOICE <xsl:value-of select="a:Invoices/a:Invoice/a:invoiceNumber"/></title>
		<style>
			html	{ height: 100vh; padding: 0px; margin: 0px; overflow: hidden; }

			body	{ width: 1058px; height: 99%; margin: 2px auto 2px auto; background-color: grey; font-family:'Courier New', Courier, monospace, sans-serif; font-size: 12px;  font-weight: normal; }

			table	{ box-sizing: border-box; width: 100%; height: 99%; margin: 0px auto; padding: 0px; table-layout: fixed; empty-cells: show; border-collapse: collapse; border-spacing: 0px;  border: 1px solid red; background-color: white; }

			div * {
    			white-space: nowrap;
			}

			#container	{ height: 99.2%; width: 1059px; position: relative; display: block;} 

			.page-header,
			.page-header-space	{ height: 196px; width: 1055px; display:block; }

			.page-header	{ box-sizing: border-box; position: fixed; top: 6px; background: white; vertical-align: middle; border-bottom: 1px solid red; margin: 0px 0px 0px 2px; }

			.row-header-party-details { display: block; height:14px; line-height:14px; padding: 0px; margin: 0px; }
			
			.row-header-party-details <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: inline-block; vertical-align: middle; }

			.row-header-invoice-details { display: block; height:14px; line-height:14px; padding: 0px; margin: 0px 0px -1px 0px; }
			
			.row-header-invoice-details <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: inline-block; vertical-align: middle; }
			
			.row-header-invoice-details <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: inline-block; }
			
			.row-header-invoice-columns { display: block; height:14px; line-height:14px; padding: 0px; margin: 0px; margin-top: 2px; }
			
			.row-header-invoice-columns <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: inline-block; text-align: center; vertical-align: bottom; }

			thead,
			tbody,
			tr 		{ display: table; width: 100%; table-layout: fixed;}

			tbody	{ display: block; overflow-y: auto; overflow-x: hidden; table-layout: fixed; max-height: calc(100vh - 295px)}

			table tbody tr.row-detail:nth-child(1) { padding-top: 6px; }

			div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> table tbody td	{ word-wrap:normal; vertical-align: middle; display: inline-block; height: 40px;}

			div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> table tbody tr	{ display: block;}

			.row-detail <xsl:text disable-output-escaping="yes">&gt;</xsl:text> td	{ width: 100%; padding-top: 3px; padding-bottom: 3px;}

			.row-detail <xsl:text disable-output-escaping="yes">&gt;</xsl:text> td <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div	{ display:inline-block;  vertical-align: middle;}

			.page-footer,
			.page-footer-space	{ height: 72px; width: 1055px; display: block; }

			.page-footer	{ box-sizing: border-box; vertical-align: middle; background: white; }
			
			#edi-footer { box-sizing: border-box; position: relative; bottom: 74px; padding: 0px; margin: 0px 0px 0px 2px; border-top: 1px solid red; vertical-align: middle; } 

			.row-footer-details { display: block; height:72px; padding: 1px 0px 1px 0px; margin: -1px 0px -1px 0px; }
			
			.row-footer-details <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: block; }
			
			.row-footer-details <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div <xsl:text disable-output-escaping="yes">&gt;</xsl:text> div { display: inline-block; height: 18px; line-height:18px; }

			@media print{
				@page	{ size: A4 landscape; }
				
				body	{ width: 1056px; max-height: 728px; margin: 0px auto 0px auto; padding: 0px; font-family:'Courier New', Courier, monospace, sans-serif; font-size: 12px; font-weight: normal; }
				
				thead	{ display: table-header-group; }
				
				tbody	{ display: table-row-group; overflow: hidden; }
				
				tfoot	{ display: table-row-group; }
				
				table thead, tbody, tfoot {page-break-inside: avoid; page-break-before: avoid; page-break-after: avoid; }

	<xsl:choose><xsl:when test="$product_line_count &gt; 9">
				.row-detail:nth-child(9n) { page-break-after: always; }

				.row-detail:nth-child(9n+1) { padding-top: 208px; }
		<xsl:if test="$last_page_padded_px &gt; 0">
				.row-detail:nth-child(<xsl:value-of select="$product_line_count"/>) { padding-bottom: <xsl:value-of select="$last_page_padded_px"/>px; }

				#edi-footer { bottom: 74px; height: 72px; }
		</xsl:if></xsl:when>
		<xsl:otherwise>
			.row-detail:nth-child(<xsl:value-of select="$product_line_count"/>) { padding-bottom: <xsl:value-of select="$last_page_padded_px"/>px; }

			#edi-footer { bottom: 76px; height: 72px; }
		</xsl:otherwise>
	</xsl:choose>
			}

		</style>
	</head>
	<body>
		<div id="container">
			<div class="page-header">
				<div class="row-header-party-details" style="text-align: center;">TAX INVOICE</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierNumber"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierState"/></div>
					<div style="width: 7%; text-align: right;">Ship To :</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:name"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierName"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:addressLines[1]"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine1"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:city"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine2"/></div>
					<div style="width: 8%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:state"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierAddressLine3"/></div>
					<div style="width: 8%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierPostCode"/></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:postCode"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 19%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Ph: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierPhoneNumber"/></div>
					<div style="width: 19%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Fax: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierDetails/a:supplierFaxNumber"/></div>
					<div style="width: 7%; text-align: right;">:</div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:shipToParty/a:address/a:countryCode"/></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-party-details">
					<div style="width: 5%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 30%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>ABN: <xsl:value-of select="a:Invoices/a:Invoice/a:supplierPartyAustralianBusinessNumber/a:referenceNumber"/></div>
					<div style="width: 8%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 7%; text-align: right;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 45%; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 4%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
				</div>
				<div class="row-header-invoice-details" style="border-top: 1px solid red;">
					<div style="width: 34%; padding-left: 15px; border-right: 1px solid red;">
						<div style="width: 29%; text-align: right; color:red;">INVOICE FROM :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:name"/></div>
					</div>
					<div style="width: 32%; border-right: 1px solid red;">
						<div style="width: 25%; text-align: left; color:red;">INVOICE TO :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:name"/></div>                  
					</div>
					<div style="width: 31%; overflow: hidden;">
						<div style="width: 26%; text-align: left; color:red;">DELIVER TO :</div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:name"/></div>                  
					</div>
				</div>
				<div class="row-header-invoice-details">
					<div style="width: 34%; padding-left: 15px; border-right: 1px solid red;">
						<div style="width: 29%; text-align: right;  color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:addressLines[1]"/></div>
					</div>
					<div style="width: 32%; border-right: 1px solid red;">
						<div style="width: 25%; text-align: right; color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:addressLines[1]"/></div>
					</div>
					<div style="width: 31%; overflow: hidden;">
						<div style="width: 26%; text-align: right; color:black;"><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:partyIdentification"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:addressLines[1]"/></div>
					</div>
				</div>
				<div class="row-header-invoice-details" style="border-bottom: 1px solid red;"> 
					<div style="width: 34%; padding-left: 15px; border-right: 1px solid red;"> 
						<div style="width: 29%; text-align: right;  color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:supplierParty/a:address/a:postCode"/></div>
					</div>
					<div style="width: 32%; border-right: 1px solid red;"> 
						<div style="width: 25%; text-align: right; color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:billToParty/a:address/a:postCode"/></div>
					</div> 
					<div style="width: 31%; overflow: hidden;"> 
						<div style="width: 26%; text-align: right; color:black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
						<div style="color: black; text-align: left;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:city"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:state"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:countryCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerParty/a:address/a:postCode"/></div>
					</div>
				</div>
				<div class="row-header-invoice-details" style="color: red;"> 
					<div style="width: 34%; padding-left: 15px;"> 
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red;">ORDER NUMBER</div> 
						<div style="width: 47.9%; text-align: center; border-right: 1px solid red;">ORDER DATE</div> 
					</div> 
					<div style="width: 32%;"> 
						<div style="width: 50%; text-align: center; border-right: 1px solid red;">DELIVERY NUMBER</div> 
						<div style="width: 47.76%; text-align: center; border-right: 1px solid red;">DELIVERY DATE</div> 
					</div> 
					<div style="width: 31%;"> 
						<div style="width: 50%; text-align: center; border-right: 1px solid red;">INVOICE NUMBER</div> 
						<div style="width: 50%; text-align: center;">INVOICE DATE</div> 
					</div> 
				</div> 
				<div class="row-header-invoice-details" style="color: black; border-bottom: 1px solid red;">
					<div style="width: 34%; padding-left: 15px;">
						<div style="width: 49.8%; text-align: center; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:buyerOrderNumber/a:referenceNumber"/></div>
						<div style="width: 47.9%; text-align: center; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="order_date" select="a:Invoices/a:Invoice/a:purchaseDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$order_date"/>
						</xsl:call-template></div>
					</div>
					<div style="width: 32%;">
						<div style="width: 50%; text-align: center; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:deliveryNumber/a:referenceNumber"/></div>
						<div style="width: 47.76%; text-align: center; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="delivery_date" select="a:Invoices/a:Invoice/a:deliveryDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$delivery_date"/>
						</xsl:call-template></div>
					</div>
					<div style="width: 31%;">
						<div style="width: 50%; text-align: center; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="a:Invoices/a:Invoice/a:invoiceNumber"/></div>
						<div style="width: 50%; text-align: center;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:variable name="invoice_date" select="a:Invoices/a:Invoice/a:invoiceDate/a:value"/>
						<xsl:call-template name="format_date">
							<xsl:with-param name="date" select="$invoice_date"/>
						</xsl:call-template></div>
					</div>
				</div>
				<div class="row-header-invoice-columns" style="color: red;">
					<div style="width: 18%">PRODUCT</div>
					<div style="width: 33.42%; border-right: 1px solid red;">PRODUCT DESCRIPTION</div>
					<div style="width: 7%;border-right: 1px solid red;">QTY SUPP</div>
					<div style="width: 7.48%;border-right: 1px solid red;">PRICE</div>
					<div style="width: 3.65%;border-right: 1px solid red;">DISC</div>
					<div style="width: 4.20%;border-right: 1px solid red;">UNIT</div>
					<div style="width: 5.95%;border-right: 1px solid red;">TAX</div>
					<div style="width: 14.5%; text-align: center; ">VALUE</div>
				</div>				
			</div>
			 <table>
				 <thead>
					<tr><td><div class="page-header-space"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div></td></tr>
				 </thead>
				 <tbody>

					<xsl:for-each select="a:Invoices/a:Invoice/a:productLines/a:productLine">
						<tr class="row-detail" >
						<td>
							<div style="width: 19%; text-align: center;">
								<xsl:variable name="buyingGuideProductCode" select="a:buyingGuide/a:productNumber"/>
								<xsl:for-each select="a:additionalProducts">
									<xsl:variable name="productPartNumberId" select="a:productPartNumberId"/>
									<xsl:choose>
										<xsl:when test="$productPartNumberId = 'IN'">
											<xsl:if test="not($buyingGuideProductCode)">
												<xsl:value-of select="a:productPartNumber" />
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'&#160;'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<xsl:if test="a:buyingGuide/a:productNumber">
									<xsl:value-of select="$buyingGuideProductCode"/>
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
					<tr >
					  <td>
						<div class="page-footer-space"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					  </td>
					</tr>
				  </tfoot>
			</table>
			<div id="edi-footer" class="page-footer row-footer-details">
				<div style="color: red; text-align: center;">
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 19.6%; border-right: 1px solid red;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 14%; font-weight: bold;"><u>INVOICE TOTAL</u></div>
				</div>            
				<div style="color: black;">
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<!-- FREIGHT -->
					<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) = a:Invoices/a:Invoice/a:freightCost/a:amount">
						<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) > 0">
							<div style="width: 15.3%; text-align: left;">FREIGHT (64)</div>
							<div style="width: 7%; text-align: left;"><xsl:value-of select="a:Invoices/a:Invoice/a:freightCost/a:amount"/></div>
						</xsl:if>
						<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) = 0">
							<div style="width: 15.3%; text-align: left; visibility: hidden;">FREIGHT (64)</div>
							<div style="width: 7%; text-align: left; visibility: hidden;">0.00</div>
						</xsl:if>						
					</xsl:if>
					<xsl:if test="number(a:Invoices/a:Invoice/a:freightCost/a:amount) != a:Invoices/a:Invoice/a:freightCost/a:amount">
						<div style="width: 15.3%; text-align: left; visibility: hidden;">FREIGHT (64)</div>
						<div style="width: 7%; text-align: left; visibility: hidden; ">0.00</div>
					</xsl:if>
					<xsl:if test="not(a:Invoices/a:Invoice/a:freightCost/a:qualifier)">
						<div style="width: 15.3%; text-align: left; visibility: hidden;">FREIGHT (64)</div>
						<div style="width: 7%; text-align: left; visibility: hidden; ">0.00</div>					  
					</xsl:if>
					<div style="width: 19.9%; text-align: left; border-right: 1px solid red;">GST Exclusive Total</div>
					<div style="width: 13%; text-align: right;"><xsl:value-of select="format-number(number(a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount) - number(a:Invoices/a:Invoice/a:totalTaxAmount/a:amount), '########.00')"/></div>
				</div>            
				<div style="color: black;">
					<div style="width: 20%; "><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%; "><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%; "><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>                        
					<div style="width: 19.9%; text-align: left; border-right: 1px solid red;">GST Amount</div>
					<div style="width: 13%; text-align: right;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalTaxAmount/a:amount"/></div>
				</div>
				<div style="color: black;">
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 20%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>
					<div style="width: 23%;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></div>            
					<div style="width: 19.9%; text-align: left; border-right: 1px solid red;">GST Inclusive Total</div>            
					<div style="width: 13%; text-align: right;"><xsl:value-of select="a:Invoices/a:Invoice/a:totalInvoiceAmountTaxInclusive/a:amount"/></div>
				</div>
			</div>
		</div>
	</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
