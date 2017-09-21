using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewsGroup
/// </summary>
public class DataCategory : DataClass
{
    #region method getData
    public DataRow getData(int id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT * FROM tblCategory WHERE ID = @ID";
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

    #region method getNameById
    public String getNameById(int ID)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT NAME FROM tblCategory WHERE ID = @ID";
            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = ID;

            String ret = (String)Cmd.ExecuteScalar();

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

    #region method getNameById
    public DataTable getNameById(int[] id)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT ID,NAME FROM tblCategory";

            if(id != null)
            {
                Cmd.CommandText += " WHERE ID IN(";
                for (int i = 0; i < id.Length; i++)
                {
                    if (i != 0) Cmd.CommandText += ",";
                    Cmd.CommandText += id[i].ToString();
                }

                Cmd.CommandText += ")";
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

    #region method getList
    public DataTable getList(int state = -1)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT P.ID,P.NAME,P.IMG,P.[DESCRIBE],PL.NAME AS STATUS FROM tblCategory AS P LEFT JOIN tblStatus AS PL ON P.NSTATUS = PL.ID";

            if(state != -1)
            {
                Cmd.CommandText += " WHERE P.NSTATUS = @NSTATUS";
                Cmd.Parameters.Add("NSTATUS", SqlDbType.Int).Value = state;
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

    #region Method getDataToCombobox
    public DataTable getDataToCombobox(String kcstr = "Không chọn")
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT ID,NAME FROM tblCategory WHERE NSTATUS != 2";

            DataTable ret = this.findAll(Cmd);

            this.SQLClose();

            if (kcstr != null && kcstr != "") { ret.Rows.Add(0, kcstr); }

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

    #region method setData
    public int setData(int id,string img, String Name, String Describe,int trangthai)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "IF NOT EXISTS (SELECT * FROM tblCategory WHERE ID = @ID)";
            Cmd.CommandText += " BEGIN INSERT INTO tblCategory(NAME,IMG,DESCRIBE,NSTATUS) OUTPUT INSERTED.ID VALUES (@NAME,@IMG,@DESCRIBE,@NSTATUS) END";
            Cmd.CommandText += " ELSE BEGIN UPDATE tblCategory SET NAME = @NAME, IMG = @IMG, DESCRIBE = @DESCRIBE, NSTATUS = @NSTATUS OUTPUT INSERTED.ID WHERE ID = @ID END";

            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;
            Cmd.Parameters.Add("NAME", SqlDbType.NVarChar).Value = Name;
            Cmd.Parameters.Add("IMG", SqlDbType.NVarChar).Value = img;
            Cmd.Parameters.Add("DESCRIBE", SqlDbType.NVarChar).Value = Describe;
            Cmd.Parameters.Add("NSTATUS", SqlDbType.Int).Value = trangthai;

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
            Cmd.CommandText = "DELETE FROM tblCategory WHERE ID = @ID";
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

    #region Method getLinkById
    public string getLinkById(int id)
    {
        DataRow objData = getData(id);
        if (objData != null)
        {
            return "/" + SystemClass.convertToUnSign2(objData["NAME"].ToString()) + "-pg" + objData["ID"].ToString();
        }
        else
        {
            return null;
        }
    }
    #endregion
}