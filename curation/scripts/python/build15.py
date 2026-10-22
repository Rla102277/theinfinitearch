import json,sqlite3,collections,os,csv
o=sqlite3.connect("ia_index.sqlite")
P=json.load(open("place_proposals.json"))
G=collections.defaultdict(list)
for u,pl,lc,n in P: G[(lc,pl)].append(u)
ak=[u for u, in o.execute("select uuid from assets where trashed=0 and ('|'||keywords||'|') like '%|Loc: AK|%'")]
G[("Loc: Ketchikan, AK","Place: Alaska","AK fix")]=ak
src=open(os.path.expanduser("~/mnt/Pictures/_IA_review/runner/pending/12_TripsMaybe.applescript")).read()
hdr=src[:src.index("\non run")+1]
out=[hdr,"on run",'\tmy logit("PLACEFIX START")','\tset fo to my getFolder("_place fix (temporary)")']
tot=0
for i,(k,us) in enumerate(sorted(G.items(),key=lambda x:-len(x[1]))):
    lc,pl=k[0],k[1]; an=(("%02d "%i)+(pl.replace("Place: ","")+" "+lc.replace("Loc: ","")).strip())[:60].replace('"',"'")
    out+=[f'\tset n to my fillA("{an}", fo, "'+"\n".join(us)+'")',f'\ttell application "Photos" to set al to album "{an}" of fo',
          f'\tset k to my stamp(al, "{lc}", "{pl}")',f'\tmy logit("{an}: " & n & " filled, " & k & " stamped of {len(us)}")']
    tot+=len(us)
out+=['\tmy logit("PLACEFIX DONE")',"end run",""]
open(os.path.expanduser("~/mnt/Pictures/_IA_review/runner/pending/15_PlaceFixes.applescript"),"w").write("\n".join(out))
w=csv.writer(open(os.path.expanduser("~/mnt/Pictures/_IA_review/_work/index/place_proposals.csv"),"w")); w.writerow(["uuid","filename","camera","date_local","place","loc","anchors_within_3h"])
for u,pl,lc,n in P:
    r=o.execute("select filename,model,date_local from assets where uuid=?",(u,)).fetchone(); w.writerow([u,r[0],r[1],r[2][:19],pl,lc,n])
print(len(G),tot,len(ak))
