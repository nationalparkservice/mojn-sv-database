CREATE VIEW app.[ActivityDashboard]
AS
SELECT        'Intro' AS Activity, lookup.VisitType.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, lookup.DataProcessingLevel.ProcessOrder, data.Visit.StartDate AS Date, data.Visit.ID AS VisitID
FROM            data.Visit INNER JOIN
                         lookup.DataProcessingLevel ON data.Visit.DataProcessingLevelID = lookup.DataProcessingLevel.ID INNER JOIN
                         lookup.VisitType ON data.Visit.VisitTypeID = lookup.VisitType.ID
UNION
SELECT        'LPI' AS Activity, 'T' + CAST(data.LPIActivity.TransectNumber AS VARCHAR(2)) AS Status, lookup.DataProcessingLevel.Label AS DPL, lookup.DataProcessingLevel.ProcessOrder, data.Visit.StartDate AS Date, 
                         data.Visit.ID AS VisitID
FROM            data.Visit INNER JOIN
                         data.LPIActivity ON data.Visit.ID = data.LPIActivity.VisitID INNER JOIN
                         lookup.DataProcessingLevel ON data.LPIActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID
UNION
SELECT        'Inventory' AS Activity, 'T' + CAST(data.VegetationInventoryActivity.TransectNumber AS VARCHAR(2)) AS Status, lookup.DataProcessingLevel.Label AS DPL, lookup.DataProcessingLevel.ProcessOrder, 
                         data.Visit.StartDate AS Date, data.Visit.ID AS VisitID
FROM            data.Visit INNER JOIN
                         data.VegetationInventoryActivity ON data.Visit.ID = data.VegetationInventoryActivity.VisitID INNER JOIN
                         lookup.DataProcessingLevel ON data.VegetationInventoryActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID
UNION
SELECT        'TreeCount' AS Activity, 'T' + CAST(data.TreeCountActivity.TransectNumber AS VARCHAR(2)) AS Status, lookup.DataProcessingLevel.Label AS DPL, lookup.DataProcessingLevel.ProcessOrder, data.Visit.StartDate AS Date, 
                         data.Visit.ID AS VisitID
FROM            data.Visit INNER JOIN
                         data.TreeCountActivity ON data.Visit.ID = data.TreeCountActivity.VisitID INNER JOIN
                         lookup.DataProcessingLevel ON data.TreeCountActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID
UNION
SELECT        'Photos' AS Activity, 'Yes' AS Status, lookup.DataProcessingLevel.Label AS DPL, lookup.DataProcessingLevel.ProcessOrder, data.Visit.StartDate AS Date, data.Visit.ID AS VisitID
FROM            data.Visit INNER JOIN
                         data.PhotoActivity ON data.Visit.ID = data.PhotoActivity.VisitID INNER JOIN
                         lookup.DataProcessingLevel ON data.PhotoActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'VIEW', @level1name = N'ActivityDashboard';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Visit (data)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataProcessingLevel (lookup)"
            Begin Extent = 
               Top = 6
               Left = 299
               Bottom = 211
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 6
               Left = 507
               Bottom = 136
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1935
         Width = 990
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'VIEW', @level1name = N'ActivityDashboard';

