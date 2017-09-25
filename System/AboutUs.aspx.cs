using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_AboutUs : System.Web.UI.Page
{
    DataSetting objSetting = new DataSetting();

    protected void Page_Load(object sender, EventArgs e)
    {
        Context.Items["strTitle"] = "THÔNG TIN ĐƠN VỊ";

        if(!Page.IsPostBack)
        {
            this.textDomain.Text = objSetting.getValue("Domain");
            this.txtName.Text = objSetting.getValue("Name");
            this.txtMaSoThue.Text = objSetting.getValue("MaSoThue");
            this.txtAddress.Text = objSetting.getValue("Address");
            this.txtAddrenShowroom.Text = objSetting.getValue("AddressShowroom");
            this.txtPhone.Text = objSetting.getValue("Phone");
            this.txtEmail.Text = objSetting.getValue("Email");
            this.txtHotline.Text = objSetting.getValue("Hotline");
            this.txtGioiThieu.Text = objSetting.getValue("GioiThieu");
        }
        else
        {
            objSetting.setValue("Domain", this.textDomain.Text);
            objSetting.setValue("Name", this.txtName.Text);
            objSetting.setValue("MaSoThue", this.txtMaSoThue.Text);
            objSetting.setValue("Address", this.txtAddress.Text);
            objSetting.setValue("AddressShowroom", this.txtAddrenShowroom.Text);
            objSetting.setValue("Phone", this.txtPhone.Text);
            objSetting.setValue("Email", this.txtEmail.Text);
            objSetting.setValue("Hotline", this.txtHotline.Text);
            objSetting.setValue("GioiThieu", this.txtGioiThieu.Text);

            SystemClass objSystemClass = new SystemClass();
            objSystemClass.addMessage("Lưu thông tin thành công!");
        }
        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
    }
}