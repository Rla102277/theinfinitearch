
property LOGF : "~/Pictures/_IA_review/v3log.txt"
on logit(s)
	do shell script "echo " & quoted form of ((do shell script "date '+%H:%M:%S'") & "  " & s) & " >> " & LOGF
end logit

on getFolder(fn)
	tell application "Photos"
		try
			return folder fn
		end try
		return make new folder named fn
	end tell
end getFolder

on getAlbum(an, fo)
	tell application "Photos"
		try
			return album an of fo
		end try
		return make new album named an at fo
	end tell
end getAlbum

on fillA(albName, fo, idText)
	tell application "Photos"
		with timeout of 86400 seconds
			set dest to my getAlbum(albName, fo)
			set allI to {}
			repeat with pp in paragraphs of idText
				set uu to contents of pp
				if uu is not "" then
					try
						set end of allI to media item id (uu & "/L0/001")
					end try
				end if
			end repeat
			set n to count of allI
			if n is 0 then return 0
			set base to count of media items of dest
			set i to 1
			repeat while i <= n
				set j to i + 89
				if j > n then set j to n
				try
					add (items i thru j of allI) to dest
				end try
				set i to j + 1
			end repeat
			if (count of media items of dest) < (base + n) then
				repeat with m in allI
					try
						add {contents of m} to dest
					end try
				end repeat
			end if
			return (count of media items of dest)
		end timeout
	end tell
end fillA

on stamp(al, locKw, placeKw)
	tell application "Photos"
		with timeout of 86400 seconds
			set k to 0
			repeat with m in (media items of al)
				try
					set kwl to keywords of m
					if kwl is missing value then set kwl to {}
					set nk to {}
					repeat with w in kwl
						set s to contents of w
						if not (s starts with "Loc: " or s starts with "Place: ") then set end of nk to s
					end repeat
					if locKw is not "" then set end of nk to locKw
					if placeKw is not "" then set end of nk to placeKw
					set keywords of m to nk
					set k to k + 1
				end try
			end repeat
			return k
		end timeout
	end tell
end stamp

on copyInto(src, dst)
	tell application "Photos"
		with timeout of 86400 seconds
			set allI to media items of src
			set n to count of allI
			set i to 1
			repeat while i <= n
				set j to i + 89
				if j > n then set j to n
				try
					add (items i thru j of allI) to dst
				end try
				set i to j + 1
			end repeat
		end timeout
	end tell
end copyInto
on run
	tell application "Photos" to activate
	set tmp to my getFolder("ZZ_TESTV3 stamp")
	set locF to my getFolder("ZZ_TESTV3 LOCATIONS")
	set n to my fillA("Home (DFW)", tmp, "DD23A3C6-4448-4DF4-9108-5A5B64FF1715")
	my logit("filled Home (DFW): " & n & " of 1")
	tell application "Photos" to set al to album "Home (DFW)" of tmp
	set k to my stamp(al, "Loc: Home (DFW)", "Place: Home (DFW)")
	my logit("stamped Home (DFW): " & k)
	tell application "Photos" to set ra to my getAlbum("Home (DFW)", locF)
	my copyInto(al, ra)
	set n to my fillA("New Orleans, LA", tmp, "F1231105-30D8-4BB4-A911-68BD2501910B")
	my logit("filled New Orleans, LA: " & n & " of 1")
	tell application "Photos" to set al to album "New Orleans, LA" of tmp
	set k to my stamp(al, "Loc: New Orleans, LA", "Place: Louisiana")
	my logit("stamped New Orleans, LA: " & k)
	tell application "Photos" to set ra to my getAlbum("Louisiana", locF)
	my copyInto(al, ra)
	set n to my fillA("Boston, MA", tmp, "8F9A6398-5D28-4E92-B4FF-7F70790AAA87")
	my logit("filled Boston, MA: " & n & " of 1")
	tell application "Photos" to set al to album "Boston, MA" of tmp
	set k to my stamp(al, "Loc: Boston, MA", "Place: Massachusetts")
	my logit("stamped Boston, MA: " & k)
	tell application "Photos" to set ra to my getAlbum("Massachusetts", locF)
	my copyInto(al, ra)
	set n to my fillA("NO LOCATION AVAILABLE", tmp, "D511A352-F5B6-4D8B-85D9-DC7CB9A5A21A")
	my logit("filled NO LOCATION AVAILABLE: " & n & " of 1")
	tell application "Photos" to set al to album "NO LOCATION AVAILABLE" of tmp
	set k to my stamp(al, "", "Place: No Location")
	my logit("stamped NO LOCATION AVAILABLE: " & k)
	tell application "Photos" to set ra to my getAlbum("NO LOCATION AVAILABLE", locF)
	my copyInto(al, ra)
	set n to my fillA("Colorado Springs, CO", tmp, "9F15B796-352A-4F49-9946-8429B2C6CA2D")
	my logit("filled Colorado Springs, CO: " & n & " of 1")
	tell application "Photos" to set al to album "Colorado Springs, CO" of tmp
	set k to my stamp(al, "Loc: Colorado Springs, CO", "Place: Colorado")
	my logit("stamped Colorado Springs, CO: " & k)
	tell application "Photos" to set ra to my getAlbum("Colorado", locF)
	my copyInto(al, ra)
	set n to my fillA("_strip", tmp, "0034E1B1-7F4B-43B6-A7D0-3F7BAD0A48A3")
	tell application "Photos" to set sa to album "_strip" of tmp
	set k to my stamp(sa, "", "")
	set rep to ""
	tell application "Photos"
		repeat with a in (albums of locF)
			set rep to rep & (name of a) & ": " & (count of media items of a) & return
			repeat with m in (media items of a)
				set kk to keywords of m
				set ks to ""
				if kk is not missing value then
					repeat with w in kk
						if (contents of w) starts with "Loc: " or (contents of w) starts with "Place: " then set ks to ks & (contents of w) & " | "
					end repeat
				end if
				set rep to rep & "   " & ks & return
			end repeat
		end repeat
	end tell
	my logit("TEST" & return & rep)
	display dialog "TEST v3 (expect 5 albums, 1 photo each, Loc + Place on each):" & return & return & rep buttons {"OK"} default button 1
end run
