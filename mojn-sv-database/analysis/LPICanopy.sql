CREATE VIEW [analysis].[LPICanopy]
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
			l.Code AS Stratum,
			'Plant' AS CanopyType,
			t.USDAPlantsCode AS Canopy,
			t.ScientificName AS CanopyDescription,
			t.Invasive AS Invasive,
			u.Code AS UnknownPlantCode,
			d.ID AS IsDead,
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
			INNER JOIN data.LPIVegetation AS lpv
			ON lpv.LPIPointID = lpt.ID
			LEFT JOIN lookup.DataAccuracy AS da
			ON lpt.DataAccuracyID = da.ID
			LEFT JOIN ref.Taxon AS t
			ON lpv.TaxonID = t.ID
			LEFT JOIN lookup.UnknownPlantCode AS u
			ON lpv.UnknownPlantCodeID = u.ID
			LEFT JOIN lookup.Layer AS l
			ON lpv.LayerID = l.ID
			LEFT JOIN lookup.YesNoNoData AS d
			ON lpv.IsDeadID = d.ID

	UNION

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
			l.Code AS Stratum,
			'Other' AS CanopyType,
			c.Code AS CanopyCode,
			c.Label AS CanopyDescription,
			NULL AS Invasive,
			NULL AS UnknownPlantCode,
			NULL AS IsDead,
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
			INNER JOIN data.LPIOtherCanopy AS lpc
			ON lpc.LPIPointID = lpt.ID
			LEFT JOIN lookup.Layer AS l
			ON lpc.LayerID = l.ID
			LEFT JOIN lookup.CoverType AS c
			ON lpc.CoverTypeID = c.ID

	UNION

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
			NULL AS Stratum,
			'None' AS CanopyType,
			NULL AS Canopy,
			NULL AS CanopyDescription,
			NULL AS Invasive,
			NULL AS UnknownPlantCode,
			NULL AS IsDead,
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
			LEFT JOIN data.LPIVegetation AS lpv
			ON lpv.LPIPointID = lpt.ID
			LEFT JOIN data.LPIOtherCanopy AS lpo
			ON lpo.LPIPointID = lpt.ID
			LEFT JOIN lookup.DataAccuracy AS da
			ON lpt.DataAccuracyID = da.ID
			WHERE lpv.LPIPointID IS NULL AND lpo.LPIPointID IS NULL
