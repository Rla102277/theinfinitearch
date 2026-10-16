import sqlite3,urllib.parse,os,json,collections
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/database/")
P=sqlite3.connect("file:"+urllib.parse.quote(L+"Photos.sqlite")+"?mode=ro",uri=True,timeout=5)
f=json.load(open("v3final.json")); d=json.load(open("v3place.json")); F={x['u']:x for x in d['frames']}
pk={u:(k,sc,fav) for k,u,sc,fav in P.execute("select Z_PK,ZUUID,ZOVERALLAESTHETICSCORE,ZFAVORITE from ZASSET")}
face=collections.defaultdict(float)
for a,s in P.execute("select ZASSETFORFACE,ZSIZE from ZDETECTEDFACE where ZASSETFORFACE is not null and (ZHIDDEN=0 or ZHIDDEN is null)"):
    face[a]=max(face[a],s or 0)
used=set()
for fn in ["T_pick.json","C_pick.json","W_pick.json","E_pick.json","K_pick.json"]: used|={x['u'] for x in json.load(open(fn))}
c=[]
for u,x in F.items():
    if u in used or u not in f: continue
    cam=x['cam'].strip()
    if cam in('?','') : continue
    k,sc,fav=pk[u]
    c.append(dict(u=u,t=x['t'],cam=cam,sc=sc or 0,fav=fav,face=face.get(k,0),loc=f[u]['loc'] or 'NO LOCATION'))
c.sort(key=lambda x:x['t']); comp=[];cur=[c[0]]
for x in c[1:]:
    if x['t']-cur[-1]['t']<=75 and x['cam']==cur[-1]['cam']: cur.append(x)
    else: comp.append(cur);cur=[x]
comp.append(cur)
best=[max(g,key=lambda x:(x['fav'],x['sc'])) for g in comp]
ip=lambda b: b['cam'].startswith('iPhone') or b['cam'].startswith('iPad')
real=[b for b in best if not ip(b)]
print("frames",len(c),"comps",len(best),"real-cam comps",len(real),"iphone comps",len(best)-len(real))
print("real no-face",sum(b['face']<0.03 for b in real),"real with face",sum(b['face']>=0.03 for b in real))
json.dump(best,open("wide_all.json","w"))
