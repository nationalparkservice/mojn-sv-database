CREATE VIEW [app].[DataGateway]
AS
SELECT        S.ID AS SiteID, V.ID AS VisitID, S.Code AS SiteCode, S.Name AS SiteName, P.Code AS ParkCode, 'NA' AS Subunit, V.VisitDate, Year(V.VisitDate) AS VisitGroup, 
                         lookup.VisitType.Code AS SiteStatus, lookup.SpringCategory.Code AS SampleFrame, DPL.Label AS DPL, lookup.ProtectedStatus.Label AS SiteProtectedStatus, S.ParkID, V.DataProcessingLevelID, 
                         S.SpringCategoryID AS SampleFrameID
FROM            data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.SpringCategory ON S.SpringCategoryID = lookup.SpringCategory.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
						 lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON V.DataProcessingLevelID = DPL.ID

;