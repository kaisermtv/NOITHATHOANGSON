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
    public DataRow getData(string id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT * FROM tblProtect WHERE MA = @ID";
            Cmd.Parameters.Add("ID", SqlDbType.NVarChar).Value = id;

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
    public string addData(string ma, string name, string img, string address, string content)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "INSERT INTO [tblProtect]([MA],[NAME],[IMG],[ADDRESS],[DESCRIBE],[CreateDate]) OUTPUT INSERTED.MA";
            Cmd.CommandText += " VALUES (@MA,@NAME,@IMG,@ADDRESS,@DESCRIBE,GETDATE())";

            Cmd.Parameters.Add("MA", SqlDbType.NVarChar).Value = ma;
            Cmd.Parameters.Add("NAME", SqlDbType.NVarChar).Value = name;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("ADDRESS", SqlDbType.NText).Value = address;
            Cmd.Parameters.Add("DESCRIBE", SqlDbType.NVarChar).Value = content;

            string ret = (string)Cmd.ExecuteScalar();

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return "";
        }
    }
    #endregion

    #region Method UpdateData
    public string UpdateData(string ma, string name, string img, string address, string content)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "UPDATE tblProtect SET MA = @MA, NAME = @NAME,IMG = @IMG ,ADDRESS = @ADDRESS, DESCRIBE = @DESCRIBE OUTPUT INSERTED.MA WHERE MA = @MA";

            Cmd.Parameters.Add("MA", SqlDbType.NVarChar).Value = ma;
            Cmd.Parameters.Add("NAME", SqlDbType.NVarChar).Value = name;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("ADDRESS", SqlDbType.NText).Value = address;
            Cmd.Parameters.Add("DESCRIBE", SqlDbType.NVarChar).Value = content;
            
            string ret = (string)Cmd.ExecuteScalar();

            this.SQLClose();
            return ret;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return "";
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