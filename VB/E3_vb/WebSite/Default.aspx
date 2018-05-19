<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>

	<script language="javascript" type="text/javascript">
		var _selectNumber = 0;
		var _all = false;
		var _handle = true;

		function OnAllCheckedChanged(s, e) {
			if (s.GetChecked())
				grid.SelectRows();
			else
				grid.UnselectRows();
		}

		function OnGridSelectionChanged(s, e) {
			cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

			if (e.isChangedOnServer == false) {
				if (e.isAllRecordsOnPage && e.isSelected)
					_selectNumber = s.GetVisibleRowsOnPage();
				else if (e.isAllRecordsOnPage && !e.isSelected)
					_selectNumber = 0;
				else if (!e.isAllRecordsOnPage && e.isSelected)
					_selectNumber++;
				else if (!e.isAllRecordsOnPage && !e.isSelected)
					_selectNumber--;

				if (_handle) {
					cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
					_handle = false;
				}
				_handle = true;
			}
			else {
				cbPage.SetChecked(cbAll.GetChecked());
			}
		}

		function OnPageCheckedChanged(s, e) {
			_handle = false;
			if (s.GetChecked())
				grid.SelectAllRowsOnPage();
			else
				grid.UnselectAllRowsOnPage();
		}

		function OnGridEndCallback(s, e) {
			_selectNumber = s.cpSelectedRowsOnPage;
		}
	</script>

</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="sds"
			KeyFieldName="ProductID" ClientInstanceName="grid" OnCustomJSProperties="grid_CustomJSProperties">
			<Columns>
				<dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
					<HeaderTemplate>
						<dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
							BackColor="White" OnInit="cbAll_Init">
							<ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
						</dxe:ASPxCheckBox>
						<dxe:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
							OnInit="cbPage_Init">
							<ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
						</dxe:ASPxCheckBox>
					</HeaderTemplate>
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="5">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="7">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="8">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="9">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="10">
				</dxwgv:GridViewDataCheckColumn>
			</Columns>
			<ClientSideEvents SelectionChanged="OnGridSelectionChanged" EndCallback="OnGridEndCallback" />
		</dxwgv:ASPxGridView>
		<asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
	</div>
	</form>
</body>
</html>
