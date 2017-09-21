using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataProduct
/// </summary>
public class DataProduct :DataClass
{
    #region method getData
    public DataRow getData(int id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE ID = @ID";
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
    public DataTable getList(int group = 0, String seach = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT P.ID,P.NAME,P.PRICE,G.NAME AS GroupName,PL.NAME AS STATUS FROM tblProduct AS P";
            Cmd.CommandText += " LEFT JOIN tblStatus AS PL ON P.NSTATUS = PL.ID";
            Cmd.CommandText += " LEFT JOIN tblCategory AS G ON P.GROUPID = G.ID";
            Cmd.CommandText += " WHERE 1=1";

            if (group != 0)
            {
                Cmd.CommandText += " AND P.GROUPID = @GROUP";
                Cmd.Parameters.Add("GROUP", SqlDbType.Int).Value = group;
            }

            if (seach != null && seach != "")
            {
                Cmd.CommandText += " AND UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
                Cmd.Parameters.Add("Seach", SqlDbType.NVarChar).Value = seach;
            }

            Cmd.CommandText += " ORDER BY DayPost DESC";

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
    public int addData(String title, int catid, float price, String shortcontent, String content, String img, String author = "", bool NoiBat = false)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "INSERT INTO [tblProduct]([NAME],[GROUPID],[DESCRIBE],[CONTENT],[IMG],[Author],UserPost,NoiBat,PRICE) OUTPUT INSERTED.ID";
            Cmd.CommandText += " VALUES (@NAME,@GROUPID,@DESCRIBE,@CONTENT,@IMG,@AUTHOR,@USERPOST,@NoiBat,@PRICE)";

            Cmd.Parameters.Add("NAME", SqlDbType.NVarChar).Value = title;
            Cmd.Parameters.Add("GROUPID", SqlDbType.Int).Value = catid;
            Cmd.Parameters.Add("DESCRIBE", SqlDbType.NVarChar).Value = shortcontent;
            Cmd.Parameters.Add("CONTENT", SqlDbType.NText).Value = content;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("AUTHOR", SqlDbType.NVarChar).Value = author;
            Cmd.Parameters.Add("NoiBat", SqlDbType.Bit).Value = NoiBat;
            Cmd.Parameters.Add("PRICE", SqlDbType.Float).Value = price;


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
    public int UpdateData(int id, String title, int catid, float price, String shortcontent, String content, String img, String author = "", bool NoiBat = false)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "UPDATE tblProduct SET NAME = @NAME, GROUPID = @GROUPID,DESCRIBE = @DESCRIBE ,CONTENT = @CONTENT, IMG = @IMG,Author = @AUTHOR, [UserEdit] = @USEREDIT, [DayEdit] = GETDATE(),NoiBat = @NoiBat,PRICE = @PRICE OUTPUT INSERTED.ID WHERE ID = @ID";

            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;
            Cmd.Parameters.Add("NAME", SqlDbType.NVarChar).Value = title;
            Cmd.Parameters.Add("GROUPID", SqlDbType.Int).Value = catid;
            Cmd.Parameters.Add("DESCRIBE", SqlDbType.NVarChar).Value = shortcontent;
            Cmd.Parameters.Add("CONTENT", SqlDbType.NText).Value = content;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("AUTHOR", SqlDbType.NVarChar).Value = author;
            Cmd.Parameters.Add("NoiBat", SqlDbType.Bit).Value = NoiBat;
            Cmd.Parameters.Add("PRICE", SqlDbType.NVarChar).Value = price;

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
            Cmd.CommandText = "DELETE FROM tblProduct WHERE ID = @ID";
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
    public int getDataCount(int group = 0, bool NoiBat = false, String seach = "")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT TOP 1 COUNT(*) FROM tblProduct AS P WHERE P.NSTATUS != 2";

            if (group != 0)
            {
                Cmd.CommandText += " AND P.GROUPID = @GROUP";
                Cmd.Parameters.Add("GROUP", SqlDbType.Int).Value = group;
            }

            if (NoiBat)
            {
                Cmd.CommandText += " AND P.NoiBat = 1";
            }

            if (seach != null && seach != "")
            {
                Cmd.CommandText += " AND UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
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
    public DataTable getDataTop(int limit = 0, int group = 0, int page = 1, bool NoiBat = false, String seach = "", String sapXep = "DESC")
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

            Cmd.CommandText += "SELECT " + top + " P.ID,P.NAME,P.PRICE,P.[DESCRIBE],P.IMG,G.NAME AS GroupName,P.DayPost,(ROW_NUMBER() OVER(ORDER BY DayPost " + sapXep + ")) AS RowNum FROM tblProduct AS P";
            Cmd.CommandText += " LEFT JOIN tblCategory AS G ON P.GROUPID = G.ID";
            Cmd.CommandText += " WHERE P.NSTATUS != 2 AND G.NSTATUS = 1";

            if (group != 0)
            {
                Cmd.CommandText += " AND P.GROUPID = @GROUP";
                Cmd.Parameters.Add("GROUP", SqlDbType.Int).Value = group;
            }

            if (NoiBat)
            {
                Cmd.CommandText += " AND P.NoiBat = 1";
            }

            if (seach != null && seach != "")
            {
                Cmd.CommandText += " AND UPPER(RTRIM(LTRIM(P.NAME))) LIKE  N'%'+UPPER(RTRIM(LTRIM(@Seach)))+'%'";
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