using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    #region declare
    private DataSetting objSetting = new DataSetting();

    public String msg = "";
    //public String 

    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemClass.setMenuActive("contact");

        if (Request.RequestType == "POST")
        {
            try
            {
                if (Request.Form["name"] == "")
                {
                    msg = "Bạn cần nhập tên đầy đủ";
                    return;
                }

                if (Request.Form["title"] == "")
                {
                    msg = "Bạn cần nhập tiêu đề";
                    return;
                }

                if (Request.Form["noidung"] == "")
                {
                    msg = "Bạn cần nhập nội dung";
                    return;
                }

                DataSQL objSQL = new DataSQL("tblContact");
                objSQL["FullName"] = Request.Form["txtHoVaTen"];
                objSQL["Address"] = Request.Form["txtDiaChi"];
                objSQL["Phone"] = Request.Form["txtPhone"];
                objSQL["Question"] = Request.Form["txtContent"];

                int id = (int)objSQL.setData();
                if (id != 0)
                {
                    msg = "Cảm ơn bạn đã đóng góp ý kiến! chúng tổi sẽ liên lạc với bạn sau.";
                } else
                {
                    msg = "Có lỗi xảy ra! Xin thử lại.";
                }

                //SystemClass objSystem = new SystemClass();
            }
            catch { }

        }
        else
        {
            Response.Redirect("/");
        }
        
    }
    #endregion

    #region Method  getValue
    public String getValue(String key)
    {
        return objSetting.getValue(key);
    }
    #endregion
}