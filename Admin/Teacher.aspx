<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="QuanLyTTNN.Admin.Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Quan Ly Giao Vien</h3>

            <%--ten va ngay sinh--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtTeacherName">Ten Giao Vien</label>
                    <asp:TextBox ID="txtTeacherName" runat="server" CssClass="form-control" placeholder="Nhap Ten Giao Vien" required>
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be in Characters"
                        ForceColor="Red" ValidationExpression="^[A-Za-z\s]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtTeacherName">
                    </asp:RegularExpressionValidator>
                </div>

                <div class="col-md-6">
                    <label for="txtDoB">Ngay Sinh</label>
                    <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required>
                    </asp:TextBox>
                </div>
            </div>

            <%-- so dien thoai va gioi tinh--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlGender">Gioi Tinh</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Chon Gioi Tinh</asp:ListItem>
                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nu</asp:ListItem>
                        <asp:ListItem>Khac</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Yeu Cau Chon Gioi Tinh!"
                        ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Chon Gioi Tinh">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtMobile">So Dien Thoai</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="Nhap So Dien Thoai" required>
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="So Dien Thoai Khong Hop"
                        ForceColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                    </asp:RegularExpressionValidator>
                </div>

            </div>

            <%-- email --%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

                <div class="col-md-6">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhap Email" TextMode="Email" required>
                    </asp:TextBox>
                </div>

            </div>

            <%--dia chi--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-12">
                    <label for="txtAddress">Dia Chi</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhap Dia Chi" TextMode="MultiLine" required>
                    </asp:TextBox>
                </div>
            </div>

            <%--button--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#EF4056" Text="Them Giao Vien" OnClick="btnAdd_Click" />
                </div>
            </div>

            <%--gridview--%>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="MaGiaoVien" AutoGenerateColumns="False"
                        EmptyDataText="No Record to display!" AllowPaging="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        OnRowDeleting="GridView1_RowDeleting" >
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTeacherName" runat="server" Text='<%# Eval("TenGiaoVien") %>' CssClass="form-control"
                                        Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("TenGiaoVien") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"/>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("SDT") %>' CssClass="form-control"
                                        Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("SDT") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("DiaChi") %>'  CssClass="form-control"
                                        Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="true" ShowDeleteButton="true" />
                        </Columns>
                        <HeaderStyle BackColor="#EF4056" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
