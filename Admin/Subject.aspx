<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="QuanLyTTNN.Admin.Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Quan Ly Mon Hoc</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtSubjectName">Ten Mon Hoc</label>
                    <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control" placeholder="Nhap Ten Mon" required></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="txtLevel">Cap Do</label>
                    <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control" placeholder="Nhap Cap Do" required></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="txtNOSession">So Buoi</label>
                    <asp:TextBox ID="txtNOSession" runat="server" CssClass="form-control" placeholder="Nhap So Buoi" required></asp:TextBox>
                </div>

            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#EF4056" Text="Them Mon Hoc" OnClick="btnAdd_Click" />
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="MaMonHoc, TenMonHoc, CapDo" AutoGenerateColumns="False"
                        EmptyDataText="No Record to display!" AllowPaging="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSubjectEdit" runat="server" Text='<%# Eval("TenMonHoc") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("TenMonHoc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Level">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLevelEdit" runat="server" Text='<%# Eval("CapDo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLevel" runat="server" Text='<%# Eval("CapDo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="NumberOfSessions">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNOSessionEdit" runat="server" Text='<%# Eval("SoBuoi") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNOSession" runat="server" Text='<%# Eval("SoBuoi") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
                        </Columns>
                        <HeaderStyle BackColor="#EF4056" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
