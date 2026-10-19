import sqlite3,urllib.parse,os,collections,re,datetime,json
B=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
c=sqlite3.connect("file:"+urllib.parse.quote(B+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=10)
# all albums under CHAPTERS and FILM (recursive)
par={pk:pf for pk,pf in c.execute("select Z_PK,ZPARENTFOLDER from ZGENERICALBUM where ZTRASHEDSTATE=0")}
def under(pk,roots):
    while pk:
        if pk in roots: return True
        pk=par.get(pk)
    return False
roots={4112,4159}
albs=[pk for pk in par if under(pk,roots)]
used={a for (a,) in c.execute(f"select Z_3ASSETS from Z_34ASSETS where Z_34ALBUMS in ({','.join(map(str,albs))})")}
print("assets already in CHAPTERS/FILM:",len(used))
kw=collections.defaultdict(list)
for aa,t in c.execute("select j.Z_1ASSETATTRIBUTES,k.ZTITLE from Z_1KEYWORDS j join ZKEYWORD k on k.Z_PK=j.Z_53KEYWORDS where k.ZTITLE like 'Loc:%' or k.ZTITLE like 'Place:%'"):
    kw[aa].append(t)
rows=c.execute("""select a.Z_PK,a.ZUUID,b.ZORIGINALFILENAME,a.ZDATECREATED,b.Z_PK,a.ZOVERALLAESTHETICSCORE,a.ZFAVORITE,a.ZWIDTH,a.ZHEIGHT
 from ZASSET a join ZADDITIONALASSETATTRIBUTES b on b.ZASSET=a.Z_PK left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK
 where a.ZTRASHEDSTATE=0 and a.ZKIND=0 and a.ZHIDDEN=0 and a.ZVISIBILITYSTATE=0 and (a.ZCLOUDISMYASSET is null or a.ZCLOUDISMYASSET=1)
 and (e.ZCAMERAMODEL is null or e.ZCAMERAMODEL='')""").fetchall()
raw=[r for r in rows if re.search(r'\.(raf|arw|dng|orf|nef|cr2|cr3|rw2)$',r[2] or '',re.I)]
print("no-camera raw:",len(raw), collections.Counter(os.path.splitext(r[2])[1].lower() for r in raw))
raw=[r for r in raw if r[0] not in used]
print("not yet in chapters/film:",len(raw))
X=[]
for pk,u,fn,dc,aa,sc,fav,w,h in raw:
    loc=[k for k in kw.get(aa,[]) if k.startswith('Place:')] or kw.get(aa,[]) or ['']
    X.append(dict(u=u,fn=fn,t=(dc or 0)+978307200,sc=sc or 0,fav=fav or 0,loc=loc[0].split(':',1)[-1].strip(),pre=os.path.splitext(fn)[0][:4]))
X.sort(key=lambda x:(x['t'],x['fn']))
comp=[];cur=[X[0]]
for x in X[1:]:
    if x['t']-cur[-1]['t']<=75 and x['pre']==cur[-1]['pre']: cur.append(x)
    else: comp.append(cur);cur=[x]
comp.append(cur)
best=[max(g,key=lambda x:(x['fav'],x['sc'])) for g in comp]
for i,b in enumerate(best): b['id']="R%04d"%(i+1); b['n']=len(comp[i])
json.dump(best,open("R_pick.json","w"))
print("compositions",len(best)); print(collections.Counter(datetime.datetime.utcfromtimestamp(b['t']).year for b in best).most_common())
