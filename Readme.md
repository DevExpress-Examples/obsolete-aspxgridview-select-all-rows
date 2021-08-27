<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/134059804/13.1.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1682)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# OBSOLETE - How to implement check boxes with SelectRows and SelectAllRowsOnPage features in a grid's template
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e1682)**
<!-- run online end -->


<p><strong>UPDATED:</strong><br /><br />Starting with version v2014 vol 1 (v14.1), this functionality is available out of the box:<br /><a href="https://www.devexpress.com/Support/Center/p/S173621">S173621: ASPxGridView - Add the built-in SelectAll CheckBox for Command Column</a><br /><br />Simply set the <strong>GridViewCommandColumn.SelectAllCheckboxMode</strong> property to <strong>GridViewSelectAllCheckBoxMode.AllPages</strong> to activate it. Please refer to the <a href="https://community.devexpress.com/blogs/aspnet/archive/2014/05/28/asp-net-gridview-select-all-rows-updated-coming-soon-in-v14-1.aspx">ASP.NET: GridView Select All Rows Updated</a> blog post and the <a href="http://demos.devexpress.com/ASPxGridViewDemos/Selection/AdvancedSelection.aspx">Select All Rows</a> demo for more information.<br /><br />If you have version v14.1+ available, consider using the built-in functionality instead of the approach detailed below.<br />If you need further clarification, create a new ticket in our Support Center. <br /><br />This example not only illustrates the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_SelectRowstopic131">ASPxClientGridView.SelectRows</a> and <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_SelectAllRowsOnPagetopic127">ASPxClientGridView.SelectAllRowsOnPage</a>, but also shows a way in which to implement these features with check boxes within a grid's templates.</p>

<br/>


