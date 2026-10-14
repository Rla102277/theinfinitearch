-- Infinite Arch: remove EMPTY albums only. Every album below holds 0 photos.
-- Also reports whether Photos allows album deletion via AppleScript at all.
set okCount to 0
set failCount to 0
set firstErr to ""
tell application "Photos"
	with timeout of 3600 seconds
		try
			delete album id "43F979A9-3EE1-4349-A915-EC65D2096E37"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "7D812D2E-0D63-4978-9DC1-E9916F461FBD"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "4493B3A0-032F-45DC-A2F1-D61D4E4E6D8E"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "E7774E59-6D2E-4A5B-827D-CA5728577074"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "30BE43A0-4973-423C-89A0-84885D7CA617"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "C8C4B417-3EEC-467D-83E2-FC9C7F8C6D41"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "F2EC6437-A85D-4497-BD64-9145476FA835"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "CE0EC3C2-5D71-4570-9ABC-2387968D41E3"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "7A544252-D89D-4EE0-872C-E1F82B0A21CF"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "9915978F-F3AB-41BC-B320-4E0D5AEC7E10"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "03E73F67-4203-42E8-A7BB-6989FB6F77E4"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "931CC6E9-6B47-40F4-8334-927CD33298A6"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "D32BBCC3-9F05-4B12-8DCF-62AD6AD96574"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "3E492788-8AF8-4C90-AF19-25E7A0C5B1FF"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "CDA82911-B665-4F76-893C-3D5651D9385A"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "11160500-33DB-4DE0-B2ED-CC49A5CAA675"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "C8E3ABF6-FAC5-4729-BCEB-84A88FFE6A94"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "197F4E23-2D24-4679-A94C-2D265A874183"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "97053C3A-2FA5-4543-92B1-17F7C09BF41D"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "3B94556A-6D7B-44F7-A8E6-0A1F393BF11B"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "4F3C3EDE-7856-43E5-A636-70402688397E"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "CD854E9A-BBFD-413F-8306-77CC3EE39B11"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "0DA36DC3-CA06-4CAE-82B8-B65FA689129B"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "96382D66-3615-4E76-A585-193322FB54CC"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "D76EEEC2-CE6E-475F-9AAC-4BEB2AE0F545"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "10D89BC2-76EB-474E-BFE3-8A987452F299"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "1FBE9CB2-BA60-4523-9D6E-EA8828AE1E19"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "B0713410-B374-4D59-8498-E3580E90A97C"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "41F50DDC-E721-401D-AD82-9D170C4CD941"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "BADD022E-C06D-4D92-8C80-599147A94766"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "CADEB7CE-C82C-4A84-AA4F-3C0B5BB212B9"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "BD8A3C3D-5B0A-40A1-8489-014F200B3375"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "EF3907A0-61D2-4871-9C73-C155D5FA048B"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "D84CA662-EDE1-42BF-BBFD-BB12D8E07B44"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "53ABE1E1-55A3-4170-B519-2541919698A3"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "D94A0BD1-1816-4887-BA61-9E465CA2844B"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "9B70EE8C-D879-4D7C-8B6B-72EF19D586AE"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "018578F1-FA1E-45E7-BFE2-A1584469AAB3"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "C5987983-10EB-47BB-BF60-5DCDCC75F4CF"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "00C430AE-2BDF-4015-9058-51B0516687F0"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "A7441535-8655-4418-BA67-454B7B8CC052"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "49F32D6A-6888-4848-9A5E-2B0FA64BE4CD"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "5A733586-E98F-4D79-9A75-ECFCCFF8BC03"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "AFBE766A-2460-4A0C-AB51-A018D936613A"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "07F7F589-1FE3-4E24-A26E-26164F4A4563"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "D0144E66-B65B-41E7-9DB1-13CFD0D12CD4"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "CB06B69C-FFA6-4C83-8DCA-0436F42523A6"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "75D8C92D-2F85-4595-AE18-622F9372555A"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "566F9DC7-3315-48A2-A92A-9C1C397E8227"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "0F8D8F45-162F-4F40-B3F9-68C69E4A0773"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "0B1C3646-4399-41BB-B7BC-88C2FB178CEA"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "3765F718-31DA-4405-9C70-4DE7038B2353"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "75DCE8E5-E707-4477-BE72-DA22DFC10C6A"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "BA7D3632-783F-4751-A5E7-D254D47DCB51"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
		try
			delete album id "7D44FA20-F1C0-425F-958A-02FF88274185"
			set okCount to okCount + 1
		on error eMsg
			set failCount to failCount + 1
			if firstErr is "" then set firstErr to eMsg
		end try
	end timeout
end tell
display dialog ("Deleted: " & okCount & "   Failed: " & failCount & return & return & "First error: " & firstErr) buttons {"OK"} default button 1
