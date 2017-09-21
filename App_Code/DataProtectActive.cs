using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataProtectActive
/// </summary>
public class DataProtectActive : DataClass
{
    #region method getData
    public DataRow getData(int id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT * FROM tblProtect WHERE MA = @ID";
            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;

            DataRow ret = this.findFirst(Cmd);

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return null;
        }
    }
    #endregion

    #region method getList
    public DataTable getList( String seach = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT P.MA,P.NAME,P.CreateDate FROM tblProtect AS P";

            if (seach != null && seach != "")
            {
                Cmd.CommandText += " WHERE UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
                Cmd.Parameters.Add("Seach", SqlDbType.NVarChar).Value = seach;
            }

            Cmd.CommandText += " ORDER BY CreateDate DESC";

            DataTable ret = this.findAll(Cmd);

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return null;
        }
    }
    #endregion

    #region Method addData
    public int addData(String title, int catid, String shortcontent, String content, String img, String author, bool NoiBat = false, String tag = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "INSERT INTO [tblProtect]([MA],[NAME],[IMG],[ADDRESS],[DESCRIBE],[CreateDate]) OUTPUT INSERTED.ID";
            Cmd.CommandText += " VALUES (@MA,@NAME,@IMG,@ADDRESS,@DESCRIBE,@CreateDate)";

            Cmd.Parameters.Add("TITLE", SqlDbType.NVarChar).Value = title;
            Cmd.Parameters.Add("GROUP", SqlDbType.Int).Value = catid;
            Cmd.Parameters.Add("SHORTCONTENT", SqlDbType.NVarChar).Value = shortcontent;
            Cmd.Parameters.Add("CONTENT", SqlDbType.NText).Value = content;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("AUTHOR", SqlDbType.NVarChar).Value = author;
            Cmd.Parameters.Add("NoiBat", SqlDbType.Bit).Value = NoiBat;
            Cmd.Parameters.Add("tag", SqlDbType.NVarChar).Value = tag;


            SystemClass objSystemClass = new SystemClass();
            Cmd.Parameters.Add("USERPOST", SqlDbType.Int).Value = objSystemClass.getIDAccount();

            int ret = (int)Cmd.ExecuteScalar();

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return 0;
        }
    }
    #endregion

    #region Method UpdateData
    public int UpdateData(int id, String title, int catid, String shortcontent, String content, String img, String author, bool NoiBat = false, String tag = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "UPDATE tblNews SET Title = @TITLE, CatId = @GROUP,ShortContent = @SHORTCONTENT ,Content = @CONTENT, ImgUrl = @IMG,Author = @AUTHOR, [UserEdit] = @USEREDIT, [DayEdit] = GETDATE(),NoiBat = @NoiBat,tag = @tag OUTPUT INSERTED.Id WHERE Id = @ID";

            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;
            Cmd.Parameters.Add("TITLE", SqlDbType.NVarChar).Value = title;
            Cmd.Parameters.Add("GROUP", SqlDbType.Int).Value = catid;
            Cmd.Parameters.Add("SHORTCONTENT", SqlDbType.NVarChar).Value = shortcontent;
            Cmd.Parameters.Add("CONTENT", SqlDbType.NText).Value = content;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("AUTHOR", SqlDbType.NVarChar).Value = author;
            Cmd.Parameters.Add("NoiBat", SqlDbType.Bit).Value = NoiBat;
            Cmd.Parameters.Add("tag", SqlDbType.NVarChar).Value = tag;

            SystemClass objSystemClass = new SystemClass();
            Cmd.Parameters.Add("USEREDIT", SqlDbType.Int).Value = objSystemClass.getIDAccount();

            int ret = (int)Cmd.ExecuteScalar();

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return 0;
        }
    }
    #endregion

    #region method delData
    public void delData(int id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "DELETE FROM tblProtect WHERE MA = @ID";
            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;

            Cmd.ExecuteNonQuery();

            this.SQLClose();
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
        }
    }
    #endregion

    #region Method getDataCount
    public int getDataCount(String seach = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT TOP 1 COUNT(*) FROM tblProtect AS P";

            if (seach != null && seach != "")
            {
                Cmd.CommandText += " WHERE UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
                Cmd.Parameters.Add("Seach", SqlDbType.NVarChar).Value = seach;
            }


            int ret = (int)Cmd.ExecuteScalar();

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return 0;
        }
    }
    #endregion

    #region Method getDataTop()
    public DataTable getDataTop(int limit = 0, int page = 1, String seach = "", String sapXep = "DESC")
    {
        try
        {
            String top = "";

            SqlCommand Cmd = this.getSQLConnect();
            if (page < 1) page = 1;
            if (page > 1)
            {
                Cmd.CommandText = "SELECT * FROM (";

                page = (page - 1) * limit;
                limit += page;
            }

            if (limit != 0)
            {
                top = " TOP " + limit + " ";
            }

            Cmd.CommandText += "SELECT " + top + " P.MA,P.NAME,P.[ADDRESS],P.IMG,P.CreateDate,(ROW_NUMBER() OVER(ORDER BY CreateDate " + sapXep + ")) AS RowNum FROM tblProtect AS P";


            if (seach != null && seach != "")
            {
                Cmd.CommandText += " WHERE UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
                Cmd.Parameters.Add("Seach", SqlDbType.NVarChar).Value = seach;
            }

            //Cmd.CommandText += " ORDER BY P.DayPost DESC";

            if (page > 1)
            {
                Cmd.CommandText += " ) AS MyDerivedTable WHERE RowNum > @Offset";
                Cmd.Parameters.Add("Offset", SqlDbType.Int).Value = page;
            }


            DataTable ret = this.findAll(Cmd);

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return null;
        }

    }
    #endregion
}