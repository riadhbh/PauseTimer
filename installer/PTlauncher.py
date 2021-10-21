"""
@ Author Mohamed Riadh BEN HMIDA
www.linkedin.com/in/medriadh-benhmida
"""
import os
try:
	# for Python2, It's pretty easy to adapt the code to Python 2 using this trick 
	from Tkinter import *   ## notice capitalized T in Tkinter
except ImportError:
	# for Python3
		from tkinter import *   ## notice lowercase 't' in tkinter here
		from tkinter import messagebox
	
root = Tk()
root.title('Pause Timer')

if os.name == 'nt':## Windows
   FileSys = str(os.getcwd())+"\\PTicon.ico"
if os.path.isfile(FileSys):   
	root.iconbitmap(FileSys) #currently it works only on windows 

root.minsize(width=250, height=70)
running = False
counter = 0

Time = Label(root, text="", fg="black", font="Verdana 20 bold") 
Time['text']="00:00:00"

def counter_label(Time): 
	def count(): 
		if running: 
			global counter
			hours = counter//3600
			if hours < 10:
				hours = "0"+str(hours)
			else:
				hours = str(hours)
			
			minutes = counter//60
			if minutes < 10:
				minutes = "0"+str(minutes)
			else:
				minutes = str(minutes)
			
			seconds = counter%60
			if seconds < 10:
				seconds = "0"+str(seconds)
			else:
				seconds = str(seconds)
			
			display=hours+":"+minutes+":"+seconds
			Time['text']=display 
			Time.after(1000, count)  
			counter += 1
	count() 



def startCallBack(Time):
   global running
   running = True
   counter_label(Time)
   
def stopCallBack():
   global running
   global counter
   counter =0
   running = False



# Code to add widgets will go here...

Start = Button(root, 
                   text="Start", width=8,
                   fg="red",
                   command=lambda:startCallBack(Time))
Start.pack(side=LEFT)
Stop = Button(root,
                   text="Stop",width=8,
                   command=stopCallBack)
Stop.pack(side=LEFT)
Time.pack(side=LEFT)    

root.mainloop()