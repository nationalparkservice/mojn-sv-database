CREATE VIEW [analysis].[Spring]
	AS 
	SELECT	s.ParkCode AS Park,
			s.Code AS SpringCode,
			s.Name AS SpringName,
			sc.Label AS SpringCategory,
			ps.Code AS ProtectedStatus,
			s.TransectLength_m,
			s.PointInterceptSpacing_m,
			lc.SpringLength AS LengthClass,
			s.TransectBearing,
			s.AccessDirections,
			s.Notes

	FROM	data.Site AS s
			LEFT JOIN lookup.SpringCategory AS sc
			ON s.SpringCategoryID = sc.ID
			LEFT JOIN lookup.ProtectedStatus AS ps
			ON s.ProtectedStatusID = ps.ID
			LEFT JOIN lookup.LengthClass AS lc
			ON s.LengthClassID = lc.Class
