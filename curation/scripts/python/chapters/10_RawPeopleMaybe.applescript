
property LOGF : "~/Pictures/_IA_review/chlog.txt"
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

on tagAll(al, kws)
	tell application "Photos"
		with timeout of 86400 seconds
			repeat with m in (media items of al)
				try
					set kwl to keywords of m
					if kwl is missing value then set kwl to {}
					set nk to kwl
					repeat with k in kws
						if nk does not contain (contents of k) then set end of nk to (contents of k)
					end repeat
					set keywords of m to nk
				end try
			end repeat
		end timeout
	end tell
end tagAll
on subFolder(fn, parentF)
	tell application "Photos"
		try
			return folder fn of parentF
		end try
		return make new folder named fn at parentF
	end tell
end subFolder
on run
	my logit("RAW+FACES START")
	set topF to my getFolder("CHAPTERS")
	set chF to my subFolder("2 Companions", topF)
	set n to my fillA("2 Maybe (raw)", chF, "EE11FD81-E5DF-4CAB-B36E-C75EC1309DAD
58F058BF-60E2-4799-B0AC-BBCAD49EFC7B
22C56889-895F-46F5-8B75-0DDC02AB6AE7
BE57DBEA-66A8-4E21-860A-2F6530D89F5C
D4C1011B-5838-4121-A306-DB7C883C2763
2E034CCC-6AFB-4964-ABF8-D7F8594BC8E6
5A4A7A43-CEF3-48B9-B613-10350A330119
D9EDC716-E608-41E4-82F0-23FCFB9FE615")
	tell application "Photos" to set al to album "2 Maybe (raw)" of chF
	my tagAll(al, {"Ch: Companions", "Prov: Maybe"})
	my logit("Companions 2 Maybe (raw): " & n & " of 8")
	set chF to my subFolder("1 Thresholds", topF)
	set n to my fillA("2 Maybe (raw)", chF, "D6E2F107-861D-428B-9172-325FA0F47DE6
9739DF03-03B5-471F-BE78-C71A2FA9C00A
69C4E366-95ED-4AF8-BBA6-0DAE924D58FB
BF229911-5FF6-419E-8F65-2370E1DFDF1A")
	tell application "Photos" to set al to album "2 Maybe (raw)" of chF
	my tagAll(al, {"Ch: Thresholds", "Prov: Maybe"})
	my logit("Thresholds 2 Maybe (raw): " & n & " of 4")
	set chF to my subFolder("3 Witnesses", topF)
	set n to my fillA("2 Maybe (raw)", chF, "45C699D1-63F2-40B8-9FF4-33A4157D5B8A
4F71C198-81C9-4B0C-A910-7C61BCBBB8BD
DC0EBB2B-FCB3-4B4A-94CF-B4E54C8D5B7F
5D8AE2CF-1343-4D48-BFEC-C74B58BBEC8A")
	tell application "Photos" to set al to album "2 Maybe (raw)" of chF
	my tagAll(al, {"Ch: Witnesses", "Prov: Maybe"})
	my logit("Witnesses 2 Maybe (raw): " & n & " of 4")
	set chF to my subFolder("4 Elsewhere", topF)
	set n to my fillA("2 Maybe (raw)", chF, "5197F797-4184-4B1B-99F8-D8BBF3164BD9
218C0FEE-E75A-433E-9430-20216A323231")
	tell application "Photos" to set al to album "2 Maybe (raw)" of chF
	my tagAll(al, {"Ch: Elsewhere", "Prov: Maybe"})
	my logit("Elsewhere 2 Maybe (raw): " & n & " of 2")
	set chF to my subFolder("2 Companions", topF)
	set n to my fillA("2 Maybe (people)", chF, "92CA0747-DB61-4600-A4BF-157FE6B7F361
232185C1-AEE7-4D24-855D-61C4A562CDA7
3F5D5FF3-0460-4456-AD3E-D23A37FCF5C8
10381D36-9861-4536-A8E8-D183BF556978
23A037DE-FB99-4267-933A-B0CCC2DD138C
791515D4-C604-4945-8ACD-61EA22B9861E
8C292B4F-E97E-43CD-BCEF-23A55B2E3865
288C9A1D-43AD-420E-BB67-7446F9013BB3
93F44E97-D231-4242-B08C-5C2E39F8D2D9
765E8A0F-BAC9-46D7-8D59-AE17B805A011
03006130-71EC-4D68-A361-C1F377DAE3B8
A756E99C-E9B3-40A0-B1B4-891332193164
351EAF88-A774-4050-A55E-F8000C468B5B
13B96C23-36C3-4029-A5A6-6614B1725864
5E8457C0-1C40-4C7C-9A15-54A109E581D0
F6D8F67D-8E24-4BEB-9B0E-E96F82621BF1
44B789BF-DD6B-4A8A-8460-BA6CEF234938
BEED63F4-84B2-4E32-8A9F-C757CE6D6E47
47A0EEF4-0B82-4DCE-B68A-3EE1B255C75A
3B296A9A-E1C7-4670-A90C-540F0D538857
175B4628-3EFB-4508-9119-75CADD15296D
82CD0016-71DF-4E97-8B98-1E68070E83D3
640265C2-42EE-4907-99EF-36555ACB45FD
41BD02EA-A1F6-4908-8EBE-F42E9CAAE64B
B9071152-D40A-424F-822D-3C3E9DA2BFAE
78C96952-E500-461A-8EBC-B179B6830388
982E0DE1-943B-4E15-ACF8-F443BF58BDBF
19204B82-E6FF-4179-A358-F64D0D07C20E
F0CBB6B3-EC1D-4B58-BFB4-D4D60D879655
8C0416B1-2F08-4CAF-BFEF-73F8BFDD2EF3
E340CD88-BB69-40CC-B716-8E3FC4820847")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Companions", "Prov: Maybe"})
	my logit("Companions 2 Maybe (people): " & n & " of 31")
	set chF to my subFolder("3 Witnesses", topF)
	set n to my fillA("2 Maybe (people)", chF, "4D54E019-7563-4051-9418-9CF22FDD2643
FB148203-20A7-42DC-B045-DEC4E391332E
E0178D5F-26C6-48F7-B545-D4E49A2B8AD2
D1354348-B874-4813-B46F-4EE214787AB6
5920D05B-01D8-4E4E-B2C0-BCA0569E0CE1
11F58457-B692-490E-A0AC-58DB119B4C9D
81A5DC11-84E7-4741-B0AD-7580EE295D3B
CC703497-7E7A-43DD-85B4-A14071CE8FC8
F2EA8E9A-15DC-4FB7-BF10-0EF8609067DD
B8A2D725-64A3-4BBC-B45D-7181C71508F0
F051AD0B-23A7-45C5-8758-5DAB084BEC93
25FB7C5D-6E93-4DAD-A526-4B66F9A1BCC7
DB0232EC-30E6-414A-8A6A-46538410EF51
F337E5B7-45DD-4E22-82C9-FA9B8C61D35E
A1DBFE70-3E13-45E5-8F62-67AB2F282416")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Witnesses", "Prov: Maybe"})
	my logit("Witnesses 2 Maybe (people): " & n & " of 15")
	set chF to my subFolder("1 Thresholds", topF)
	set n to my fillA("2 Maybe (people)", chF, "2FE654CF-42CA-4322-8F31-7E0C6D63904F
C87652FB-5496-4001-9867-B9CBE3C282E9
206B0006-E295-4D2F-ADFC-ED163FA5A1AB
3B232F2E-6B93-43CA-B5DB-7A83E4F88D23
7A3B65AF-2D4B-4CE4-AB5B-B142F43DFFAD
3474A41B-BF16-4AD4-ABAE-AF6AA7049975
E7A67119-A2B5-4D6C-AF37-8B10815088D7
E65971A6-C51C-4C9D-932B-ED3E9752B82D")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Thresholds", "Prov: Maybe"})
	my logit("Thresholds 2 Maybe (people): " & n & " of 8")
	set chF to my subFolder("4 Elsewhere", topF)
	set n to my fillA("2 Maybe (people)", chF, "1A668963-565F-4B8C-BC2D-F4A54EB8B377
3654E55F-FA2C-41B4-9D54-766AC23155CB
10744652-EDE0-4288-8454-B24D57DC69B9
0863D902-3C88-4B86-AD65-F80DD142B92B
CCC75D70-B654-490D-8CF2-DEC7AB8B02A3
5A81DA28-8DB4-4AC1-A3C0-5AF06F38B7DF
6CF75AFE-1918-4B78-8012-F26B3BD1E608
1447B01A-0831-4EC0-97C3-F5A2873D9F0F
145C2775-3426-4EB8-ACAB-076A2C05D917")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Elsewhere", "Prov: Maybe"})
	my logit("Elsewhere 2 Maybe (people): " & n & " of 9")
	set chF to my subFolder("6 Keeping", topF)
	set n to my fillA("2 Maybe (people)", chF, "D0807CB4-A047-4193-898F-278CC22B34AB
2EEC7FD2-2D4E-4735-B5A1-79ECF635D481
E8DDCBA8-0DAE-48DE-A76E-02F259C97467
B7ED796A-BE14-4374-A2CF-672539ED2972
6333E454-74CE-4133-AF14-A5E1A9C5D30D
214A7CC2-5730-45BF-B354-1DA76625447E
938520B8-B93C-452B-9594-A77F3BC7FBAA
CD0E1D3D-0444-49D0-9197-CD02D6389666
D18FDA40-E66D-4328-855B-D129DCF32391
1DF02F34-F425-4485-9987-30147BDDA72E
A6360354-BD39-409D-8FCF-9FF804E17C9C
B5693C79-593D-4FEE-96D8-F4DB985F3E25
002B1231-23B9-4551-AAA0-1A6D1F34F8DE
58EF4D76-5EFA-4DAE-8CE7-4E7A38BCC263
55914D7A-40AA-4771-BDCE-F1671D3C117E
A49FA9C1-D70F-415A-BD81-769EFAF7A1B6
C6806534-4E61-4684-BF34-C033B93E090A")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Keeping", "Prov: Maybe"})
	my logit("Keeping 2 Maybe (people): " & n & " of 17")
	set chF to my subFolder("5 Becoming", topF)
	set n to my fillA("2 Maybe (people)", chF, "72FA99DF-C771-4E66-8A1E-F5327B0D6882
9C0D0C52-9D41-4818-A23F-A83DE15EE47F
24BE6B29-1D36-4538-86A9-A4B70BB056A0
38257481-CA9F-4482-837E-559C67A4A1B0")
	tell application "Photos" to set al to album "2 Maybe (people)" of chF
	my tagAll(al, {"Ch: Becoming", "Prov: Maybe"})
	my logit("Becoming 2 Maybe (people): " & n & " of 4")
	my logit("RAW+FACES DONE")
end run
