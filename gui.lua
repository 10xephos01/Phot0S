--Desktop
os.loadAPI("fLib")
slc = 0
tBarC = 2048
tBartC = 128
tBarsC = 2
backColor = 1024
term.setBackgroundColor(backColor)
term.clear()
contextX = 0
contextY = 0
iConText="Test"
iCon = "icon"
iConLink ="file"
function Time()
  term.setCursorPos(47,18)
  print(textutils.formatTime(os.time(), true))
  sleep(1)
end
 
function titleBar()
  term.setCursorPos(1,18)
  term.setBackgroundColor(tBarC)
  term.setTextColor(tBartC)
  term.clearLine()
  term.setCursorPos(1,18)
  term.setBackgroundColor(8192)
  print("[Begin]")
  term.setBackgroundColor(tBarC)
  term.setTextColor(8192)
  Time()
end
 
function startBar()
  term.setCursorPos(7,19)
  term.setBackgroundColor(tBarsC)
end
 
function drawDesktop()
  term.setBackgroundColor(backColor)
  term.clear()
  bground = paintutils.loadImage("BG")
  paintutils.drawImage(bground,1,1)
  icon = paintutils.loadImage("icon")
  paintutils.drawImage(icon, 2, 2)
  term.setBackgroundColor(backColor)
  term.setTextColor(tBarsC)
  term.setCursorPos(3,7)
  print("LuaIDE")
  icon2 = paintutils.loadImage("SM")
  paintutils.drawImage(icon2, 2, 9)
  term.setBackgroundColor(backColor)
  term.setTextColor(tBarsC)
  term.setCursorPos(2,15)
  print("SmartPaste")
  startBar()
  titleBar()
end
 
function drawMenu1()
term.setTextColor(16384)
term.setBackgroundColor(8)
term.setCursorPos(1,13)
print("----------")
term.setCursorPos(1,14)
term.setBackgroundColor(512)
print(" Shutdown ")
term.setCursorPos(1,15)
term.setBackgroundColor(8)
print("----------")
term.setCursorPos(1,16)
term.setBackgroundColor(512)
print(" Restart  ")
term.setCursorPos(1,17)
term.setBackgroundColor(8)
print("----------")
end
function drawMenu2()
term.setBackgroundColor(128)
term.setTextColor(256)
term.setCursorPos(contextX, contextY)
print("-------------")
term.setCursorPos(contextX, contextY+1)
print(" Edit GUI    ")
term.setCursorPos(contextX, contextY+2)
print("-------------")
term.setCursorPos(contextX, contextY+3)
print(" FileManager ")
term.setCursorPos(contextX, contextY+4)
print("-------------")
 
end
 
 
drawDesktop()
while true do
local event, button, X, Y = os.pullEventRaw()
  if slc == 0 then
    if event == "mouse_click" then
      if X >=1 and X <=7 and Y==18 and button ==1 then
      drawMenu1()
      slc = 1
        elseif X >=2 and X<=9 and Y>=2 and Y<=7 and button == 1 then
        shell.run("LuaIDE")
        elseif X >=2 and X<=9 and Y>=8 and Y<=13 and button == 1 then
        shell.run("SmartPaste")
        elseif X >= 1 and Y >=3 and button == 2 then slc = 2
            if X >=38 then
            contextX = 38
            end
            if Y >=16 then
            contextY = 14
            end
            if X <= 38 then
            contextX = X
            end
            if Y <= 16 then
            contextY = Y
            end
            drawMenu2()
              --elseif X==1 and Y==7 and button ==1 then slc = 3
              --drawMenu3(1, 9)
        elseif X >=0 and X <=10 and Y>=8 and Y<=17 and buttob == 1 then
        shell.run("SmartPaste")
        else
        drawDesktop()
      end
    end
   elseif slc == 1 then
     if X >=1 and X <=6 and button == 1 and Y== 14 then slc = 0
       os.shutdown()
       elseif X>=1 and X<=6 and Y==16 and button ==1 then slc = 0
       os.reboot()
       else
       slc = 0
       drawDesktop()
     
     end
  elseif slc == 2 then
        if X >= contextX and X <= contextX+13 and Y==contextY+1 and button == 1 then slc = 0
        shell.run("LuaIDE","gui")
        drawDesktop()
          elseif X>= contextX and X <=contextX+13 and Y==contextY+3 and button == 1 then slc = 0
            shell.run("Ice-Browser")
            drawDesktop()
              else slc = 0
              drawDesktop()
        end
 -- elseif slc == 3 then
 --   if X >=1 and X <=10 and Y==10 and button == 1 then slc=3
 --   term.setTextColor(4096)
  --  term.setBackgroundColor(512)
  --  term.setCursorPos(2, 8)
  --  print("        ")
   -- term.setCursorPos(2, 8)
   -- input = read()
   -- fLib.replaceLine("gui",11,'iConText="'..tostring(input)..'"')
   -- return
    --shell.run("gui")
     -- elseif X >=1 and X <=10 and Y==11 and button == 1 then
     
     -- elseif X >=1 and X <=10 and Y==12 and button == 1 then
     -- term.setBackgroundColor(512)
     -- lY =  8
      -- for i = 1,3 do
        -- term.setCursorPos(18,lY)
       --  print("                         ")
       --  lY = lY+1
      -- end
      -- term.setBackgroundColor(1024)
      -- term.setCursorPos(19, 9)
      -- print("                   ")
      -- term.setCursorPos(20, 9)
      -- term.setTextColor(256)
      -- input = read()
       --fLib.replaceLine("gui",13,'iConLink="'..tostring(input)..'"')
       --return
      -- shell.run("gui")
      --else
      --slc = 0
      --drawDesktop()
--  end
  end
end
