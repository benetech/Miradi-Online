<!-- Copyright 2012, Bush Heritage Australia, Melbourne, Australia. -->
<!-- This XSL style-sheet is free software. You can redistribute it and/or modify it under the -->
<!-- terms of the GNU General Public License version 3, as published by the Free Software Foundation.-->
<!-- The style-sheet is distributed in the hope that it will be useful, but without any warranty; -->
<!-- without even the implied warranty of merchantability or fitness for a particular purpose.  -->
<!-- See the GNU General Public License for more details http://www.gnu.org/licenses. -->
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:o="urn:schemas-microsoft-com:office:office" 
	xmlns:w="http://schemas.microsoft.com/office/word/2010/wordml" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:w10="urn:schemas-microsoft-com:office:word" 
	xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core" 
	xmlns:aml="http://schemas.microsoft.com/aml/2001/core" 
	xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" 
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
	
	 


	
	<!-- Provide reference to local directory for images-->
	<!-- Images must be stored in directory located in specific path named below -->
	<!-- For Windows, use file:///C:/BHA/images/ -->
	<!-- For Mac, use /BHA/images/ -->
	<!-- CURRENTLY SHOWING WINDOWS PATH CHANGE IF USING MAC-->
	<xsl:variable name="imgPath">file:///C:/BHA/images/</xsl:variable>
	
	

	<xsl:template match="ConservationProject">
		<html>
			<head>
				<style>
					body { font-family: Arial; font-size: 10pt; margin: 10px;}
          table {               
              border: 1px solid black;
              border-collapse:collapse;
              width: 90%;
              margin:15px;
              }
          td { 
              border: 1px solid black;        
              vertical-align: top;
              padding:5px;
              }
          th {
              border: 1px solid black;
              padding:5px;
              }
					td b { font-size: 14pt; color: #4F81BD; }
					td.header {vertical-align: bottom;}
          .intermediateresult { font-weight: bold; } 
					.break { page-break-before: always; }
					.conservationtargetpicture { width: 5cm; }
					.coverpagedate { font-size: 14pt; text-align:center; }
					.coverpagepicture { text-align: left;}
          .coverpagetitle { font-size: 24pt; font-weight: bold; }
          .sectiontitle { font-size: 18pt; font-weight: bold; }
					.instruction { font-style: italic; }
					.narrow {font-family: Arial Narrow}
					.subheading { color: #4F81BD; font-weight: bold; }
					.toc {font-size: 13pt; font-weight: bold; color: #4F81BD; }
					.vision { font-style: italic; }
					.targetImg {padding: 2px;}
					.health-vg { background-color: #008000; }
					.health-g { background-color: #00ff00; }
					.health-f {background-color: #ffff00;}
					.health-p {background-color: #ff0000;}
					img.rc-img { vertical-align:middle; height: 5in;}
			
				</style>
			</head>
			<body>
				<xsl:apply-templates select="ProjectSummary" mode="titlepage" />
        <xsl:apply-templates select="IntermediateResultPool" mode="progresstable"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="ProjectSummary" mode="titlepage">
		<p class="coverpagetitle">Project Plan For <xsl:value-of select="ProjectSummaryProjectName"/>
      <br />
      <xsl:value-of select="ProjectSummaryDataEffectiveDate"/>
    </p>
  </xsl:template>
  <xsl:template match="IntermediateResultPool" mode="progresstable">
    <p class="sectiontitle">Progress Report</p>
    <table>
      <tr>
        <th>Item</th>
        <th>Progress</th>
        <th>Progress Details</th>
      </tr>
      <xsl:for-each select="IntermediateResult">
        <xsl:sort select="IntermediateResultName" />
        <tr>
          <td class="intermediateresult"><xsl:value-of select="IntermediateResultName" /></td>
          <td></td>
          <td></td>
        </tr>
        <xsl:for-each select="IntermediateResultObjectiveIds">
          <xsl:variable name="ObjectiveId" select="ObjectiveId" />
            <tr>
              <td>><xsl:value-of select="/ConservationProject/ObjectivePool/Objective[@Id=$ObjectiveId]/ObjectiveName" /></td>
              <!-- TODO: Objectives can have more than one PercentId, so need to make sure we have most recent -->
              <xsl:variable name="PercentId" select="/ConservationProject/ObjectivePool/Objective[@Id=$ObjectiveId]/ObjectiveProgressPercentIds/ProgressPercentId" />
              <td><xsl:value-of select="/ConservationProject/ProgressPercentPool/ProgressPercent[@Id=$PercentId]/ProgressPercentPercentComplete" />%</td>
              <td></td>
            </tr>
            <xsl:for-each select="/ConservationProject/ObjectivePool/Objective[@Id=$ObjectiveId]/ObjectiveRelevantIndicatorIds">
              <xsl:variable name="IndicatorId" select="IndicatorId" />
              <tr>
              <td>>><xsl:value-of select="/ConservationProject/IndicatorPool/Indicator[@Id=$IndicatorId]/IndicatorName" /></td>
              <!-- TODO: Indicators can have more than one ProgressReportId, so need to make sure we have most recent -->
              <xsl:variable name="ProgressId" select="/ConservationProject/IndicatorPool/Indicator[@Id=$IndicatorId]/IndicatorProgressReportIds/ProgressReportId  " />
              <!-- td><xsl:value-of select="/ConservationProject/ProgressReportPool/ProgressReport[@Id=$ProgressId]/ProgressReportProgressStatus" /></td -->
                <xsl:choose>
                <xsl:when test="not(/ConservationProject/ProgressReportPool/ProgressReport[@Id=$ProgressId]/ProgressReportProgressStatus)" >
                  <td>
                  <ConservationProject>
                    <ProgressReportPool>
                      <ProgressReport id="$ProgressId">
                        <ProgressReportProgressStatus>Not Specified</ProgressReportProgressStatus>
                      </ProgressReport>
                    </ProgressReportPool>
                  </ConservationProject>
                  </td>
                </xsl:when >
                <xsl:otherwise>
                  <xsl:variable name="ProgressStatus" select="/ConservationProject/ProgressReportPool/ProgressReport[@Id=$ProgressId]/ProgressReportProgressStatus" />
                    <xsl:choose>
                      <xsl:when test="$ProgressStatus = 'MajorIssues'"><td bgcolor="#FF0000"><xsl:value-of select="$ProgressStatus" /></td></xsl:when>
                      <xsl:when test="$ProgressStatus = 'MinorIssues'"><td bgcolor="#FCFC18"><xsl:value-of select="$ProgressStatus" /></td></xsl:when>
                      <xsl:when test="$ProgressStatus = 'On-Track'"><td bgcolor="#00FF00"><xsl:value-of select="$ProgressStatus" /></td></xsl:when>
                      <xsl:when test="$ProgressStatus = 'Completed'"><td bgcolor="#005500"><xsl:value-of select="$ProgressStatus" /></td></xsl:when>
                      <xsl:otherwise><td><xsl:value-of select="$ProgressStatus" /></td></xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
                </xsl:choose>
              <td><xsl:value-of select="/ConservationProject/ProgressReportPool/ProgressReport[@Id=$ProgressId]/ProgressReportDetails" /></td>
              </tr>
            </xsl:for-each>
            <!-- TODO: Need to include activities at the same level as indicators -->
          </xsl:for-each>
      </xsl:for-each>
    </table>
  </xsl:template>
    
    

</xsl:stylesheet>
