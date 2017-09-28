using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataSetting
/// </summary>
public class DataSetting :DataClass
{
    #region Cache
    private static Hashtable cache = new Hashtable();
    #endregion

    #region getValue(String key)
    public String getValue(String key)
    {
        try
        {
            if (cache.ContainsKey(key)) return (string)cache[key];

            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText = "SELECT [VALUE] FROM tblSetting WHERE STKEY = @STKEY";
            Cmd.Parameters.Add("STKEY", SqlDbType.NVarChar).Value = key;

            DataRow ret = this.findFirst(Cmd);

            this.SQLClose();

            if (ret != null)
            {
                cache[key] = ret["VALUE"].ToString(); // Lưu vào cache
                return ret["VALUE"].ToString();
            }

            return "";
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return "";
        }
    }

    #endregion

    #region setValue(String key,String value)

    public bool setValue(String key, int value)
    {
        return setValue(key, value.ToString());
    }

    public bool setValue(String key,String value)
    {
        try
        {
            SqlCommand Cmd = this.getSQLConnect();
            Cmd.CommandText  = "IF NOT EXISTS (SELECT * FROM tblSetting WHERE STKEY = @STKEY)";
            Cmd.CommandText += "BEGIN INSERT INTO tblSetting(STKEY,VALUE) VALUES(@STKEY,@VALUE) END ";
            Cmd.CommandText += "ELSE BEGIN UPDATE tblSetting SET [VALUE] = @VALUE WHERE STKEY = @STKEY END";
            Cmd.Parameters.Add("STKEY", SqlDbType.NVarChar).Value = key;
            Cmd.Parameters.Add("VALUE", SqlDbType.NVarChar).Value = value;

            Cmd.ExecuteNonQuery();

            this.SQLClose();

            if (cache.ContainsKey(key)) cache.Remove(key); // Xóa cache đối với "key"

            return true;
        }
        catch (Exception ex)
        {
            this.Message = ex.Message;
            this.ErrorCode = ex.HResult;
            return false;
        }
        
    }
    #endregion

    #region Method ClearCache()
    public void ClearCache()
    {
        cache.Clear(); // Xóa hết cache
    }
    #endregion
}