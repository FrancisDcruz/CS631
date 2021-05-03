import mysql.connector as mc
from tkinter import  ttk
from tkinter import  *
import tkinter as tk
from tkinter import Tk, Text, TOP, BOTH, X, N, LEFT
from datetime import datetime, timedelta


conn = mc.connect(
    host="127.0.0.1",
    user="root",
    password = "",
    database="library")


def getTable(tableName):
    output1.delete(0.0,END)
    try:
        QueryString="Select * from "+ tableName.upper()
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)


class FirstScreen(tk.Tk):
    def __init__(self,*args,**kwargs):
        tk.Tk.__init__(self,*args,**kwargs)
        container=tk.Frame(self)
        container.pack(side="top",fill="both",expand=True)
        container.grid_rowconfigure(0,weight=1)
        container.grid_columnconfigure(0,weight=1)

        self.frames={}
        for F in (StartPage,ReaderPage,AdminPage,AddReader):
            frame =F(container,self)
            self.frames[F] = frame
            frame.grid(row=0,column=0,sticky="nsew")
        self.show_frame(StartPage)

    def show_frame(self,cont):
        frame=self.frames[cont]
        frame.tkraise()

    def get_page(self, page_class):
        return self.frames[page_class]



class StartPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        h = Scrollbar(self, orient = 'horizontal')
        h.pack(side = BOTTOM, fill = X)
        self.controller=controller
        MMlabel10=Label(self, text="                         " )
        MMlabel10.pack()
        MMlabel11=Label(self, text="                         " )
        MMlabel11.pack()
        MMlabel1=Label(self, text=" Enter Your Reader Card Number: " )
        MMlabel1.pack()
        MMSearchQuery_textBox1 = Entry(self, width =20 )
        MMSearchQuery_textBox1.pack()
        MMbtn1=Button (self, text="Reader Menu", width =10,height=2, command=lambda:controller.show_frame(ReaderPage)) #command=popupReader
        MMbtn1.pack()
        MMlabel12=Label(self, text="                         " )
        MMlabel12.pack()
        MMlabel13=Label(self, text="                         " )
        MMlabel13.pack()
        self.MMlabel2=Label(self, text="Enter Your Admin ID: " )
        self.MMlabel2.pack()
        self.MMSearchQuery_textBox2 = Entry(self, width =20 )
        self.MMSearchQuery_textBox2.pack()
        self.MMlabel3=Label(self, text="Enter password " )
        self.MMlabel3.pack()
        self.MMSearchQuery_textBox3 = Entry(self, width =20 )
        self.MMSearchQuery_textBox3.pack()
        self.MMbtn1=Button (self, text="Admin Menu", width =10,height=2,command=self.popupadmin)
        self.MMbtn1.pack()
        quit=Button (self, text="Exit", width =10,height=2,command=FirstScreen.destroy)
        quit.pack()

    def popupReader():
        popup =tk.Tk()
        popup.wm_title("Login Success")
        popup.eval('tk::PlaceWindow . center')

        label= ttk.Label(popup, text="Login Success! Welcome Reader")
        label.pack()
        Btn = ttk.Button(popup, text="Okay", command=popup.destroy)
        Btn.pack()
        popup.geometry("300X300")
        popup.mainloop()

    def popupadmin(self):
        id=self.MMSearchQuery_textBox2.get()
        code=self.MMSearchQuery_textBox3.get()
        QueryString="SELECT EXISTS (SELECT * FROM admin WHERE id = "+id+ " AND code = "+str(code)+ ");"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            result = [item[0] for item in result]
            if str(result[0])=="1":
                print("aa")
                self.controller.show_frame(AdminPage)
            else:
                popup =tk.Tk()
                popup.wm_title("Login Success")
                popup.eval('tk::PlaceWindow . center')
                label2= ttk.Label(popup, text="Login Unsuccessful")
                label2.pack()
                Btn2 = ttk.Button(popup, text="Okay", command=popup.destroy)
                Btn2.pack()
                popup.geometry("300X300")
                popup.mainloop()
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None



class ReaderPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        back1=Button (self, text="Exit", width =10,height=2,command=lambda:controller.show_frame(StartPage))
        back1.pack(side=LEFT)
        q1label0=Label(self, text="###### Document Search ######" )
        q1label0.pack()
        q1label1=Label(self, text="Enter DOCID/Publisher:", width=20)
        q1label1.pack()
        self.q1SearchQuery_textBox1 = Entry(self, width =20 )
        self.q1SearchQuery_textBox1.pack()
        q1label2=Label(self, text="Enter Title", width=20 )
        q1label2.pack()
        self.q1SearchQuery_textBox2 = Entry(self, width =20 )
        self.q1SearchQuery_textBox2.pack()
        self.q1btn1=Button (self, text="Search Document", width =20,height=2 ,command=self.searchDocument)
        self.q1btn1.pack()
        ttk.Separator(self).pack()


        ##########    QUERY2  ############
        q2label1=Label(self, text="###### Document Checkout, Return and Reservation ######" )
        q2label1.pack()
        q2label2=Label(self, text="Enter DOCID", width=20 )
        q2label2.pack()
        self.q2SearchQuery_textBox1 = Entry(self, width =20 )
        self.q2SearchQuery_textBox1.pack()
        q2label3=Label(self, text="Enter BranchID", width=20 )
        q2label3.pack()
        self.q2SearchQuery_textBox2 = Entry(self, width =20 )
        self.q2SearchQuery_textBox2.pack()
        q2label4=Label(self, text="Enter CopyNo", width=20 )
        q2label4.pack()
        self.q2SearchQuery_textBox3 = Entry(self, width =20 )
        self.q2SearchQuery_textBox3.pack()
        q2label5=Label(self, text="Enter ReadID" , width=20)
        q2label5.pack()
        self.q2SearchQuery_textBox4 = Entry(self, width =20 )
        self.q2SearchQuery_textBox4.pack()
        self.q2btn1=Button (self, text="Checkout", width =10,height=2 ,command=self.checkout)
        self.q2btn1.pack()
        self.q2btn2=Button (self, text="Return", width =10,height=2 ,command=self.returnDoc)
        self.q2btn2.pack()
        self.q2btn3=Button (self, text="Reserve", width =10,height=2 ,command=self.reserve)
        self.q2btn3.pack()
        ttk.Separator(self).pack()

        q3label1=Label(self, text="###### Check Status  ######" )
        q3label1.pack()
        q3label2=Label(self, text="Enter Reader ID", width=20 )
        q3label2.pack()
        self.q3SearchQuery_textBox1 = Entry(self, width =20 )
        self.q3SearchQuery_textBox1.pack()
        self.output1 = Text(self, width=75, height=20, wrap=WORD)
        self.q3btn1=Button(self, text="Get Details", width =10,height=2 ,command=self.getStatus)
        self.q3btn1.pack()
        q3label4=Label(self, text="###### Publisher Details  ######" )
        q3label4.pack()
        q3label4=Label(self, text="Publish Name", width=20 )
        q3label4.pack()
        self.q3SearchQuery_textBox4 = Entry(self, width =20 )
        self.q3SearchQuery_textBox4.pack()
        self.q3btn4=Button(self, text="Get Details", width =10,height=2 ,command=self.getPublisherDetails)
        self.q3btn4.pack()
        self.output1 = Text(self, width=75, height=20, wrap=WORD)
        self.output1.pack()



    def getPublisherDetails(self):
        self.output1.delete(0.0,END)
        Name = self.q3SearchQuery_textBox4.get()
        QueryString="select DOCID,TITLE from document where PUBLISHERID =(select publisherid from publisher where pubname=\'"+Name+"\');"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            resultString=""
            for r in result:
                resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        if(resultString==""):
            print("empty")
        print(resultString)
        self.output1.insert(END, resultString)






    def getStatus(self):

        self.output1.delete(0.0,END)
        RID = self.q3SearchQuery_textBox1.get()
        QueryString="SELECT b1.DOCID, b1.COPYNO, b1.BID, CASE WHEN b2.RDTIME is NULL THEN 'Not Available' ELSE 'Available' END AS STATUS FROM BORROWS b1, BORROWING b2 WHERE  b2.BOR_NO = b1.BOR_NO AND b1.DOCID in (SELECT r.DOCID FROM RESERVES r where r.RID ="+RID+ ");"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            resultString=""
            for r in result:
                print(str(r))
                resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        if(resultString==""):
            print("empty")
        print(resultString)
        self.output1.insert(END, resultString)


    def searchDocument(self):
        self.output1.delete(0.0,END)
        SearchQuery1= self.q1SearchQuery_textBox1.get()
        SearchQuery2= self.q1SearchQuery_textBox2.get()
        QueryString = "Select * from DOCUMENT where"

        if len(SearchQuery1)>0:
            QueryString +=" DOCID ="+SearchQuery1+" OR PublisherID = "+SearchQuery1
        if len(SearchQuery2)>0:
                if SearchQuery1!="":
                    QueryString +=" OR Title = '"+SearchQuery2+"'"
                else:
                    QueryString +=" Title = '"+SearchQuery2+"'"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            resultString=""
            for r in result:
                resultString+="\n"+str(r)
        except:
            resultString="Some Error Occured. Could not fetch Search Results"
        cursor=None
        self.output1.insert(0.0, "Search Results\n"+resultString)

    def reserve(self):
        self.output1.delete(0.0,END)
        RID = self.q2SearchQuery_textBox4.get()
        DocID= self.q2SearchQuery_textBox1.get()
        BID = self.q2SearchQuery_textBox2.get()
        CopyNO= self.q2SearchQuery_textBox3.get()
        Dtime = datetime.now().isoformat()
        #QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+" and  BID="+BID+" and  COPYNO="+CopyNO+");"
        QueryString = "INSERT INTO RESERVATION (DTIME) VALUES(\'"+Dtime+"\');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),"+RID+","+DocID+","+BID+","+CopyNO+");"

        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            conn.commit()
            #result= cursor.fetchall()
            cursor=None
            resultString="Reserved"
            # for r in result:
            #     resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output1.insert(END, resultString)


    def checkout(self):
        self.output1.delete(0.0,END)
        RID = self.q2SearchQuery_textBox4.get()
        DocID= self.q2SearchQuery_textBox1.get()
        BID = self.q2SearchQuery_textBox2.get()
        CopyNO= self.q2SearchQuery_textBox3.get()
        Bdate = datetime.now().isoformat()
        DueDate = (datetime.now()+timedelta(days=30)).isoformat()
        QueryString = "INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES(\'"+Bdate+"\',NULL,\'"+DueDate+"\');"
        QueryString += "INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),"+RID+","+DocID+","+BID+","+CopyNO+");";
        #QueryString += "Select * from BORROWS;"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            conn.commit()
            result= cursor.fetchall()
            resultString="Query Inserted. Checkout Complete."
            #for r in result:
             #   resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output1.insert(END, resultString)

    def returnDoc(self):
        self.output1.delete(0.0,END)

        RID = self.q2SearchQuery_textBox4.get()
        DocID= self.q2SearchQuery_textBox1.get()
        BID = self.q2SearchQuery_textBox2.get()
        CopyNO= self.q2SearchQuery_textBox3.get()
        Rdate = datetime.now().isoformat()

        #QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+");"
        QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+" and  BID="+BID+" and  COPYNO="+CopyNO+");"
        #QueryString +="Select * from BORROWS;"

        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            conn.commit()
            #result= cursor.fetchall()
            resultString="Returned"
            # for r in result:
            #     resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output1.insert(END, resultString)









class AdminPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        self.output2 = Text(self, width=75, height=20, wrap=WORD)
        back2=Button (self, text="Exit", width =10,height=2,command=lambda:controller.show_frame(StartPage))
        back2.pack(side=LEFT)
        t2q1label0=Label(self, text="###### Add a Document Copy ######" )
        t2q1label0.pack()
        t2q1label1=Label(self, text="Enter Title:" )
        t2q1label1.pack()
        self.t2q1SearchQuery_textBox1 = Entry(self, width =20 )
        self.t2q1SearchQuery_textBox1.pack()
        t2q1label2=Label(self, text="Enter Published Date in (YYYY-MM-DD) Format Only" )
        t2q1label2.pack()
        self.t2q1SearchQuery_textBox2 = Entry(self, width =20 )
        self.t2q1SearchQuery_textBox2.pack()
        t2q1label3=Label(self, text="Enter Published ID" )
        t2q1label3.pack()
        self.t2q1SearchQuery_textBox3 = Entry(self, width =20 )
        self.t2q1SearchQuery_textBox3.pack()
        self.t2q1btn1=Button (self, text="Add Document", width =10,height=2 ,command=self.addDocument)
        self.t2q1btn1.pack()
        ttk.Separator(self).pack()

        ##########    QUERY2  ############

        t2q2label0=Label(self, text="###### Get top N borrowed Books ######" )
        t2q2label0.pack()
        t2q2label1=Label(self, text="Enter N:" )
        t2q2label1.pack()
        self.t2q2SearchQuery_textBox1 = Entry(self, width =20 )
        self.t2q2SearchQuery_textBox1.pack()
        self.t2q2btn1=Button (self, text="Fetch", width =10,height=2 ,command=self.getNBorrowed)
        self.t2q2btn1.pack()
        ttk.Separator(self).pack()


        ##########    QUERY3  ############

        t2q3label0=Label(self, text="###### Average Fines from Each Branch ######" )
        t2q3label0.pack()
        t2q3label1=Label(self, text="Enter Start Date (YYYY-MM-DD format only):" )
        t2q3label1.pack()
        self.t2q3SearchQuery_textBox1 = Entry(self, width =20 )
        self.t2q3SearchQuery_textBox1.pack()
        t2q3label2=Label(self, text="Enter End Date (YYYY-MM-DD format only):" )
        t2q3label2.pack()
        self.t2q3SearchQuery_textBox2 = Entry(self, width =20 )
        self.t2q3SearchQuery_textBox2.pack()
        self.t2q3btn1=Button (self, text="Calculate", width =10,height=2 ,command=self.getAvgFine)
        self.t2q3btn1.pack()
        ttk.Separator(self).pack()

        t2q3label3=Label(self, text="###### ADD READER ######" )
        t2q3label3.pack()
        self.t2q3btn3=Button (self, text="ADD reader", width =10,height=2 ,command=lambda:controller.show_frame(AddReader))
        self.t2q3btn3.pack()


        #self.output2 = Text(self, width=75, height=20, wrap=WORD)
        self.output2.pack()


    def addDocument(self):
        self.output2.delete(0.0,END)
        Title = self.t2q1SearchQuery_textBox1.get()
        PDate = self.t2q1SearchQuery_textBox2.get()
        PublisherID = self.t2q1SearchQuery_textBox3.get()
        QueryString = "INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES (\'"+Title+"\',\'"+PDate+"\',"+PublisherID+");"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            conn.commit()
            #result= cursor.fetchall()
            resultString="Inserted"
            # for r in result:
            #     resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output2.insert(END, resultString)

    def getAvgFine(self):
        self.output2.delete(0.0,END)
        StartDate = self.t2q3SearchQuery_textBox1.get()
        EndDate = self.t2q3SearchQuery_textBox2.get()
        QueryString = "Select b3.LNAME, b3.BID, Avg(IF(b2.bdtime between '"+StartDate+"' and '"+EndDate+"' and b2.RDTIME is NULL and DATEDIFF(CURRENT_DATE, b2.BDTIME)>30, DATEDIFF(CURRENT_DATE, b2.BDTIME)*0.2,NULL)) from BORROWS b1, BORROWING b2 ,BRANCH b3 WHERE b1.BOR_NO=b2.BOR_NO and b1.BID = b3.BID Group By b3.BID"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            resultString=""
            for r in result:
                resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output2.insert(END, resultString)

    def getNBorrowed(self):
        self.output2.delete(0.0,END)
        N = self.t2q2SearchQuery_textBox1.get()
        QueryString = "Select b.DOCID , d.TITLE, count(b.BOR_NO) from BORROWS b, DOCUMENT d Where b.DOCID= d.DOCID GROUP BY d.DOCID ORDER BY count(b.BOR_NO) desc LIMIT "+N

        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            result= cursor.fetchall()
            resultString=""
            for r in result:
                resultString+="\n"+str(r)
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output2.insert(END, resultString)


