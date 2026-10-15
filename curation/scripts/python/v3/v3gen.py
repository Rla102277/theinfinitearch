import json,collections,os
f=json.load(open("v3final.json")); strip=json.load(open("v3strip.json"))
OUT=os.path.expanduser("~/mnt/Pictures/_IA_review")
byloc=collections.defaultdict(list)
for u,v in f.items(): byloc[v['loc'] or 'NO LOCATION AVAILABLE'].append(u)
reg=lambda l: 'NO LOCATION AVAILABLE' if l=='NO LOCATION AVAILABLE' else next(v['region'] for v in f.values() if v['loc']==l)
R={l:reg(l) for l in byloc}
for l in R:
    if R[l] in (None,'$null'): R[l]='NO LOCATION AVAILABLE'
def esc(s): return s.replace('\\','\\\\').replace('"','\\"')
HDR=r'''
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
'''
def block(loc,uuids,tmp):
    region=R[loc]
    lk='' if loc=='NO LOCATION AVAILABLE' else 'Loc: '+loc
    pk='Place: No Location' if loc=='NO LOCATION AVAILABLE' else 'Place: '+region
    chunks=[uuids[i:i+3000] for i in range(0,len(uuids),3000)]
    s=''
    for ci,ch in enumerate(chunks):
        s+='\tset n to my fillA("%s", %s, "%s")\n'%(esc(loc),tmp,"\n".join(ch))
    s+='\tmy logit("filled %s: " & n & " of %d")\n'%(esc(loc),len(uuids))
    s+='\ttell application "Photos" to set al to album "%s" of %s\n'%(esc(loc),tmp)
    s+='\tset k to my stamp(al, "%s", "%s")\n'%(esc(lk),esc(pk))
    s+='\tmy logit("stamped %s: " & k)\n'%esc(loc)
    s+='\ttell application "Photos" to set ra to my getAlbum("%s", locF)\n'%esc(region)
    s+='\tmy copyInto(al, ra)\n'
    return s
order=sorted(byloc,key=lambda l:len(byloc[l]))
# ---------- test on 6
pick=[]
for want in ['Home (DFW)','New Orleans, LA','Boston, MA','NO LOCATION AVAILABLE','Colorado Springs, CO']:
    pick.append((want,byloc[want][:1]))
t=HDR+'on run\n\ttell application "Photos" to activate\n\tset tmp to my getFolder("ZZ_TESTV3 stamp")\n\tset locF to my getFolder("ZZ_TESTV3 LOCATIONS")\n'
for l,us in pick: t+=block(l,us,'tmp')
t+='\tset n to my fillA("_strip", tmp, "%s")\n\ttell application "Photos" to set sa to album "_strip" of tmp\n\tset k to my stamp(sa, "", "")\n'%strip[0]
t+='''	set rep to ""
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
'''
open(os.path.join(OUT,"50_TestV3.applescript"),"w",encoding="utf-8").write(t)
# ---------- full
s=HDR+'on run\n\ttell application "Photos" to activate\n\tmy logit("51 START")\n\tset tmp to my getFolder("_v3 stamp (temporary)")\n\tset locF to my getFolder("LOCATIONS")\n'
for l in order: s+=block(l,byloc[l],'tmp')
s+='\tset n to my fillA("_strip", tmp, "%s")\n\ttell application "Photos" to set sa to album "_strip" of tmp\n\tset k to my stamp(sa, "", "")\n\tmy logit("stripped old Loc from " & k & " frames outside the set")\n'%"\n".join(strip)
s+='''	my logit("51 DONE. Delete the folder '_v3 stamp (temporary)' by hand.")
	display dialog "LOCATIONS built and Loc/Place keywords rewritten. See v3log.txt." buttons {"OK"} default button 1
end run
'''
open(os.path.join(OUT,"51_LocV3.applescript"),"w",encoding="utf-8").write(s)
print("albums by region:")
rc=collections.Counter()
for l,us in byloc.items(): rc[R[l]]+=len(us)
for k,v in rc.most_common(): print("  %6d %s"%(v,k))
print(len(byloc),"Loc values;",len(rc),"region albums; 51 size",os.path.getsize(os.path.join(OUT,"51_LocV3.applescript")))
