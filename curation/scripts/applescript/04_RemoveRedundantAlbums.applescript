-- Infinite Arch: remove albums whose contents are fully carried by keywords.
-- Deletes ALBUMS and FOLDERS only. NO PHOTO IS DELETED by this script.
set aOK to 0
set aFail to 0
set fOK to 0
set fFail to 0
set firstErr to ""
tell application "Photos"
	with timeout of 7200 seconds
		try
			delete album id "B0309423-0F68-4A73-83C8-9D8B783EA2CF"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "24D710BA-21F7-4A7D-8A1C-1484DBF00C90"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "35890B91-984F-4F08-A328-E4847CD26813"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A7E10661-7F9F-4659-88F5-E1EC7DDB68A4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3FA72EB2-2F4A-4540-86FC-104F4C2B0691"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A5765CFE-69B8-43E6-8DC4-3C3E42F36558"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E1358787-1049-4A92-90C6-2D9D2EEDFE03"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "821F94F1-B677-454F-87C5-3C253933DA87"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "58A81259-75D2-4189-84AA-475C25F0993A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D3D0BF3E-87D9-4B82-928F-E64EF9F2B1EC"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6E6FC3FC-54A2-46A2-946A-B82C026D5A81"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3F31DCC6-3163-46A2-9579-AB282C4AC4B3"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "2219AEF9-9A28-4528-BBFD-F299767F2117"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D09CC959-5497-4479-9386-72ED28834055"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C800A49A-20EE-4CD9-BBCD-18328D0841D9"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C5332B7F-A144-4725-98DC-02C0A3CD0C1C"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "82F48E7C-2237-4E80-9033-A19A9D91FE3E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1C46B90A-BA02-4AC4-9C32-92A35A00AD93"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D73778E1-CF5C-4917-881F-C8A68A93B01E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6B36F8BF-A0C8-4534-A077-D6CCFD2C64CB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B61F4E02-B5EA-49AC-9B3E-53B90AAC524A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9C8CA6F0-B559-42D5-850E-CFDDC38F55BB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "89FBDD3B-E7AA-4936-B7E9-91D988F77DD6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "0CC5C112-0AC3-4DBC-A5BD-5E8FF4AEBA4B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4D2ACACC-9DEE-477F-ABFD-D96006CB93EA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6E7BE1EA-4AE8-4D81-BDCC-659FCF8F4A50"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "25B7C7C3-09CD-445F-AA6D-0E548A5E3FE4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "AF28B326-3158-4D70-BCC1-E9084338700D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "886FEAC1-DF92-439C-9306-2BAAFB5AB136"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A0DA83DC-03D1-4F72-93BA-C6C6FB47D7B1"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7459ED25-EB0A-47AE-B787-D09C0C6B9162"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "2262C4E7-5967-4F71-8A5E-E0278C095004"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "23C3C129-3944-45F6-9983-7C080B1BA20E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "0EBD36F2-46EC-4F93-9C3D-1F023FF71771"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "2128BF2C-9587-4253-A2EF-B3ED2F15218B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "81E56CDA-AD33-48BB-8FC1-86A9E95C3BA5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "05462D5F-37F9-4628-BEE6-B782239D2651"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E98FC3BA-4BBB-4009-AA42-3F123A147FAA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6638C324-23F5-4B72-ACC9-23B38EE36A7A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "2F8161C7-0897-4C67-9F6F-27476F5F871A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F14DB187-9BEA-4589-AE6E-249867A1D01F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1E87E7AA-86F1-41A1-8329-EE22F156DC8C"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5824AB0F-C6F7-4FEE-99FB-584133F56B78"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B7824F30-0897-43B6-8DE4-F72650305A09"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A5CE0D1F-42C5-46AB-8503-69250F1C69D4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6A8E9A58-002A-4A22-BFBE-F4277049D646"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E3ECF297-26D8-4785-B298-21F44CBF9158"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "BB7F05FF-3764-4B39-849D-52452B9916FE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "09370DA7-6F0C-498E-B0A7-1C0F9BFB8E25"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E33D8016-9789-4667-84B7-D81BF2850B17"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "694AF6F0-0ED2-4CF4-AAC3-CC61F904758D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "8152B781-6C54-42DD-BAAA-0DE284CD888E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "33B901B2-C6A2-4949-A435-87A5C2981A94"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F5B73C15-47EF-427D-A881-8E33C2A2FB8D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "679E27BE-FFBB-45A4-A075-8F522A0C6CFD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9386421E-22BA-4747-B010-901F1CC29297"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "DC531BB9-B92B-4EBA-9C12-5673A7208151"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "AFC6FF81-083F-408F-92C8-D45C25D2E1C8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "85FC02A9-C179-43CF-B846-26B09BA296DA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "AEFF1DF6-524C-48E7-AB3B-D282C49FBC8D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E32D53C3-9D9B-46C9-B43D-BE397D5C4165"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "FE52523A-4AF5-4118-AF2F-15B0ACBB7047"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9F47542E-5D55-4D4B-835E-40F894EF970E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "723E5A54-13E2-406D-A2EC-54DFD4403706"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "2E1882FC-C84D-4385-B704-2420C2FDE948"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "8C53B1DC-8C77-454E-B26F-0642F05F41F8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9C402867-A671-49A9-AF4B-5C5CA107036F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "DEFCFDB7-0439-49FF-BC65-6B184D5EAACD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3D839DC0-2312-4E3E-9109-C11D178A7934"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "761D44CA-98A4-4E3D-8319-3E4564156AF8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4A9A6EFE-5DBF-4F86-A7FB-7647EE1419E0"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "053CBE40-BCCD-497B-91D1-3BD9142A0AEE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6941907A-9921-4F57-B980-F63E55E3DFD9"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6C3A624C-E7B1-47B3-BE73-A5CF2F3E9498"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F9D362D6-EC94-40DC-9841-3A76C958F3BD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C00FCA2B-BCCB-4799-B0E5-DAD471CE4B28"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CC895995-03F9-4E41-BF34-DE239C385D75"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A4499857-493E-443C-A118-0B85932F2397"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D4D83E50-A153-43F8-8DE4-8C86BCFA7EE5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "26D74D4B-4A87-4518-A74E-0A9B0748A569"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B0FEE647-C7FA-41DD-B278-5BC4BF1ABC30"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "AD580485-A56A-4FE5-AE82-8925028E2D29"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "0FA128C8-81C2-4FE7-88CA-EE5F49FEAF80"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CFA9D52E-C0FB-4CC2-8E1A-77286D7138FD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "008AD904-7892-4682-97B9-9AC645F47679"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7B764E09-EF7F-4708-8E5B-E781186E2A01"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "15EF2996-51CA-4ECB-9584-4F5446653131"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C44C8424-C439-456F-A481-2CCDD222E135"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A2019572-F176-45E8-8256-050B735C5FC7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4A3A1C21-70AC-4185-8675-0E4D989758A9"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7ECC8C46-D638-45FC-8602-285A2B54C067"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A91B8F0F-2D41-47F6-81AA-B3C94B24DEAB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "11A8FCCD-989B-4519-BDDC-6C9439CFB06C"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F523AF86-728E-4D73-AFBB-2ADAA8344974"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "47345692-766F-49B8-9F06-2BB1EE44FFC3"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "8F0313E3-C009-445F-B934-856F5275EFAD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "931443D0-1CDB-411C-B904-B1188727D0E3"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "831C3143-44A8-438A-AE32-BC2062477957"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "953D63A7-61C1-41E8-A63D-8DC25A4DF24E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "06FBC9AF-36AE-487D-98CF-24C8415F7940"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "55D51A9B-3070-49A0-A185-5D4C5E40E953"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9875ED19-7AE4-46A7-BA19-0BBCD3B864CB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1A4EE323-5827-4E46-AF9A-37196CC29403"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4512EE57-1B78-4794-B506-19633909F2D4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "FB56AFCE-D74E-408D-9A1B-5F6ED316AFA6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9C6D103F-44DC-4200-8BBD-F2CB6FF40430"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F2033964-D4FB-41A0-BC90-EC9755A379C7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7D9E21BB-BEE6-4B1A-90DB-6BDDDC5356A8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B6B389F3-A93E-4C05-B910-EAA8B655F16A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1C67CAAF-551D-4FD9-B322-7E3C9D97D184"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7217D9C9-FE08-42F2-9483-D59F8B72219E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E5D8F355-F052-4A52-ADA2-DADCAACCE9BB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "16E15F6F-E845-4165-8E46-3D9215C6E3DA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5E8C3735-7B62-4370-B227-2B658E655FD8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6A8F06AA-68B0-4731-8CC9-6B118F371410"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4AD2530B-A352-47D9-B499-C8745B93EC48"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F395ADB7-A47E-41A5-9535-29D49E6F0E18"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3FC30D41-2C84-48FC-8140-22C63E401855"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C0908A4E-2F31-4A3C-9DBE-F8A5C30923DD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "72651715-8725-4283-BC56-258A2D8317DD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4AD5D2ED-DA81-4CFD-9EAD-0B8EB17E6C66"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "92EE0055-3207-4247-AF33-5F7196860A5A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "022242F2-4EA7-44FB-B30A-BB7AA56D3769"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C67AA955-0BBE-491C-A0F4-2348364AB80A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9C25F849-CF98-4B9B-AD17-2786AD737E2A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E9AD83D5-C3CF-435B-800F-31C5CDD45778"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D63A74AE-4A30-4E97-9C36-3AB7AC08A06E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "DA7F0216-9886-42CC-8CAB-08F0EAFE503E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A276FA00-061A-46C1-8101-95C95843809C"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "56012421-10E2-4C3F-9F6B-8A826C0723DE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B6D2735D-F2AD-4CF1-9DAE-F2C00B4FEE3F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "18BC1FE9-E6AF-4FA0-9FD1-75C32E0C9F81"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "92561B4F-9FEA-4869-BE7C-A8B000A1E075"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CAD917E3-A3BC-4829-B859-EB4CEAFF3E10"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "8EA78DBF-4027-4B61-B724-60EC83671DA5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3BE7D66D-4806-4EF6-9F8D-C7A05814F8EE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "18EE3114-CD1A-49C6-AB5D-DFF67A6E25DE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D2380413-0874-44F1-AA62-27C938C2B4AB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "10134EA9-7505-4A6A-9F9A-835B32B3953F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "51765B00-32E9-44EA-9259-E69F4134D0A3"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "ADEE4776-E88E-4958-BAE1-0A4B9638EE22"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "8D2BB374-09DD-4EB0-92A3-AB467AF939CB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "06004278-39AD-41D4-8FF6-48B831D12405"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6A0EAEE1-0AE2-4E51-9C81-BA8E101D894E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F5732E8F-4137-4666-8FF5-A970E61D778D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5EE6BB55-834A-45B7-8B5D-87DB38E495B9"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E452CBD2-8CB8-4332-8873-FCDA2F5E193B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "18843127-04C6-48BF-9C80-4E4DAEC11C53"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1E249046-29A8-4726-9DED-1432BFD55AE6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "32B5040F-D745-4462-A372-5D2B06522C7E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CEC83D36-A90F-433C-8E50-1DFE5D6F47D6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "98CA929A-8DCF-41F5-8FCB-43481B99B29A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "47628502-2AE4-48C3-8128-95EDA0090EBE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "EDB63D36-61FD-43AF-AE9E-97DF56ADA488"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "4D9C6E16-7616-4C0A-8637-C2AA4AD509F7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "231DA191-5324-4F1F-A8C7-E72D23DB66D3"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "65911A39-9388-431D-867B-FF7BA90707EB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6AC389F5-BBD7-4A93-9B9C-67511F49BE62"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9AC1F028-02D6-4252-BC21-0A4167AAEDD4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F76A7CDA-ADF1-4563-BD04-FBA23E395944"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "50BF9557-5E21-451D-8989-9F9154380ACC"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "498865B1-6235-4730-9D29-78201D99EE1C"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "6F979E32-E3A8-4D4B-9E37-29B755E5C6E8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "33903BFE-475F-4DCF-942C-7575A1F3E00D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "61FB051B-B78C-4899-BBE8-C53AFB785F53"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "879A436A-14F0-46BD-9EA9-08DF14E4D98F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "32B37FA6-CEC7-400A-AEF2-449E18FF8AEB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5285B1A8-DF49-4BA4-90C0-AFB750A0D74D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "EB292669-3BC9-42F1-BBF0-168458DA3E89"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E04A4F90-D6F8-4F2E-9EC6-2D6F2091C025"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F900BB06-24AF-4331-AC9E-1AF5F220C628"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "0EEF756D-93A7-4379-9BD1-6BBE63A163FF"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F201ACBA-36C1-45BF-944F-67F7006C3756"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9DE7F674-10D8-4128-B9EA-3E1DA1569B16"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "BFA71AA6-A7D1-470F-BE7E-2F60773AD4BE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E86447A9-254E-4FDD-B6EE-5EEDA29F04D5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D359CCA8-8819-4B72-9A9E-5040AC0EFC8B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "207A842A-713E-4DAE-B8ED-AFA62586CF6F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "119DD2D1-13AE-4203-B98C-07F52E852942"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "30CF4D00-5301-4983-836D-A92566FB18D5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "E7704899-EDCA-4D1A-B3A4-7FB859B2EFE6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "357DA6F7-BE33-4FA5-BC1B-7F74ACF7D9C5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CAA5F88A-0AB1-4D56-A228-B01DFEA22603"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5CAF49A1-4B68-4284-BD10-D16C257B7D19"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CA45D561-6842-40A4-AD45-922C04F74D86"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A07E7BFF-592B-4776-89C9-46E332962928"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "833F482C-9262-4954-A5AE-34E26A9AD5A6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "935C4822-3C8B-452B-A79E-65C6646F6579"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "0BA31187-2F1F-45F9-86FC-3BB4C479942F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "00E76931-71EE-45F5-BA8B-79C3AEE89E6B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1F432D25-B634-491B-8212-5B163F6BD14A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "02E0C79B-8990-4487-A706-F9FE71E04418"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CFBC4C08-5449-4FC3-95DF-7E718A919807"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "39A9A2E8-26B1-4CB5-8C99-92C7927412C5"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D9398CAB-0F24-481D-A733-CCB77E93C243"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "51C2D44E-00CD-40CD-9ED1-CA0A09818030"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F5FE5E09-B2A3-446E-9B07-07518710E80F"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5A961FAF-768E-4092-BE4C-8B2127B37E74"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "427397BE-8B55-4583-A747-DEA5ECD4E24D"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D002F1D3-0503-45BC-995F-0DF181AF5084"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "39F88385-69A4-49C0-AE76-EB85EEF9DE08"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "817BC5E3-F5D9-41F7-8043-11EC175884BA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "7689CD25-153B-4EC2-A129-A953EC9F28F8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1A881AB5-B648-4E5F-A620-497CF014DCDD"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "A6393F39-E653-45AB-B1DC-14674C8B4435"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5806D274-3B1F-432A-B741-3CDAAB45CAA2"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "889E453E-8A1D-4352-A1EE-130385F34A4B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "1B166BA1-D8FA-42DF-BF3D-84D8B99D48DE"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "197D28BD-3D6C-4554-B95A-1EBFF767CEFA"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "C12812A1-8672-4F1F-B26C-F73B825D2FB6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "361DEDF1-EC15-4882-A722-92561A1E4FF6"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B453C2E7-BC32-4C16-81E7-02B7F3DA5297"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B2F91571-65D2-47DD-870E-6AEB8E645A78"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CF7B7D9B-CD9E-4DB2-9F44-BEC03F8CF1CF"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "DC7515C3-CDEB-490E-8A4F-122B05609FF4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "3E10FC58-8B21-4CCF-ABEE-27CCD1E312A7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "12D59B6A-B786-470C-8A59-D06FADBB59AF"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F44ED72F-40D7-4402-A87B-CDD5FFC29EE2"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9DD1BDB4-17CC-42B1-BF83-ADFC230DE491"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "083745D2-80BB-49F1-957D-A1975CEBE76A"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "15E0EE9A-397B-42FD-B854-C44D3CA8EE74"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "9689BEEB-6316-48D1-A889-D08DE0901F0B"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "49AB4BB3-0DB5-4736-B589-509BA09B8A64"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F72BF546-2615-47CA-84F4-B86DE739F744"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "03271A9D-2167-432E-8B60-5813B98B26EC"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "34F2D272-F59C-46BF-80EE-39666C5F2E6E"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "36367BA5-05A6-4905-B0E0-8AE787B80A57"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "119838DD-7CCD-48D1-ACF8-71F05214A650"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "5DC75406-BBA4-4B92-B30D-697A8C14D0AB"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "B0B1F4F2-9E50-4067-A34F-B162FA1060B7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D18533F6-4D60-46E7-A4E0-EA6822BCF7F4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CBD0F1EC-9FF0-43C7-89A6-B6A10965FFD8"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CF43B2F1-CBD0-42D1-8F50-CD2B44EA12C0"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "F6AF9E21-2824-44EF-AFEF-3302733B66D4"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "CDF49A6C-00AB-4FDA-B203-F64869313A07"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete album id "D6879EFC-7FD7-4D60-AE72-B671C44D89E7"
			set aOK to aOK + 1
		on error eM
			set aFail to aFail + 1
			if firstErr is "" then set firstErr to eM
		end try
		try
			delete folder id "7AD33DEE-31A4-4B12-8726-355C8185DCCE"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "18892D02-A63C-460B-ACC1-17FFFA7F043C"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "69AD3E7B-D956-4E19-B5C3-8A764A25D2D3"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "B4A4E45D-223F-4D89-A682-DF0BE11CBD65"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "BEA3E865-8E5D-4150-B031-9A12C207C7CA"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "0000C5FE-BA83-4E5A-8CCA-A27FB7952470"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "7E091D65-B89E-4956-9BD8-2E459F16724F"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "4EA06F06-FAD8-4D32-9104-A190056560E1"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "F587DCC8-FBC7-4958-81CD-619D9582B4FF"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "0D292F38-B745-406C-8409-8E2304FFDE5A"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "15EB3942-42B7-4C1E-AB9E-70DA9DDF8C0E"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C68B7F53-5BAC-4955-A2DD-1697A68545C4"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "8CC3CD2E-761A-4657-8247-963FD4872A16"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "86D05A77-55DD-48AA-83E8-D436A40267D6"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5716C350-2090-4038-98A6-12711EB60072"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2AF1E74F-7E24-459F-BDB3-F88DFCCCA61A"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "A261CB9B-C1FD-47E3-8B47-0163777D72FC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "D9E6F3B6-16EE-41BA-B2E8-3CFD7D2CA620"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2DE62883-0B2C-4F38-BA6F-371B77B9FDDC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "9440B3E1-456E-4F7E-B511-B4CC202DEB90"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "F6BDE771-F751-4925-A3A3-B342157294BA"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "879FCFEA-F213-4D83-8557-BD0DD0EE17E0"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "8C5F8141-B33A-43CD-B739-FB6819B4E046"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5D9E5F8D-43E4-4A72-9B26-A54D019330D6"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5D235989-7C25-4D4E-A86A-6225F44A0C75"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "B26D38AF-E666-43E7-979E-E58FE14131E9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "280D305F-1881-426E-8132-7C53F97264BC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C767172C-AD59-43F8-BB93-F5FED80442C5"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "0E1685EB-B2E7-43D0-9F9E-7BC96EA90F37"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "36789D59-3F20-4120-818C-93804F636118"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "115B0664-DE54-482F-8557-755F8AC5B7B9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "55091630-9612-4B7F-BD11-DB1DA0566B11"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5525A70B-5606-44DA-BD24-40B4B12FE595"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "4D3280DC-5F0B-4562-A353-D8BD1050C3FD"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "845E98E1-E5E5-4A7A-A499-3D79551BDC82"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2900AA6F-7B80-438A-86B1-7104B749D166"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "561B620E-5756-4D6F-AA9C-AEBBA6E27516"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2CE6E249-2F08-4E4A-B24B-3112E62BA39C"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "F2A004DC-763A-4DD0-802A-CE1EA7A7BD2B"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "220FA886-A43F-4E62-80B3-FF61ED076BF0"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "B56041FA-9296-4A94-9760-9A201549735A"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5B5C0432-7C98-4A71-A6A1-CFAD454356C3"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5C1C7938-8651-41F9-8C43-1217580C179B"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "60F39653-7342-4CCA-B10F-2A05A5BFFC69"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "A31E9BA2-9E05-413A-900F-84C0B18B794D"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "943A98F8-46AC-4934-8086-DAB4A65F22BC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "B55307F2-953B-4817-8137-C79B215379B9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2EA00912-5E2C-4343-A13B-1FC678673C32"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C6E77331-C367-47B9-8F82-850A2FD49DE4"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "11B3F6B6-6282-4CA7-9B9B-E3F3A2A4F85B"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "1B91461F-BAED-4293-B856-7A7AE8A99DF9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "FC346288-939A-4DF5-BCB6-B413BDBB7427"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "4BC33E0B-5592-478A-802E-9152D5B35E87"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "957CD297-F70A-477F-BB4E-6B9B140041EA"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "771CAECA-E2EB-4027-810D-34DC1FDE9807"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "98C25A45-3561-416D-B37E-8BE158527EA4"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "8BF461B2-08B1-4DF7-ADC4-11D119CB32CC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "99F2424A-F2A5-47E3-A296-C76616892893"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "6160EDB1-48BF-439E-8336-FF8C00E9B926"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "7BE0B88F-F66D-4D7D-B230-9FDEE63D84C7"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "F2AA38B5-1A06-4C22-AB0E-DE0933479A95"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "39F4080C-E20E-44A7-8AA9-66CE9239C722"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "514C6646-4FB0-4D11-A110-E1E176EEC4E1"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "38695967-E506-4C02-87C1-561DBF74F8FA"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "0C3BE00D-5A68-440E-A4FD-B06F20C2378F"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "A834E3FF-FD80-454C-B82A-ECB7ECA23A7D"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "CFBD08E4-A20D-4090-9C45-63EF4D39C536"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "03647232-1A16-4113-A32E-52FEF54AEDDC"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "02D1E111-DBF4-4600-92FB-FE5FFD7E9EFE"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C5A4B573-2DF1-4B7C-A749-10D9DBBB4B8B"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "627CA71A-7081-4736-9CCC-0CC5F92B93E9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "5A6E7D47-7625-4F91-8594-2F5797CEAFD9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "116109D6-51F8-47C6-9F9F-BAEBFE1599D3"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "0D2D231D-0A15-47A9-A7B4-7D94752DF4E8"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "9587A705-F44D-41B2-A65D-CB7FBEBDAE80"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "92CFBC4A-7B7F-49D5-AD05-D5749D62C63F"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "551F9C8D-4B83-428A-AA55-C37FCB314C5E"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "89BC073B-7764-411C-B666-CDDF53809196"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "BEA1C55F-F42E-4736-ABAC-2AD9E05A51B5"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "BF810747-015F-4A04-AAEC-D8306D70F286"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "739F7ECE-6021-4B30-BB6C-F908F6D6C720"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C0784737-0C1B-47DF-BF9B-B56C2A1F18C9"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "B1FA659C-B7A5-4F5D-8AD2-6508ECB9F961"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "798602D4-2838-4A57-8F28-42E0B421125F"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "3F818662-3168-42D0-8E00-3CCA7FE98680"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "CD4740DE-3696-4E20-8F99-BBAFE7588CDB"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "1A700809-E576-4FEC-828D-2ED838A8F4A2"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "9F6D5EC0-6C0E-4C8B-880E-1F1FB4213E12"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "9EA20DD0-BE0A-470A-A401-62A5F1269605"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "FF4CCE28-9857-4C58-BC5A-7A502A6E0B8A"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "DC3AA96B-58F6-464D-8C81-7E4B91003A43"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "AA81EA80-F688-4D63-BC07-478CF81FA51C"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "2989E7A7-35CD-47E5-90DF-7F8B95D00ECA"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "C5E4EE40-BC3A-43F3-9549-971D97AC7206"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
		try
			delete folder id "19664D1F-F0E3-4EFC-880D-28F9D002EFD6"
			set fOK to fOK + 1
		on error eM2
			set fFail to fFail + 1
			if firstErr is "" then set firstErr to eM2
		end try
	end timeout
end tell
display dialog ("Albums deleted: " & aOK & " (failed " & aFail & ")" & return & "Folders deleted: " & fOK & " (failed " & fFail & ")" & return & return & "First error: " & firstErr) buttons {"OK"} default button 1
