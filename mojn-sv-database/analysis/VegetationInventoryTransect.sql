CREATE VIEW [analysis].[VegetationInventoryTransect]
	AS 
SELECT	s.ParkCode AS Park,
		s.Code AS SpringCode,
		s.Name AS SpringName,
		sc.Label AS SpringCategory,
		vt.Label AS VisitType,
		v.FieldSeason AS FieldSeason,
		CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
		CONVERT(VARCHAR(8), vi.StartTime, 108) AS StartTime,
		CONVERT(VARCHAR(8), vi.EndTime, 108) AS EndTime,
		vi.TransectNumber,
		vi.Notes,
		dpl.Label AS DataProcessingLevel,
		vi.DataProcessingLevelDate,
		vi.DataProcessingLevelNote

FROM	data.Site AS s
		LEFT JOIN lookup.SpringCategory AS sc
		ON s.SpringCategoryID = sc.ID
		INNER JOIN data.Visit AS v
		ON v.SiteID = s.ID
		LEFT JOIN lookup.VisitType AS vt
		ON v.VisitTypeID = vt.ID
		INNER JOIN data.VegetationInventoryActivity AS vi
		ON v.ID = vi.VisitID
		LEFT JOIN lookup.DataProcessingLevel AS dpl
		ON vi.DataProcessingLevelID = dpl.ID
		
