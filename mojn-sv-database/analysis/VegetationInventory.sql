CREATE VIEW [analysis].[VegetationInventory]
	AS 
SELECT	s.ParkCode AS Park,
		s.Code AS SpringCode,
		s.Name AS SpringName,
		sc.Label AS SpringCategory,
		vt.Label AS VisitType,
		v.FieldSeason AS FieldSeason,
		CONVERT(VARCHAR(10), v.StartDate, 101) AS StartDate,
		vi.TransectNumber,
		t.USDAPlantsCode AS USDAPlantsCode,
		t.ScientificName AS ScientificName,
		t.Invasive AS Invasive,
		u.Code AS UnknownPlantCode,
		vsp.Notes,
		dpl.Label AS DataProcessingLevel

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
		LEFT JOIN data.VegetationInventorySpecies AS vsp
		ON vi.ID = vsp.VegetationInventoryActivityID
		LEFT JOIN ref.Taxon AS t
		ON vsp.TaxonID = t.ID
		LEFT JOIN lookup.UnknownPlantCode u
		ON vsp.UnknownPlantCodeID = u.ID
		