class AddReader(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        self.output3 = Text(self, width=75, height=20, wrap=WORD)
        t2q1label6=Label(self, text="###### Add a Reader Details ######" )
        t2q1label6.pack()
        t2q1label7=Label(self, text="Reader Type " )
        t2q1label7.pack()
        self.Rtype = Entry(self, width =20 )
        self.Rtype.pack()
        t2q1label8=Label(self, text="Reader Name" )
        t2q1label8.pack()
        self.RName = Entry(self, width =20 )
        self.RName.pack()
        t2q1label9=Label(self, text="Reader Address" )
        t2q1label9.pack()
        self.RAddress = Entry(self, width =20 )
        self.RAddress.pack()
        t2q1label10=Label(self, text="Reader Phone number" )
        t2q1label10.pack()
        self.RPNo = Entry(self, width =20 )
        self.RPNo.pack()
        self.t2q1btn1=Button (self, text="Add Document", width =10,height=2 ,command=self.addReaderDetails)
        self.t2q1btn1.pack()
        self.output3.pack()
        back2=Button (self, text="Exit", width =10,height=2,command=lambda:controller.show_frame(AdminPage))
        back2.pack()
        ttk.Separator(self).pack()

    def addReaderDetails(self):
        self.output3.delete(0.0,END)
        type = self.Rtype.get()
        name = self.RName.get()
        address = self.RAddress.get()
        Pno = self.RPNo.get()
        QueryString="Insert into reader(RTYPE,RNAME,RADDRESS,PHONE_NO) values(\'"+type+"\',\'"+name+"\',\'"+address+"\',"+Pno+")"
        try:
            cursor=conn.cursor()
            cursor.execute(QueryString)
            conn.commit()
            resultString="Inserted"
        except BaseException as e:
            resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
        cursor=None
        self.output3.insert(END, resultString)


app=FirstScreen()
app.mainloop()
