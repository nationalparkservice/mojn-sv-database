CREATE VIEW [analysis].[LPIDisturbance]
	AS
	SELECT	s.ParkCode AS Park,
			s.Code AS SpringCode,
			s.Name AS SpringName,
			sc.Label AS SpringCategory,
			vt.Label AS VisitType,
			CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
			lpi.TransectNumber AS TransectNumber,
			lpt.LocationOnTape_m,
			da.Label AS DataAccuracy,
			lpt.Water AS WaterPresent,
			d.Code AS DisturbanceCode,
			d.Label AS DisturbanceDescription,
			dpl.Label AS DataProcessingLevel

	FROM	data.Site AS s
			LEFT JOIN lookup.SpringCategory AS sc
			ON s.SpringCategoryID = sc.ID
			INNER JOIN data.Visit AS v
			ON v.SiteID = s.ID
			LEFT JOIN lookup.VisitType AS vt
			ON v.VisitTypeID = vt.ID
			INNER JOIN data.LPIActivity AS lpi
			ON v.ID = lpi.VisitID
			LEFT JOIN lookup.DataProcessingLevel AS dpl
			ON lpi.DataProcessingLevelID = dpl.ID
			LEFT JOIN data.LPIPoint AS lpt
			ON lpt.LPIActivityID = lpi.ID
			LEFT JOIN lookup.DataAccuracy AS da
			ON lpt.DataAccuracyID = da.ID
			LEFT JOIN data.LPIDisturbance AS lpd
			ON lpt.ID = lpd.LPIPointID
			LEFT JOIN lookup.DisturbanceType AS d
			ON lpd.DisturbanceTypeID = d.ID

