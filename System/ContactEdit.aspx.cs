using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_ContactEdit : System.Web.UI.Page
{
    #region declare
    private DataContact objContact = new DataContact();
    private SystemClass objSystemClass = new SystemClass();

    public int index = 0;
    public int itemId = 0;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.itemId = int.Parse(Request.QueryString["id"].ToString());
        }
        catch
        {
            objSystemClass.addMessage("Bạn cần chọn liện hệ");

            Response.Redirect("ContactList.aspx");
            return;
        }
        if (!Page.IsPostBack)
        {
            DataRow objData = this.objContact.getData(this.itemId);
            if (objData == null)
            {
                objSystemClass.addMessage("Không tìm thấy liên hệ");

                Response.Redirect("ContactList.aspx");
                return;
            }

            this.txtFullName.Text = objData["FullName"].ToString();
            this.txtEmail.Text = objData["Email"].ToString();
            this.txtAddress.Text = objData["Address"].ToString();
            //this.txtTitle.Text = objData["Title"].ToString();
            this.txtQuestion.Text = objData["Question"].ToString();
            this.txtContent.Text = objData["Answer"].ToString();
            txtPhone.Text = objData["Phone"].ToString();
            try
            {
                if((int)objData["NSTATUS"] == 2)
                    ckbState.Checked = true;
            }
            catch { }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.txtContent.Text.Trim() == "")
        {
            objSystemClass.addMessage("Bạn chưa nhập nội dung trả lời.");
            this.txtContent.Focus();
            return;
        }

        int ret = 0;
        try
        {
            DataSQL objSQL = new DataSQL("tblContact");

            objSQL["Id"] = itemId;
            objSQL["Answer"] = this.txtContent.Text;
            objSQL["NSTATUS"] = 2;
            objSQL["DayAnswer"] = DateTime.Now;

            ret = (int)objSQL.setData();
        }
        catch { }

        if (ret != 0)
        {
            objSystemClass.addMessage("Cập nhật thành công!");
        }
        else
        {
            objSystemClass.addMessage("Có lỗi xảy ra!");
        }

        //this.objContact.setData(this.itemId, this.txtContent.Text, this.ckbState.Checked, DateTime.Now, 0);

        //Response.Redirect("ContactList.aspx");
    }
}