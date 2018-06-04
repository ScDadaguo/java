package servlet;

import Entity.Filename;
import SQL.listDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/Servlet_Upload")
public class Servlet_Upload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        从request当中获取流信息
        InputStream fileSource= request.getInputStream();
        String tempFileName="D:/tempFile";
//        tempFile指向临时文件
        File tempFile=new File(tempFileName);
//        outputStreamwen文件输出流指向这个临时文件
        FileOutputStream outputStream =new FileOutputStream(tempFile);
        byte b[]=new byte[1024];
        int n;
        while ((n=fileSource.read(b))!=-1){
            outputStream.write(b,0,n);
        }
//        关闭输出流，输入流
        outputStream.close();
        fileSource.close();

//        获取上传文件的名称
        RandomAccessFile randomFile =new RandomAccessFile(tempFile,"r");
        randomFile.readLine();
//        String str=randomFile.readLine();
//        int beginIndex=str.lastIndexOf("\\")+1;
//        int endIndex=str.lastIndexOf("\"");
//        String filename=str.substring(beginIndex,endIndex);
        String s=randomFile.readLine();
        int endindex=s.lastIndexOf("\"");
        String tmp = s.substring(0,s.lastIndexOf("\""));
        int index=tmp.lastIndexOf("\"")+1      ;
        String filename=tmp.substring(index,endindex);


        System.out.println("filename:"+filename);
//        -------------------------------------------------------
//        把文件名字插入数据库
        int num=0;
        Filename filename1 = new Filename();
        filename1.setFilename(filename);
//        int num = 0;

        listDao listDao = new listDao();
        num = listDao.insert(filename1);


//        ---------------------------------------------------------
//        重新定位文件指针到文件头
        randomFile.seek(0);
        long startPositon=0;
        int i=1;
//        获取文件内容的开始位置
        while ((n=randomFile.readByte())!=-1&&i<=4){
            if(n=='\n'){
                startPositon=randomFile.getFilePointer();
                i++;
            }
        }
        startPositon =startPositon-1;
//     获取文件内容结束位置
        randomFile.seek(randomFile.length());
        long endPosition =randomFile.getFilePointer();
        int j=1;
        while (endPosition>=0&&j<=2){
            endPosition--;
            randomFile.seek(endPosition);
            if(randomFile.readByte()=='\n'){
                j++;
            }
        }
        endPosition=endPosition-1;
//        设置保存上传文件的路径
        String realPath=getServletContext().getRealPath("/")+"images";

//        String realPath="C:\\Users\\a\\IdeaProjects\\文件下载与上传\\web\\images";
        File fileupload=new File(realPath);
        if(!fileupload.exists()){
            fileupload.mkdir();
        }
        File saveFile=new File(realPath,filename);
        RandomAccessFile randomAccessFile =new RandomAccessFile(saveFile,"rw");
//        从临时文件当中读取文件内容（根据起始位置获取）
        randomFile.seek(startPositon);
        while (startPositon<endPosition){
            randomAccessFile.write(randomFile.readByte());
            startPositon=randomFile.getFilePointer();
        }
//        关闭输入输出，删除临时文件
        randomAccessFile.close();
        randomFile.close();
        tempFile.delete();

        request.setAttribute("result","上传成功！");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
