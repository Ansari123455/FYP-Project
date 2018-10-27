<%@ Page Title="FYP Portal | View/Download Documents" Language="C#" MasterPageFile="~/ViewReports.master" AutoEventWireup="true" CodeFile="ViewDocuments.aspx.cs" Inherits="ViewDocuments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <br />
        <div style="margin-left:15px;">
            <h2>View/Download Uploaded Documents!!</h2>
            <p>Welcome! Here, you may View or Download the uploaded documents, template etc.</p>
        </div>
        <br />
        <fieldset>
        <legend>View/Download Documents!!</legend>
         <asp:GridView ID="gv_doc" runat="server" CellPadding="4" CellSpacing="2" AutoGenerateColumns="false"
                        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="100%"
                        OnRowDataBound="gvgrp_RowDataBound">
        <Columns>
        <asp:BoundField HeaderText="Sr.#" ReadOnly="true">
            <ItemStyle HorizontalAlign="Center" Width="2%" />
        </asp:BoundField>
        <asp:BoundField DataField="Doc_Description" HeaderText="Description" />
        <asp:BoundField DataField="FileLength" HeaderText="Document Size" />
        <asp:BoundField DataField="FileType" HeaderText="Document Format" />
        <asp:BoundField DataField="PostedDate" HeaderText="Upload Date & Time" />

        <asp:TemplateField HeaderText="View">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButtonTask" runat="server" CausesValidation="false" CommandArgument='<%#Eval("FileName")+ ";" +Eval("Doc_ID")%>' OnCommand="OpenPDF">View Attachment</asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
  
        <asp:TemplateField HeaderText="Download">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("FileName")+ ";" +Eval("Doc_ID")%>' OnCommand="LinkButton_Click" Text="Download Document"> </asp:LinkButton>  
            </ItemTemplate>
        </asp:TemplateField>

        </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center"/>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center"/>
                    </asp:GridView>

         <br />
         <div align="right" style="margin-right:5px;">
            <asp:Label ID="lbltotallogin" runat="server" Font-Bold="true" Text="Total Document(s): "></asp:Label>
            <asp:Label ID="lbltlogin" runat="server" Font-Bold="true"></asp:Label>
         </div>
        </fieldset>
        <br />
        <div align="center">
            <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
           <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <br />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

