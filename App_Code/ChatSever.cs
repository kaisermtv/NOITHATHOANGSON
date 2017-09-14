using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;

/// <summary>
/// Summary description for ChatSever
/// </summary>
public class ChatSever
{
    #region static declare
    private static Thread SeverChat;
    public static Int32 listenport = 10000;
    private static IPAddress localAddr = IPAddress.Parse("127.0.0.1");
    private static TcpListener listener;
    #endregion

    #region Static Method RunChatSever()
    public static void RunChatSever()
    {
        if (SeverChat != null)
        {
            if (SeverChat.IsAlive) return;

            //SeverChat.Start();

            return;
        }

        try
        {
            SeverChat = new Thread(new ThreadStart(ChatSeverListener));
            SeverChat.Start();
        } catch
        {

        }
    }
    #endregion

    #region Static Method ChatSeverListener
    private static void ChatSeverListener()
    {
        listenport = 10000;
        while (listener == null)
        {
            try
            {
                listener = new TcpListener(localAddr, listenport);
            }catch{
                listenport++;

                if(listenport > 100000)
                {
                    break;
                }
            }
        }

        if (listener != null)
        {
            listener.Start();

            while (true)
            {
                try
                {
                    ChatSever objSever = new ChatSever(listener.AcceptSocket());

                    objSever.ClienThead = new Thread(new ThreadStart(objSever.ServiceClient));
                    objSever.ClienThead.Start();
                }
                catch //(Exception e)
                {
                    //Console.WriteLine(e.ToString());
                }
            }
        }
    }
    #endregion




    #region declare
    private Socket ClienSocket;
    private Thread ClienThead;
    private NetworkStream stream;
    #endregion

    #region Even ChatSever
    public ChatSever()
    {

    }

    public ChatSever(Socket s)
    {
        ClienSocket = s;
    }
    #endregion

    #region Method ReadDecode
    private string ReadDecode()
    {
        try {
            int BufSize = ClienSocket.Available;

            if (BufSize == 0) return null;

            Byte[] buffer = new Byte[BufSize];
            ClienSocket.Receive(buffer);

            //bufout = buffer;
            //ClienSocket.Send(buffer);

            if(buffer[0] == 129)
            {
                Int64 leng = buffer[1] - 128;
                int i = 2;

                if (leng == 126)
                {
                    leng = (buffer[3] << 8) + buffer[2];
                    i = 4;
                }else if (leng == 127)
                {
                    leng = (buffer[9] << 64) + (buffer[8] << 56) + (buffer[7] << 48) + (buffer[6] << 40) + (buffer[5] << 32) + (buffer[4] << 16) + (buffer[3] << 8) + buffer[2];
                    i = 10;
                }

                Byte[] key = new Byte[4] { buffer[i++], buffer[i++], buffer[i++], buffer[i++] };

                Byte[] decode = new Byte[leng];

                for (int x = 0; x < leng; x++)
                {
                    decode[x] = (Byte)(buffer[i++] ^ key[x % 4]);
                }

                return Encoding.UTF8.GetString(decode);
            }
            else
            {
                return "";
            }
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    #endregion

   // private Byte[] bufout;
    #region Method SendEncode
    public void SendEncode(string text)
    {
        try
            {
            int lengbuf = 1;
            int leng = text.Length;
            Byte[] length;
            if (leng < 126)
            {
                length = new Byte[1];
                length[0] = Convert.ToByte(leng);

                lengbuf += 1;
            }
            else if (text.Length <= 65535)
            {
                length = new Byte[3];
                length[0] = Convert.ToByte(126);

                length[1] = (byte)(leng & 0xff);
                length[2] = (byte)((leng >> 8) & 0xff);

                lengbuf += 3;
            }
            else
            {
                length = new Byte[9];
                length[0] = Convert.ToByte(127);

                length[1] = (byte)(leng & 0xff);
                length[2] = (byte)((leng >> 8) & 0xff);
                length[3] = (byte)((leng >> 16) & 0xff);
                length[4] = (byte)((leng >> 32) & 0xff);
                length[5] = (byte)((leng >> 40) & 0xff);
                length[6] = (byte)((leng >> 48) & 0xff);
                length[7] = (byte)((leng >> 56) & 0xff);
                length[8] = (byte)((leng >> 64) & 0xff);

                lengbuf += 9;
            }
            Byte[] txtByte = Encoding.UTF8.GetBytes(text);

            lengbuf += txtByte.Length;

        
            Byte[] BufOut = new Byte[lengbuf];

            int i = 0;

            BufOut[i++] = 129;

            foreach(byte item in length)
            {
                BufOut[i++] = item;
            }

            foreach (byte item in txtByte)
            {
                BufOut[i++] = item;
            }

            //Byte[] test = new Byte[17]{0x81,0xf,0x57,0x65,0x62,0x53,0x6f,0x63,0x6b,0x65,0x74,0x20,0x72,0x6f,0x63,0x6b,0x73};
            int a = ClienSocket.Send(BufOut);

        //ClienSocket.
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }
    #endregion

    #region Method ServiceClient
    private void ServiceClient()
    {
        try
        {
            int BufSize = ClienSocket.Available;
            Byte[] buffer = new Byte[BufSize];

            ClienSocket.Receive(buffer);

            string HeaderData = Encoding.UTF8.GetString(buffer);

            if (new Regex("^GET").IsMatch(HeaderData))
            {
                Byte[] response = Encoding.UTF8.GetBytes("HTTP/1.1 101 Switching Protocols" + Environment.NewLine
                    + "Connection: Upgrade" + Environment.NewLine
                    + "Upgrade: websocket" + Environment.NewLine
                    + "Sec-WebSocket-Accept: " + Convert.ToBase64String(
                        SHA1.Create().ComputeHash(
                            Encoding.UTF8.GetBytes(
                                new Regex("Sec-WebSocket-Key: (.*)").Match(HeaderData).Groups[1].Value.Trim() + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
                            )
                        )
                    ) + Environment.NewLine
                    + Environment.NewLine);

                ClienSocket.Send(response);
            }

            string clientcommand = null;

            while (clientcommand == null)
            {
                Thread.Sleep(100);

                clientcommand = ReadDecode();
            }
                

            //ClienSocket.Send(Encoding.UTF8.GetBytes(clientcommand));
            SendEncode(clientcommand);


            //dynamic stuff = JsonConvert.DeserializeObject(clientcommand);


            //string type = stuff.type;

            //switch(type)
            //{
            //    case "LoadWebChat":
            //        LoadWebChat(stuff);
            //        break;
            //    case "CreateRoom":
            //        CreateRoom(stuff);
            //        break;
            //}

            
        }
        catch (Exception ex)
        {
            string  m = ex.Message;
        }


        ClienSocket.Close();
    }
    #endregion

    #region Request Even CreateRoom
    private void CreateRoom(dynamic stuff)
    {

    }
    #endregion

    #region Request Even LoadWebChat
    private void LoadWebChat(dynamic stuff)
    {

    }
    #endregion
}