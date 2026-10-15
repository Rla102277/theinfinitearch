import sqlite3,urllib.parse,os,plistlib,datetime,json,collections
p=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/database/Photos.sqlite")
c=sqlite3.connect("file:"+urllib.parse.quote(p)+"?mode=ro",uri=True)
q=lambda t,a=():c.cursor().execute(t,a).fetchall()
LIVE="a.ZTRASHEDSTATE=0 and a.ZKIND=0 and a.ZHIDDEN=0 and a.ZVISIBILITYSTATE=0 and (a.ZCLOUDISMYASSET is null or a.ZCLOUDISMYASSET=1)"
def unarch(b):
    pl=plistlib.loads(b); objs=pl['$objects']
    def R(x):
        if isinstance(x,plistlib.UID): return R(objs[x.data])
        if isinstance(x,dict):
            if 'NS.objects' in x: return [R(o) for o in x['NS.objects']]
            return {k:R(v) for k,v in x.items() if k!='$class'}
        if isinstance(x,list): return [R(o) for o in x]
        return x
    return R(pl['$top']['root'])
DFW={'Frisco','Plano','Garland','Dallas','McKinney','Allen','Richardson','The Colony','Little Elm','Prosper','Carrollton','Lewisville','Irving','Addison','Fort Worth','Arlington','Grapevine','Denton','Rowlett','Rockwall','Wylie','Murphy','Sachse','Celina','Grand Prairie','Mesquite','Flower Mound','Coppell','Southlake','Farmers Branch','Highland Park','University Park','Aubrey','Anna','Melissa','Princeton','Fairview','Lucas','Parker','Royse City','Forney'}
def label(pa):
    city=pa.get('_city') or pa.get('_subLocality') or ''; st=pa.get('_state') or ''; iso=pa.get('_ISOCountryCode') or ''; ctry=pa.get('_country') or ''
    if iso=='US':
        if st=='TX' and city in DFW: return 'Home (DFW)'
        return ("%s, %s"%(city,st)).strip(', ') if city else (st or 'USA')
    return ("%s, %s"%(city,ctry)).strip(', ') if city else ctry
rows=q(f"""select a.ZUUID,a.ZDATECREATED+978307200,a.ZLATITUDE,a.ZLONGITUDE,e.ZCAMERAMODEL,aa.ZREVERSELOCATIONDATA,aa.ZREVERSELOCATIONDATAISVALID
from ZASSET a left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK left join ZADDITIONALASSETATTRIBUTES aa on aa.ZASSET=a.Z_PK where {LIVE}""")
A=[]
for u,t,la,lo,cam,blob,valid in rows:
    cam=cam or '?'
    gps= la is not None and la!=-180 and lo!=-180 and 'E-510' not in cam
    lab=None
    if gps and blob and valid:
        try:
            r=unarch(blob); pa=r.get('postalAddress') or {}
            lab=label(pa)
        except Exception as ex: pass
    A.append(dict(u=u,t=t,d=datetime.datetime.utcfromtimestamp(t).date().isoformat(),cam=cam,gps=gps,anchor=lab))
A.sort(key=lambda x:x['t'])
print("frames",len(A),"anchors",sum(1 for x in A if x['anchor']))
# clusters gap<=3 days
cl=[];cur=[A[0]]
for x in A[1:]:
    if (datetime.date.fromisoformat(x['d'])-datetime.date.fromisoformat(cur[-1]['d'])).days<=3: cur.append(x)
    else: cl.append(cur);cur=[x]
cl.append(cur)
REAL=lambda cam:not cam.startswith('iPhone') and cam not in('?',)
out=[];blind=[];suspect=[]
for i,cc in enumerate(cl):
    anc=[x for x in cc if x['anchor']]
    cid="c%03d_%s"%(i,cc[0]['d'])
    places=collections.Counter(x['anchor'] for x in anc)
    if not anc:
        for x in cc: x['loc']=None;x['how']='blind'
        blind.append(dict(id=cid,n=len(cc),start=cc[0]['d'],end=cc[-1]['d'],cams=collections.Counter(x['cam'] for x in cc).most_common(3)))
    else:
        for x in cc:
            if x['anchor']: x['loc']=x['anchor'];x['how']='gps';continue
            near=min(anc,key=lambda y:abs(y['t']-x['t']))
            if abs(near['t']-x['t'])<=36*3600: x['loc']=near['anchor'];x['how']='nearest'
            else: x['loc']=places.most_common(1)[0][0];x['how']='cluster'
        # Quanah trap: home-anchored cluster with real-camera frames
        home=places.get('Home (DFW)',0)
        realn=sum(1 for x in cc if REAL(x['cam']) and not x['anchor'])
        if home==len(anc) and realn>=8 and len(places)==1:
            suspect.append(dict(id=cid,n=len(cc),real=realn,start=cc[0]['d'],end=cc[-1]['d'],cams=collections.Counter(x['cam'] for x in cc if REAL(x['cam'])).most_common(3)))
    out.append(dict(id=cid,n=len(cc),places=places.most_common(),uuids=[x['u'] for x in cc]))
json.dump(dict(frames=A,clusters=out,blind=blind,suspect=suspect),open("v3place.json","w"))
hows=collections.Counter(x['how'] for x in A)
print("placement:",dict(hows))
locs=collections.Counter(x['loc'] for x in A if x['loc'])
print(len(locs),"distinct places. Top 40:")
for k,v in locs.most_common(40): print("  %6d  %s"%(v,k))
print("\nblind clusters:",len(blind),"frames",sum(b['n'] for b in blind),"| 8+:",sum(1 for b in blind if b['n']>=8))
print("home-anchored clusters with 8+ real-camera frames (Quanah trap):",len(suspect),"frames",sum(s['real'] for s in suspect))
for s in sorted(suspect,key=lambda s:-s['real'])[:15]: print("  %s..%s real=%4d  %s"%(s['start'],s['end'],s['real'],s['cams']))
