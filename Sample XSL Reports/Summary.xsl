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
		
	
	<xsl:template match="ConservationProject">
		<html>
			<head>
				<style>
					body { 
					    font-family: Arial;
					    font-size: 10pt; 
					    margin: 10px;
					    }
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
					td b { 
					    font-size: 14pt;
					    color: #4F81BD;
					    }
					td.header {vertical-align: bottom;} 
					td.leftElement {width:175px; } 
					.coverpagepicture { text-align: left;}
					.coverpagetitle { font-size: 24pt; font-weight: bold; }
					.pagetitle  { font-size: 18pt; font-weight: bold; }
				</style>
			</head>
			<body>
				<xsl:apply-templates select="ProjectSummary" mode="titlepage" />
				<xsl:apply-templates select="ProjectSummary" mode="summarytable"/>
				<xsl:apply-templates select="ProjectResourcePool" mode="teamtable" />
				<xsl:apply-templates select="OrganizationPool" mode="orgtable" />
				<xsl:apply-templates select="ProjectSummaryScope" mode="scopetitle" />
				<xsl:apply-templates select="ProjectSummaryScope" mode="scopetable" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="ProjectSummary" mode="titlepage">
	  <p class="coverpagetitle">Project Plan For <xsl:value-of select="ProjectSummaryProjectName"/>
	  <br />
	  <!--We are not sure which tag is appropriate here, so this is a placeholder-->
	  Version: <xsl:value-of select="ProjectSummaryDataEffectiveDate"/> 
	  </p>
	  <br />
	</xsl:template>

	<xsl:template match="ProjectSummary" mode="summarytable">
	  <table>
	    <tr> 
	      <td class="leftElement">Project Name</td>
		<xsl:if test="not(ProjectSummaryProjectName)">
		  <ProjectSummaryProjectLanguage>Unspecified</ProjectSummaryProjectLanguage>
		</xsl:if>
	      <td><xsl:value-of select="ProjectSummaryProjectName"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Primary Project Data Language</td>
	      <td>
		<xsl:if test="not(ProjectSummaryProjectLanguage)">
		  <ProjectSummaryProjectLanguage>Unspecified</ProjectSummaryProjectLanguage>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryProjectLanguage"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Project Data Effective Date</td>
	      <td>
		<xsl:if test="not(ProjectSummaryDataEffectiveDate)">
		  <ProjectSummaryDataEffectiveDate>Unspecified</ProjectSummaryDataEffectiveDate>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryDataEffectiveDate"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Project Number</td>
	      <td>
		<xsl:if test="not(ProjectSummaryOtherOrgProjectNumber)">
		  <ProjectSummaryOtherOrgProjectNumber>Unspecified</ProjectSummaryOtherOrgProjectNumber>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryOtherOrgProjectNumber"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Related Projects</td>
	      <td>
		<xsl:if test="not(ProjectSummaryOtherOrgRelatedProjects)">
		  <ProjectSummaryOtherOrgRelatedProjects>Unspecified</ProjectSummaryOtherOrgRelatedProjects>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryOtherOrgRelatedProjects"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Project Website</td>
	      <td>
		<xsl:if test="not(ProjectSummaryProjectURL)">
		  <ProjectSummaryProjectURL>Unspecified</ProjectSummaryProjectURL>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryProjectURL"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Project Description</td>
	      <td>
		<xsl:if test="not(ProjectSummaryProjectDescription)">
		  <ProjectSummaryProjectDescription>Unspecified</ProjectSummaryProjectDescription>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryProjectDescription"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Project Status</td>
	      <td>
		<xsl:if test="not(ProjectSummaryProjectStatus)">
		  <ProjectSummaryProjectStatus>Unspecified</ProjectSummaryProjectStatus>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryProjectStatus"/>
	      </td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Next Steps</td>
	      <td>
		<xsl:if test="not(ProjectSummaryNextSteps)">
		  <ProjectSummaryNextSteps>Unspecified</ProjectSummaryNextSteps>
		</xsl:if>
		<xsl:value-of select="ProjectSummaryNextSteps"/>
	      </td>
	    </tr>
	  </table>
	  <br />
	  <br />
	  <br />
	</xsl:template>


	<xsl:template match="ProjectResourcePool" mode="teamtable">
	  <p class="pagetitle">Team</p>
	  <table>
	    <tr>
	      <th>Given Name</th>
	      <th>Surname</th>
	      <th>Resource ID</th>
	      <th>Organization</th>
	      <th>Position</th>
	      <th>Roles</th>
	      <th>Email</th>
	      <th>Office</th>
	    </tr>
	    <xsl:for-each select="ProjectResource">
	      <!-- <xsl:if test="ProjectResourceResourceType = Person"> -->
	      <tr> 
		<td><xsl:value-of select="ProjectResourceGivenName"/></td>
		<td><xsl:value-of select="ProjectResourceSurname"/></td>
		<td><xsl:value-of select="ProjectResourceResource_Id"/></td>
		<td><xsl:value-of select="ProjectResourceOrganization"/></td>
		<td><xsl:value-of select="ProjectResourcePosition"/></td>
		<td><xsl:value-of select="ProjectResourceRoleCodesContainer"/></td>
		<td><xsl:value-of select="ProjectResourceEmail"/></td>
		<td><xsl:value-of select="ProjectResourceOfficePhoneNumber"/></td>
	      </tr>
	      <!-- </xsl:if> -->
	    </xsl:for-each>
	  </table>
	  <br />
	  <br />
	  <br />
	</xsl:template>

	<xsl:template match="OrganizationPool" mode="orgtable">
	  <p class="pagetitle">Organization</p>
	  <table>
	    <tr>
	      <th>ID</th>
	      <th>Name</th>
	      <th>Role(s)</th>
	      <th>Given Name</th>
	      <th>Surname</th>
	      <th>Email</th>
	      <th>Phone</th>
	    </tr>
	    <xsl:for-each select="Organization">
	      <tr> 
		<td><xsl:value-of select="OrganizationId"/></td>
		<td><xsl:value-of select="OrganizationName"/></td>
		<td><xsl:value-of select="OrganizationRolesDescription"/></td>
		<td><xsl:value-of select="OrganizationGivenName"/></td>
		<td><xsl:value-of select="OrganizationSurname"/></td>
		<td><xsl:value-of select="OrganizationEmail"/></td>
		<td><xsl:value-of select="OrganizationPhoneNumber"/></td>
	      </tr>
	    </xsl:for-each>
	  </table>
	  <br />
	  <br />
	  <br />
	</xsl:template>

	<xsl:template match="ProjectSummaryScope" mode="scopetitle">
	  <p class="pagetitle">Scope</p>
	  <br />
	</xsl:template>

	<xsl:template match="ProjectSummaryScope" mode="scopetable">
	  <p class="pagetitle">Scope and Vision</p>

	  <table>
	    <tr> 
	      <td class="leftElement">Scope/Site Name</td>
		<xsl:if test="not(ProjectSummaryScopeShortProjectScope)">
		  <ProjectSummaryScopeShortProjectScope>Unspecified</ProjectSummaryScopeShortProjectScope>
		</xsl:if>
	      <td><xsl:value-of select="ProjectSummaryScopeShortProjectScope"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Scope/Site Description</td>
		<xsl:if test="not(ProjectSummaryScopeProjectScope)">
		  <ProjectSummaryScopeProjectScope>Unspecified</ProjectSummaryScopeProjectScope>
		</xsl:if>
	      <td><xsl:value-of select="ProjectSummaryScopeProjectScope"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Vision Statement Text</td>
		<xsl:if test="not(ProjectSummaryScopeProjectVision)">
		  <ProjectSummaryScopeProjectVision>Unspecified</ProjectSummaryScopeProjectVision>
		</xsl:if>
	      <td><xsl:value-of select="ProjectSummaryScopeProjectVision"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Comments</td>
		<xsl:if test="not(ProjectSummaryScopeScopeComments)">
		  <ProjectSummaryScopeScopeComments>Unspecified</ProjectSummaryScopeScopeComments>
		</xsl:if>
	      <td><xsl:value-of select="ProjectSummaryScopeScopeComments"/></td>
	    </tr>
	  </table>
	<!-- </xsl:template> -->

	<!-- <xsl:template match="ProjectSummaryScope" mode="scopetable"> -->
	  <p class="pagetitle">Biodiversity Features</p>

	  <table>
	    <tr> 
	      <td class="leftElement">Biodiversity Area (hectares)</td>
		<xsl:if test="not(ProjectSummaryScopeProjectArea)">
		  <ProjectSummaryScopeProjectArea>Unspecified</ProjectSummaryScopeProjectArea>
		</xsl:if>
		<td><xsl:value-of select="ProjectSummaryScopeProjectArea"/></td>
		<td>Notes: <xsl:value-of select="ProjectSummaryScopeProjectAreaNote"/></td>
	    </tr>
	  </table>

	  <p class="pagetitle">Human Stakeholders</p>

	  <table>
	    <tr> 
	      <td class="leftElement">Human Stakeholder Pop Size</td>
		<xsl:if test="not(ProjectSummaryScopeHumanPopulation)">
		  <ProjectSummaryScopeProjectArea>Unspecified</ProjectSummaryScopeProjectArea>
		</xsl:if>
		<td><xsl:value-of select="ProjectSummaryScopeHumanPopulation"/></td>
		<td>Notes: <xsl:value-of select="ProjectSummaryScopeHumanPopulationNotes"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Social Context</td>
		<xsl:if test="not(ProjectSummaryScopeHumanPopulation)">
		  <ProjectSummaryScopeProjectArea>Unspecified</ProjectSummaryScopeProjectArea>
		</xsl:if>
		<td></td>
		<td><xsl:value-of select="ProjectSummaryScopeSocialContext"/></td>
	    </tr>
	  </table>

	  <p class="pagetitle">Protected Area Information</p>

	  <table>
	    <tr> 
	      <td class="leftElement">Protected Area Categories</td>
	      <td><xsl:value-of select="ProjectSummaryScopeProtectedAreaCategoriesContainer"/>
	      <xsl:value-of select="ProjectSummaryScopeProtectedAreaCategoryNotes"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Legal Status</td>
	      <td><xsl:value-of select="ProjectSummaryScopeLegalStatus"/></td>
	    </tr>

	    <tr> 
	      <td class="leftElement">Legislative Context</td>
	      <td><xsl:value-of select="ProjectSummaryScopeLegislativeContext"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Physical Description</td>
	      <td><xsl:value-of select="ProjectSummaryScopePhysicalDescription"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Biological Description</td>
	      <td><xsl:value-of select="ProjectSummaryScopeBiologicalDescription"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Socio-Economic Information</td>
	      <td><xsl:value-of select="ProjectSummaryScopeSocioEconomicInformation"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Historical Description</td>
	      <td><xsl:value-of select="ProjectSummaryScopeHistoricalDescription"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Cultural Description</td>
	      <td><xsl:value-of select="ProjectSummaryScopeCulturalDescription"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Access Information</td>
	      <td><xsl:value-of select="ProjectSummaryScopeAccessInformation"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Visitation Information</td>
	      <td><xsl:value-of select="ProjectSummaryScopeVisitationInformation"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Current Land Uses</td>
	      <td><xsl:value-of select="ProjectSummaryScopeCurrentLandUses"/></td>
	    </tr>
	    <tr> 
	      <td class="leftElement">Management Resources</td>
	      <td><xsl:value-of select="ProjectSummaryScopeManagementResources"/></td>
	    </tr>
	  </table>
	</xsl:template>

</xsl:stylesheet>
