CREATE PROCEDURE [app].[UpdateTBDSpecies]
	@ConfirmedTaxonID int,
	@UnknownSpeciesID int,
	@SpringVisitID int
AS
	UPDATE
		lpi
	SET
		lpi.TaxonID = @ConfirmedTaxonID
	FROM	
	(SELECT	data.LPIActivity.VisitID,
			data.LPIActivity.TransectNumber,
			data.LPIPoint.LocationOnTape_m,
			data.LPIVegetation.TaxonID,
			data.LPIVegetation.UnknownPlantCodeID
	FROM	data.LPIPoint
			INNER JOIN data.LPIActivity
			ON data.LPIPoint.LPIActivityID = data.LPIActivity.ID
			INNER JOIN data.LPIVegetation
			ON data.LPIPoint.ID = data.LPIVegetation.LPIPointID) AS lpi
	WHERE	lpi.VisitID = @SpringVisitID AND lpi.UnknownPlantCodeID = @UnknownSpeciesID

	UPDATE
		lpisurface
	SET
		lpisurface.SurfaceTaxonID = @ConfirmedTaxonID
	FROM	
	(SELECT	data.LPIActivity.VisitID,
			data.LPIActivity.TransectNumber,
			data.LPIPoint.LocationOnTape_m,
			data.LPIPoint.SurfaceTaxonID,
			data.LPIPoint.SurfaceUnknownPlantCodeID
	FROM	data.LPIPoint
			INNER JOIN data.LPIActivity
			ON data.LPIPoint.LPIActivityID = data.LPIActivity.ID) AS lpisurface
	WHERE	lpisurface.VisitID = @SpringVisitID AND lpisurface.SurfaceUnknownPlantCodeID = @UnknownSpeciesID

	UPDATE
		tree
	SET
		tree.TaxonID = @ConfirmedTaxonID
	FROM	
	(SELECT	data.TreeCountActivity.VisitID,
			data.TreeCountActivity.TransectNumber,
			data.TreeCountSpecies.TaxonID,
			data.TreeCountSpecies.UnknownPlantCodeID
	FROM	data.TreeCountSpecies
			INNER JOIN data.TreeCountActivity
			ON data.TreeCountSpecies.TreeCountActivityID = data.TreeCountActivity.ID) AS tree
	WHERE	tree.VisitID = @SpringVisitID AND tree.UnknownPlantCodeID = @UnknownSpeciesID

	UPDATE
		inv
	SET
		inv.TaxonID = @ConfirmedTaxonID
	FROM	
	(SELECT	data.VegetationInventoryActivity.VisitID,
			data.VegetationInventoryActivity.TransectNumber,
			data.VegetationInventorySpecies.TaxonID,
			data.VegetationInventorySpecies.UnknownPlantCodeID
	FROM	data.VegetationInventorySpecies
			INNER JOIN data.VegetationInventoryActivity
			ON data.VegetationInventorySpecies.VegetationInventoryActivityID = data.VegetationInventoryActivity.ID) AS inv
	WHERE	inv.VisitID = @SpringVisitID AND inv.UnknownPlantCodeID = @UnknownSpeciesID

RETURN 0
