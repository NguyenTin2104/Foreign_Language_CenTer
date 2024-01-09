<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="QuanLyTTNN.Admin.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Quan Ly Khoa Hoc</h3>

            <%--ten khoa hoc va so buoi--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtCourseName">Ten Khoa Hoc</label>
                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" placeholder="Nhap Ten Khoa Hoc" required>
                    </asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="txtNOSession">So Buoi</label>
                    <asp:TextBox ID="txtNOSession" runat="server" CssClass="form-control" placeholder="Nhap So Buoi" required></asp:TextBox>
                </div>
            </div>

            <%--ngay bat dau va ngay ket thuc--%>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtStart">Ngay Bat Dau</label>
                    <asp:TextBox ID="txtStart" runat="server" CssClass="form-control" TextMode="Date" required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label for="txtEnd">Ngay Ket Thuc</label>
                    <asp:TextBox ID="txtEnd" runat="server" CssClass="form-control" TextMode="Date" required>
                    </asp:TextBox>
                </div>
            </div>

            <%--mon hoc va do kho--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlSub">Mon Hoc</label>
                    <asp:DropDownList ID="ddlSub" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="form-control" ErrorMessage="Subject is required."
                        ControlToValidate="ddlSub" Display="Dynamic" ForeColor="Red" InitialValue="Chon Mon Hoc" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
               <div class="col-md-6">
                    <label for="ddlLevel">Cap Do</label>
                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="form-control" ErrorMessage="Level is required."
                        ControlToValidate="ddlLevel" Display="Dynamic" ForeColor="Red" InitialValue="Chon Cap Do" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
            </div>



            <%--button--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#EF4056" Text="Them Khoa Hoc" OnClick="btnAdd_Click" />
                </div>
            </div>

            <%--gridview--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="MaKhoaHoc" AutoGenerateColumns="False"
                        EmptyDataText="No Record to display!" AllowPaging="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        >
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCourseName" runat="server" Text='<%# Eval("TenKhoaHoc") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Eval("TenKhoaHoc") %>'></asp:Label>
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
                            <asp:BoundField DataField="TenMonHoc" HeaderText="Mon Hoc" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CapDo" HeaderText="Cap Do">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="true" ShowDeleteButton="true" />
                        </Columns>
                        <HeaderStyle BackColor="#EF4056" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
