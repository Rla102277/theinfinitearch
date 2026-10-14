import sqlite3,urllib.parse,os,collections,datetime,json
LIB=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary")
c=sqlite3.connect("file:"+urllib.parse.quote(LIB+"/database/Photos.sqlite")+"?mode=ro",uri=True)
A={}
for pk,u,fn,d in c.execute("""select Z_PK,ZUUID,ZFILENAME,date(ZDATECREATED+978307200,'unixepoch')
   from ZASSET where ZTRASHEDSTATE=0 and ZKIND=0 and ZHIDDEN=0"""): A[pk]=(u,fn,d)
byday=collections.defaultdict(list)
for pk,v in A.items(): byday[v[2]].append(pk)
loc={}
for k,t in c.execute("select Z_PK,ZTITLE from ZKEYWORD where ZTITLE like 'Loc: %'"):
    loc[t[5:]]={a for (a,) in c.execute("""select d.ZASSET from Z_1KEYWORDS j join ZADDITIONALASSETATTRIBUTES d
        on d.Z_PK=j.Z_1ASSETATTRIBUTES where j.Z_53KEYWORDS=?""",(k,))}
allcov=set().union(*loc.values())
V=json.load(open("visit_blocks.json"))
PAD=2
cand=collections.defaultdict(list); claim=collections.defaultdict(set)
for name,v in V.items():
    for b0,b1,_ in v["real"]:
        x=datetime.date.fromisoformat(b0)-datetime.timedelta(days=PAD)
        e=datetime.date.fromisoformat(b1)+datetime.timedelta(days=PAD)
        while x<=e:
            for pk in byday.get(x.isoformat(),[]):
                if pk not in allcov: claim[pk].add(name)
            x+=datetime.timedelta(days=1)
# away clusters -> their own buckets
for s,e,nd,n,mi,nm,dd,md in json.load(open("missed_trips.json")):
    x=datetime.date.fromisoformat(s)-datetime.timedelta(days=PAD)
    ee=datetime.date.fromisoformat(e)+datetime.timedelta(days=PAD)
    tag=nm if not nm.startswith("?") else f"UNKNOWN {s}"
    while x<=ee:
        for pk in byday.get(x.isoformat(),[]):
            if pk not in allcov: claim[pk].add(tag)
        x+=datetime.timedelta(days=1)
for pk,names in claim.items():
    key=" / ".join(sorted(names)) if len(names)>1 else list(names)[0]
    cand[key].append(pk)
tot=len(claim)
print(f"CANDIDATE FRAMES TO REVIEW BY EYE: {tot}")
print(f"(windows widened +/-{PAD} days, no GPS veto, nothing excluded)\n")
out={}
for key,pks in sorted(cand.items(),key=lambda kv:-len(kv[1])):
    pks.sort(key=lambda p:A[p][2])
    out[key]=[[A[p][0],A[p][1],A[p][2]] for p in pks]
    if len(pks)>=60: print(f"  {len(pks):6d}  {key}")
print(f"\n  buckets: {len(out)}   (showing those >=60)")
json.dump(out,open("candidates.json","w"))
