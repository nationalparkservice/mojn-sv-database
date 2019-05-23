CREATE VIEW [analysis].[SpringVisit]
	AS 
	SELECT	s.ParkCode AS Park,
			s.Code AS SpringCode,
			s.Name AS SpringName,
			sc.Label AS SpringCategory,
			vt.Label AS VisitType,
			CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
			CONVERT(VARCHAR(10), v.EndDate, 101) AS EndDate,
			p.ProtocolName AS ProtocolVersion,
			v.Notes,
			dpl.Label AS DataProcessingLevel,
			v.DataProcessingLevelDate,
			v.DataProcessingLevelNote

	FROM	data.Site AS s
			LEFT JOIN lookup.SpringCategory AS sc
			ON s.SpringCategoryID = sc.ID
			INNER JOIN data.Visit AS v
			ON v.SiteID = s.ID
			LEFT JOIN ref.Protocol AS p
			ON v.ProtocolID = p.ID
			LEFT JOIN lookup.VisitType AS vt
			ON v.VisitTypeID = vt.ID
			LEFT JOIN lookup.DataProcessingLevel AS dpl
			ON v.DataProcessingLevelID = dpl.ID
