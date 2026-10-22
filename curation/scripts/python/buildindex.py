import sqlite3,urllib.parse,os,json,glob,datetime,re,collections
B=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
c=sqlite3.connect("file:"+urllib.parse.quote(B+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=10)
OUT=os.path.expanduser("~/w/ia_index.sqlite")
if os.path.exists(OUT): os.remove(OUT)
o=sqlite3.connect(OUT)
# albums
alb={pk:(t,pf,k) for pk,t,pf,k in c.execute("select Z_PK,ZTITLE,ZPARENTFOLDER,ZKIND from ZGENERICALBUM where ZTRASHEDSTATE=0")}
def path(pk):
    p=[];x=pk;n=0
    while x in alb and n<10:
        t,pf,k=alb[x]
        if t: p.append(t)
        x=pf;n+=1
    return "/".join(reversed(p))
amem=collections.defaultdict(list)
for al,a in c.execute("select Z_34ALBUMS,Z_3ASSETS from Z_34ASSETS"):
    if al in alb: amem[a].append(path(al))
kw={pk:t for pk,t in c.execute("select Z_PK,ZTITLE from ZKEYWORD")}
kmem=collections.defaultdict(list)
for aa,k in c.execute("select Z_1ASSETATTRIBUTES,Z_53KEYWORDS from Z_1KEYWORDS"): kmem[aa].append(kw.get(k,''))
# seen pools
seen=collections.defaultdict(set)
for f in glob.glob("*.json"):
    try: J=json.load(open(f))
    except: continue
    if isinstance(J,list):
        for x in J:
            if isinstance(x,dict) and 'u' in x: seen[x['u']].add(f.replace('.json',''))
            if isinstance(x,dict) and 'pk' in x and 'u' not in x: pass
q=c.execute("""select a.Z_PK,a.ZUUID,ifnull(aa.ZORIGINALFILENAME,''),trim(ifnull(e.ZCAMERAMAKE,'')),trim(ifnull(e.ZCAMERAMODEL,'')),trim(ifnull(e.ZLENSMODEL,'')),
 a.ZDATECREATED,ifnull(e.ZTIMEZONEOFFSET,aa.ZTIMEZONEOFFSET),aa.ZEXIFTIMESTAMPSTRING,a.ZADDEDDATE,a.ZWIDTH,a.ZHEIGHT,a.ZKIND,a.ZUNIFORMTYPEIDENTIFIER,
 a.ZHIDDEN,a.ZTRASHEDSTATE,a.ZCLOUDISMYASSET,a.ZLIBRARYSCOPE,a.ZFAVORITE,a.ZLATITUDE,a.ZLONGITUDE,a.ZAVALANCHEUUID,aa.Z_PK,aa.ZIMPORTEDBYDISPLAYNAME
 from ZASSET a left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK left join ZADDITIONALASSETATTRIBUTES aa on aa.ZASSET=a.Z_PK""").fetchall()
o.execute("""create table assets(pk int primary key,uuid text,filename text,make text,model text,lens text,date_utc text,date_local text,exif_ts text,
 olympus_mmdd text,added text,w int,h int,kind int,uti text,hidden int,trashed int,shared int,libscope int,fav int,lat real,lon real,burst text,importer text,
 albums text,keywords text,in_chapters int,seen text)""")
mo={'1':'01','2':'02','3':'03','4':'04','5':'05','6':'06','7':'07','8':'08','9':'09','A':'10','B':'11','C':'12'}
rows=[]
for (pk,u,fn,mk,md,ln,dc,tz,ets,ad,w,h,k,uti,hid,tr,cl,ls,fav,la,lo,bu,aapk,imp) in q:
    if dc is None: continue
    t=dc+978307200; du=datetime.datetime.utcfromtimestamp(t)
    dl=du+datetime.timedelta(seconds=tz or 0)
    m=re.match(r'^P([1-9ABC])(\d\d)\d{4}\.',fn,re.I)
    om=(mo[m.group(1).upper()]+m.group(2)) if m else None
    al=amem.get(pk,[])
    rows.append((pk,u,fn,mk,md,ln,du.isoformat(),dl.isoformat(),ets,om,datetime.datetime.utcfromtimestamp((ad or 0)+978307200).isoformat(),w,h,k,uti,hid,tr,
      0 if cl==0 else 1,ls,fav,la if la and la>-90 else None,lo if la and la>-90 else None,bu,imp,"|".join(al),"|".join(kmem.get(aapk,[])),
      int(any(x.startswith("CHAPTERS") for x in al)),",".join(sorted(seen.get(u,[])))))
o.executemany("insert into assets values("+",".join("?"*28)+")",rows)
o.execute("create index im on assets(model)"); o.commit()
print(len(rows))
