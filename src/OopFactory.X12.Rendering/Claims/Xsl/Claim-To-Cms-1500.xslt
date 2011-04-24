﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
    xmlns:oop="http://www.OopFactory.com/Form.xsd"
>
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="claim-image"/>

  <xsl:template match="/Interchange">
    <Interchange>

      <oop:form-master-template name="cms-1500"
        page-width-in="8.5" page-height-in="11"
        margin-top-in="0.0625" margin-left-in="0.625" margin-bottom-in="0" margin-right-in="0.140"
                                x-scale="0.0935" y-scale="0.157" x-offset="-0.21" y-offset="0.1">
        <xsl:attribute name="background-image">
          <xsl:value-of select="$claim-image"/>
        </xsl:attribute>
      </oop:form-master-template>
      <xsl:apply-templates select="@* | node()"/>
    </Interchange>
  </xsl:template>
  
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="Claim[@Type='Professional']">
    <oop:form form-master-template-ref="cms-1500">
      
      <oop:box id="header" x="33" y="1" width="50">
        <xsl:value-of select="@PatientControlNumber"/>
      </oop:box>
      <oop:box id="1-medicare" x="3.5" y="7" width="2.5" text-align="center">1</oop:box>
      <oop:box id="1-medicaid" x="10.5" y="7" width="2.5" text-align="center">2</oop:box>
      <oop:box id="1-tricare-champus" x="17.5" y="7" width="2.5" text-align="center">3</oop:box>
      <oop:box id="1-champva" x="26.5" y="7" width="2.5" text-align="center">4</oop:box>
      <oop:box id="1-group-health-plan" x="33.5" y="7" width="2.5" text-align="center">5</oop:box>
      <oop:box id="1-feca-blk-lung" x="41.5" y="7" width="2.5" text-align="center">6</oop:box>
      <oop:box id="1-other" x="47.5" y="7" width="2.6" text-align="center">7</oop:box>
      <oop:box id="2" x="4" y="9" width="28.5">
        <xsl:value-of select="concat(../Patient/Name/@Last,', ',../Patient/Name/@First,' ',../Patient/Name/@Middle)"/>
      </oop:box>
      <oop:box id="3-dob" x="34" y="9" width="10" text-align="center">
        <xsl:variable name="dob" select="../Patient/Demographic/@DateOfBirth"/>
        <xsl:value-of select="concat(substring($dob,6,2),' ',substring($dob,9,2),' ',substring($dob,1,4))"/>
      </oop:box>
      <oop:box id="3-sex-m" x="44.5" y="9" width="2.5" text-align="center">
        <xsl:if test="../Patient/Demographic/@Gender='M'">X</xsl:if>
      </oop:box>
      <oop:box id="3-sex-f" x="49.5" y="9" width="2.5" text-align="center">
        <xsl:if test="../Patient/Demographic/@Gender='F'">X</xsl:if>
      </oop:box>
      <oop:box id="5-address" x="4" y="11" width="28.5">
        <xsl:value-of select="../Patient/AddressLine"/>
      </oop:box>
      <oop:box id="5-city" x="4" y="13" width="25">
        <xsl:value-of select="../Patient/Locale/@City"/>
      </oop:box>
      <oop:box id="5-state" x="29" y="13" width="3.5" text-align="center">
        <xsl:value-of select="../Patient/Locale/@State"/>
      </oop:box>
      <oop:box id="5-zip" x="4" y="15" width="13" text-align="center">
        <xsl:value-of select="../Patient/Locale/@PostalAddress"/>
      </oop:box>
      <oop:box id="5-telephone" x="18" y="15" width="14.5">
        234-567-8901
      </oop:box>
      <oop:box id="6-self" x="35.5" y="11" width="2.5" text-align="center">1</oop:box>
      <oop:box id="6-spouse" x="40.5" y="11" width="2.5" text-align="center">2</oop:box>
      <oop:box id="6-child" x="44.5" y="11" width="2.5" text-align="center">3</oop:box>
      <oop:box id="6-other" x="49.5" y="11" width="2.5" text-align="center">4</oop:box>
      <oop:box id="8-single" x="37.5" y="13" width="2.5" text-align="center">5</oop:box>
      <oop:box id="8-married" x="43.5" y="13" width="2.5" text-align="center">6</oop:box>
      <oop:box id="8-other" x="49.5" y="13" width="2.5" text-align="center">7</oop:box>
      <oop:box id="8-employed" x="37.5" y="15" width="2.5" text-align="center">8</oop:box>
      <oop:box id="8-ft-student" x="43.5" y="15" width="2.5" text-align="center">9</oop:box>
      <oop:box id="8-pt-student" x="49.5" y="15" width="2.5" text-align="center">0</oop:box>
      <oop:box id="1-insured-id-num" x="53" y="7" width="30">INSURED ID NUM</oop:box>
      <oop:box id="4" x="53" y="9" width="30">INSURED NAME</oop:box>
      <oop:box id="7-insured-address" x="53" y="11" width="30">INSURED ADDRESS</oop:box>
      <oop:box id="7-insured-city" x="53" y="13" width="23">INSURED CITY</oop:box>
      <oop:box id="7-insured-state" x="77" y="13" width="6">TX</oop:box>
      <oop:box id="7-insured-zip" x="53" y="15" width="12">INSURED-ZIP</oop:box>
      <oop:box id="7-insured-telephone" x="68.5" y="15" width="14.5">TELEPHONE</oop:box>
      <oop:box id="11-insured-policy-group" x="53" y="17" width="30">POLICY GROUP</oop:box>
      <oop:box id="11-insured-dob" x="56.5" y="19" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="11-insured-sex-m" x="70.5" y="19" width="2.5" text-align="center">M</oop:box>
      <oop:box id="11-insured-sex-f" x="77.5" y="19" width="2.5" text-align="center">F</oop:box>
      <oop:box id="11-insured-employer" x="53" y="21" width="30">EMPLOYER</oop:box>
      <oop:box id="11-insured-plan-name" x="53" y="23" width="30">PLAN NAME</oop:box>
      <oop:box id="11-insured-another-yes" x="54.5" y="25" width="2.5" text-align="center">Y</oop:box>
      <oop:box id="11-insured-another-no" x="59.5" y="25" width="2.5" text-align="center">N</oop:box>
      <oop:box id="13-insured-signature" x="59" y="28.5" width="24" text-align="center">SIGNATURE</oop:box>
      <oop:box id="9-other-insured-name" x="4" y="17" width="28.5">OTHER INSURED NAME</oop:box>
      <oop:box id="9-other-insured-policy" x="4" y="19" width="28.5">OTHER INSURED POLICY</oop:box>
      <oop:box id="9-other-insured-dob" x="5" y="21" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="9-other-insured-sex-m" x="20.5" y="21" width="2.5" text-align="center">M</oop:box>
      <oop:box id="9-other-insured-sex-f" x="26.5" y="21" width="2.5" text-align="center">F</oop:box>
      <oop:box id="9-other-insured-employer" x="4" y="23" width="28.5">OTHER INSURED EMPLOYER</oop:box>
      <oop:box id="9-other-insured-plan-name" x="4" y="25" width="28.5">OTHER INSURED PLAN NAME</oop:box>
      <oop:box id="10-employment-yes" x="37.5" y="19" width="2.5" text-align="center">Y</oop:box>
      <oop:box id="10-employment-no" x="43.5" y="19" width="2.5" text-align="center">N</oop:box>
      <oop:box id="10-auto-accident-yes" x="37.5" y="21" width="2.5" text-align="center">Y</oop:box>
      <oop:box id="10-auto-accident-no" x="43.5" y="21" width="2.5" text-align="center">N</oop:box>
      <oop:box id="10-auto-accident-state" x="48" y="21" width="2.5" text-align="center">TX</oop:box>
      <oop:box id="10-other-accident-yes" x="37.5" y="23" width="2.5" text-align="center">Y</oop:box>
      <oop:box id="10-other-accident-no" x="43.5" y="23" width="2.5" text-align="center">N</oop:box>
      <oop:box id="10-reserved" x="33" y="25" width="20">RESERVED</oop:box>
      <oop:box id="12-patient-signature" x="9" y="28.5" width="25" text-align="center">SIGNATURE</oop:box>
      <oop:box id="12-patient-signature-date" x="39" y="28.5" width="14" text-align="center">MM/DD/YYYY</oop:box>
      <oop:box id="14-date-of-current-illness" x="5" y="31" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="15-illness-first-date" x="40.5" y="31" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="17-referring-provider-name" x="4" y="33" width="26">REFERRING PROVIDER NAME</oop:box>
      <oop:box id="17-referring-provider-id-qual" x="33" y="32" width="3">QL</oop:box>
      <oop:box id="17-referring-provider-id" x="36" y="32" width="16">REFERRING PROVIDER ID</oop:box>
      <oop:box id="17-referring-provider-npi" x="36" y="33" width="16">NPI</oop:box>
      <oop:box id="19-reserved" x="4" y="35" width="49">RESERVED</oop:box>
      <oop:box id="21-diag-1" x="6" y="37" width="8">123 4</oop:box>
      <oop:box id="21-diag-2" x="6" y="39" width="8">234 5</oop:box>
      <oop:box id="21-diag-3" x="33" y="37" width="8">345 6</oop:box>
      <oop:box id="21-diag-4" x="33" y="39" width="8">456 7</oop:box>
      <oop:box id="16-unable-to-work-from" x="57" y="31" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="16-unable-to-work-to" x="71" y="31" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="18-hospitalization-from" x="57" y="33" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="18-hospitalization-to" x="71" y="33" width="10" text-align="center">MM DD YYYY</oop:box>
      <oop:box id="20-outside-lab-yes" x="54.5" y="35" width="2.5" text-align="center">Y</oop:box>
      <oop:box id="20-outside-lab-no" x="59.5" y="35" width="2.5" text-align="center">N</oop:box>
      <oop:box id="20-outside-lab-charges-1" x="65" y="35" width="9" text-align="right">00.00</oop:box>
      <oop:box id="20-outside-lab-charges-2" x="74.5" y="35" width="9" text-align="right">00.00</oop:box>
      <oop:box id="22-medicare-resubmission-code" x="53" y="37" width="11">RESUB CODE</oop:box>
      <oop:box id="22-medicare-resubmission-original-ref-number" x="65" y="37" width="18">ORIGINAL REF NUM</oop:box>
      <oop:box id="23-prior-authorization-number" x="53" y="39" width="30">PRIOR AUTH #</oop:box>
    </oop:form>
  </xsl:template>
</xsl:stylesheet>