CREATE VIEW [analysis].[TreeCount]
	AS 
	SELECT	s.ParkCode AS Park,
			s.Code AS SpringCode,
			s.Name AS SpringName,
			sc.Label AS SpringCategory,
			vt.Label AS VisitType,
			CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
			tree.TransectNumber,
			t.USDAPlantsCode AS USDAPlantsCode,
			t.ScientificName AS ScientificName,
			u.Code AS UnknownPlantCode,
			tsp.LiveAdultCount,
			tsp.LiveJuvenileCount,
			tsp.DeadAdultCount,
			tsp.DeadJuvenileCount,
			tsp.Notes,
			dpl.Label AS DataProcessingLevel

	FROM	data.Site AS s
			LEFT JOIN lookup.SpringCategory AS sc
			ON s.SpringCategoryID = sc.ID
			INNER JOIN data.Visit AS v
			ON v.SiteID = s.ID
			LEFT JOIN lookup.VisitType AS vt
			ON v.VisitTypeID = vt.ID
			INNER JOIN data.TreeCountActivity AS tree
			ON v.ID = tree.VisitID
			LEFT JOIN lookup.DataProcessingLevel AS dpl
			ON tree.DataProcessingLevelID = dpl.ID
			LEFT JOIN data.TreeCountSpecies tsp
			ON tree.ID = tsp.TreeCountActivityID
			LEFT JOIN lookup.UnknownPlantCode u
			ON tsp.UnknownPlantCodeID = u.ID
			LEFT JOIN ref.Taxon t
			ON tsp.TaxonID = t.ID
		
