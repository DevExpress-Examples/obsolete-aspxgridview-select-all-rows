Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub cbAll_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim chk As ASPxCheckBox = TryCast(sender, ASPxCheckBox)
		Dim grid As ASPxGridView = (TryCast(chk.NamingContainer, GridViewHeaderTemplateContainer)).Grid
		chk.Checked = (grid.Selection.Count = grid.VisibleRowCount)
	End Sub

	Protected Sub cbPage_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim chk As ASPxCheckBox = TryCast(sender, ASPxCheckBox)
		Dim grid As ASPxGridView = (TryCast(chk.NamingContainer, GridViewHeaderTemplateContainer)).Grid

		Dim cbChecked As Boolean = True
		Dim start As Int32 = grid.VisibleStartIndex
		Dim [end] As Int32 = grid.VisibleStartIndex + grid.SettingsPager.PageSize
		If [end] > grid.VisibleRowCount Then
			[end] = (grid.VisibleRowCount)
		Else
			[end] = ([end])
		End If

		For i As Integer = start To [end] - 1
			If (Not grid.Selection.IsRowSelected(i)) Then
				cbChecked = False
				Exit For
			End If
		Next i

		chk.Checked = cbChecked
	End Sub

	Protected Sub grid_CustomJSProperties(ByVal sender As Object, ByVal e As ASPxGridViewClientJSPropertiesEventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)

		Dim start As Int32 = grid.VisibleStartIndex
		Dim [end] As Int32 = grid.VisibleStartIndex + grid.SettingsPager.PageSize
		Dim selectNumbers As Int32 = 0
		If [end] > grid.VisibleRowCount Then
			[end] = (grid.VisibleRowCount)
		Else
			[end] = ([end])
		End If

		For i As Integer = start To [end] - 1
			If grid.Selection.IsRowSelected(i) Then
				selectNumbers += 1
			End If
		Next i

		e.Properties("cpSelectedRowsOnPage") = selectNumbers
		e.Properties("cpVisibleRowCount") = grid.VisibleRowCount
	End Sub
End Class
