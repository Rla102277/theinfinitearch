import sqlite3,urllib.parse,os,collections,re,json,datetime
B=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
c=sqlite3.connect("file:"+urllib.parse.quote(B+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=10)
par={pk:pf for pk,pf in c.execute("select Z_PK,ZPARENTFOLDER from ZGENERICALBUM where ZTRASHEDSTATE=0")}
def under(pk):
    while pk:
        if pk in (4112,4159): return True
        pk=par.get(pk)
albs=[pk for pk in par if under(pk)]
used={a for (a,) in c.execute(f"select Z_3ASSETS from Z_34ASSETS where Z_34ALBUMS in ({','.join(map(str,albs))})")}
face=collections.defaultdict(float)
for a,s in c.execute("select ZASSETFORFACE,ZSIZE from ZDETECTEDFACE where ZASSETFORFACE is not null and (ZHIDDEN=0 or ZHIDDEN is null)"): face[a]=max(face[a],s or 0)
kw=collections.defaultdict(list)
for aa,t in c.execute("select j.Z_1ASSETATTRIBUTES,k.ZTITLE from Z_1KEYWORDS j join ZKEYWORD k on k.Z_PK=j.Z_53KEYWORDS where k.ZTITLE like 'Place:%' or k.ZTITLE like 'Loc:%'"): kw[aa].append(t)
t0=(datetime.datetime(2022,10,1)-datetime.datetime(2001,1,1)).total_seconds()
rows=c.execute("""select a.Z_PK,a.ZUUID,a.ZDATECREATED,b.Z_PK,a.ZOVERALLAESTHETICSCORE,a.ZFAVORITE,ifnull(e.ZCAMERAMODEL,'?'),b.ZORIGINALFILENAME,a.ZWIDTH,a.ZHEIGHT,a.ZUNIFORMTYPEIDENTIFIER
 from ZASSET a join ZADDITIONALASSETATTRIBUTES b on b.ZASSET=a.Z_PK left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK
 where a.ZTRASHEDSTATE=0 and a.ZKIND=0 and a.ZHIDDEN=0 and a.ZVISIBILITYSTATE=0 and (a.ZCLOUDISMYASSET is null or a.ZCLOUDISMYASSET=1)
 and a.ZDATECREATED>=?""",(t0,)).fetchall()
scr={(1179,2556),(1320,2868),(1290,2796),(1170,2532),(1242,2208),(1125,2436),(828,1792)}
X=[];drop=collections.Counter()
for pk,u,dc,aa,sc,fav,cam,fn,w,h,ut in rows:
    if pk in used: drop['chaptered']+=1; continue
    if (w,h) in scr or (h,w) in scr or (ut or '').endswith('png'): drop['screenshot']+=1; continue
    loc=[k for k in kw.get(aa,[]) if k.startswith('Place:')] or kw.get(aa,[]) or ['']
    X.append(dict(u=u,t=dc+978307200,sc=sc or 0,fav=fav or 0,cam=cam.strip(),face=face.get(pk,0),loc=loc[0].split(':',1)[-1].strip()))
X.sort(key=lambda x:x['t']); comp=[];cur=[X[0]]
for x in X[1:]:
    if x['t']-cur[-1]['t']<=75 and x['cam']==cur[-1]['cam']: cur.append(x)
    else: comp.append(cur);cur=[x]
comp.append(cur)
best=[max(g,key=lambda x:(x['fav'],x['sc'])) for g in comp]
for i,b in enumerate(best): b['id']="Y%04d"%(i+1); b['n']=len(comp[i])
json.dump(best,open("Y_pick.json","w"))
print(drop,"frames",len(X),"comps",len(best))
print(collections.Counter(datetime.datetime.utcfromtimestamp(b['t']).year for b in best))
print(collections.Counter('iPhone' if b['cam'].startswith(('iPhone','iPad')) else ('?' if b['cam']=='?' else 'camera') for b in best))
