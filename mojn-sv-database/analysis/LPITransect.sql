CREATE VIEW [analysis].[LPITransect]
	AS
	SELECT	s.ParkCode AS Park,
			s.Code AS SpringCode,
			s.Name AS SpringName,
			sc.Label AS SpringCategory,
			vt.Label AS VisitType,
			CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
			CONVERT(VARCHAR(8), lpi.StartTime, 108) AS StartTime,
			CONVERT(VARCHAR(8), lpi.EndTime, 108) AS EndTime,
			lpi.TransectNumber AS TransectNumber,
			w.Code AS Wind,
			sky.Code AS SkyCondition,
			lpi.Notes,
			dpl.Label AS DataProcessingLevel,
			lpi.DataProcessingLevelDate,
			lpi.DataProcessingLevelNote

	FROM	data.Site AS s
			LEFT JOIN lookup.SpringCategory AS sc
			ON s.SpringCategoryID = sc.ID
			INNER JOIN data.Visit AS v
			ON v.SiteID = s.ID
			LEFT JOIN ref.Protocol AS p
			ON v.ProtocolID = p.ID
			LEFT JOIN lookup.VisitType AS vt
			ON v.VisitTypeID = vt.ID
			INNER JOIN data.LPIActivity AS lpi
			ON v.ID = lpi.VisitID
			LEFT JOIN lookup.Wind AS w
			ON lpi.WindID = w.ID
			LEFT JOIN lookup.SkyCondition AS sky
			ON lpi.SkyConditionID = sky.ID
			LEFT JOIN lookup.DataProcessingLevel AS dpl
			ON lpi.DataProcessingLevelID = dpl.ID
