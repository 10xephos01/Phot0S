username = {"a","10xephos01", "okguess", "admin", "user", "guest"} --[[This is the usernames]]--
password = {"a","estee", "password", "admin", "user", "guest"} --[[This is the passwords for the users]]--
term.setBackgroundColor(colors.white)
os.pullEvent = os.pullEventRaw
term.clear()
term.setCursorPos(1,1)
bground = paintutils.loadImage("BG")
paintutils.drawImage(bground,1,1)
term.setCursorPos(7,5)
term.setBackgroundColor(colors.white)
term.setTextColor(colors.blue)
 
write("Username:")
user = read()
 
for i=1, #username do
if user == username[i] then
term.setCursorPos(8,6)
print("User found")
sleep(0.25)
term.setCursorPos(7,7)
write("Password:".."")
pass = read("*")
if pass == password[i] then
access = true
else print("Incorrect")
sleep(1)
os.reboot()
end
end
end
 
if access == true then
term.setCursorPos(7,8)
print("Logging in...")
sleep(0.25)
term.clear()
term.setCursorPos(8,8)
print("Welcome User")
term.setCursorPos(7,9)
textutils.slowWrite("||||||||||||||")
sleep(0.8)
shell.run("gui")
else
print("Incorrect username and/or password")
sleep(0.5)
os.reboot()
end
