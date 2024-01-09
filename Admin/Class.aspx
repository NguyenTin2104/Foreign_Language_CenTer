<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="QuanLyTTNN.Admin.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Quan Ly Lop</h3>

            <%--ten Lop va so buoi--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtclassName">Ten Lop</label>
                    <asp:TextBox ID="txtclassName" runat="server" CssClass="form-control" placeholder="Nhap Ten Lop" required>
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
                <%--                <div class="col-md-6">
                    <label for="ddlLevel">Cap Do</label>
                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="form-control" ErrorMessage="Level is required."
                        ControlToValidate="ddlLevel" Display="Dynamic" ForeColor="Red" InitialValue="Chon Cap Do" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>--%>
                <div class="col-md-6">
                    <label for="ddlLevel">Cap Do</label>
                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-control" placeholder="Nhap Cap Do" required>
                        <asp:ListItem Value="0">Chon Cap Do</asp:ListItem>
                        <asp:ListItem Text="Co Ban" Value="Co Ban" />
                        <asp:ListItem Text="Nang Cao" Value="Nang Cao" />
                    </asp:DropDownList>
                </div>
            </div>

            <%--giao vien--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlTeacher">Giao Vien</label>
                    <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="form-control" ErrorMessage="Teacher is required."
                        ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Chon Giao Vien" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>

                </div>

                <%--            </div>--%>



                <%--button--%>
                <%--            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">--%>
                <div class="col-md-3 mt-auto">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#EF4056" Text="Them Lop" OnClick="btnAdd_Click" />
                </div>
            </div>

            <%--gridview--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="MaLop" AutoGenerateColumns="False"
                        EmptyDataText="No Record to display!" AllowPaging="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtclassName" runat="server" Text='<%# Eval("TenLop") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblclassName" runat="server" Text='<%# Eval("TenLop") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Teacher">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTeacher" runat="server" Text='<%# Eval("TenGiaoVien") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTeacher" runat="server" Text='<%# Eval("TenGiaoVien") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenMonHoc" HeaderText="Mon Hoc" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CapDo" HeaderText="Cap Do">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGiaoVien" HeaderText="Giao Vien">
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
