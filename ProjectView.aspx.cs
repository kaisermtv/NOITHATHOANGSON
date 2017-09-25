using Novacode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectView : System.Web.UI.Page
{
    #region declare  
    public DataRow objData;
    public string itemId = "0";
    public int group = 0;
    public String groupname = "";
    #endregion

    #region Method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            itemId = RouteData.Values["Ma"].ToString();
            objData = new DataProtectActive().getData(itemId);

        }
        catch 
        {
            Response.Redirect("");
        }

    
    }
    #endregion

    #region Method CreateDocument
    public void CreateDocument(bool active = false)
    {
        if (active == false) return;

        string fileName = (@"D:\\" + this.itemId + ".docx");
        //   var doc = DocX.Create(fileName);
        string headlineText = objData["ShortContent"].ToString() + " ";
        string paraOne = "" + ((DateTime)objData["DayPost"]).ToString("dd/MM/yyyy h:mm:ss tt") + "\n" + "\n" +
           StripHTML(objData["Content"].ToString(), true) + " "
            ;
        // Format tiêu đề 
        var headLineFormat = new Formatting();
        headLineFormat.FontFamily = new System.Drawing.FontFamily("Arial");
        headLineFormat.Size = 18D;
        headLineFormat.Position = 12;

        // Format nội dung text
        var paraFormat = new Formatting();
        paraFormat.FontFamily = new System.Drawing.FontFamily("Arial");
        paraFormat.Size = 10;
        paraFormat.Spacing = 1;

        // Tạo tệp tin 
        var doc = DocX.Create(fileName);

        // Đưa nội dung vào file
        doc.InsertParagraph(headlineText, false, headLineFormat);
        doc.InsertParagraph(paraOne, false, paraFormat);

        // Save
        doc.Save();

        // Mở file
        Process.Start("WINWORD.EXE", fileName);
    }
    #endregion

    #region Method StripHTML
    public static string StripHTML(string HTMLText, bool decode = true)
    {
        Regex reg = new Regex("<[^>]+>", RegexOptions.IgnoreCase);
        var stripped = reg.Replace(HTMLText, "");
        return decode ? HttpUtility.HtmlDecode(stripped) : stripped;
    }
    #endregion

    #region Method btnDownload_Click
    protected void btnDownload_Click(object sender, ImageClickEventArgs e)
    {
        CreateDocument(true);
    }
    #endregion
}