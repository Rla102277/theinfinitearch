import sqlite3,urllib.parse,os,collections,json,datetime,glob,sys
from PIL import Image,ImageDraw,ImageFont
B=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
c=sqlite3.connect("file:"+urllib.parse.quote(B+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=10)
par={pk:pf for pk,pf in c.execute("select Z_PK,ZPARENTFOLDER from ZGENERICALBUM where ZTRASHEDSTATE=0")}
title={pk:t for pk,t in c.execute("select Z_PK,ZTITLE from ZGENERICALBUM")}
def chap(pk):
    p=pk
    while p:
        if p==4112: return True
        p=par.get(p)
inch={}
for alb,a in c.execute("select Z_34ALBUMS,Z_3ASSETS from Z_34ASSETS"):
    if chap(alb): inch[a]=('T' if 'Tiered' in str(title.get(par.get(alb))) or 'Tiered' in str(title.get(alb)) else 'm')
fin={a for alb,a in c.execute("select Z_34ALBUMS,Z_3ASSETS from Z_34ASSETS where Z_34ALBUMS=3827")}
D=lambda s:(datetime.datetime.strptime(s,"%Y-%m-%d")-datetime.datetime(2001,1,1)).total_seconds()
TR=[("gua24","2024-09-26","2024-09-29"),("cap23","2023-11-09","2023-11-13"),("cb24","2024-05-02","2024-05-05"),("cap26","2026-04-23","2026-04-25")]
scr={(1179,2556),(1320,2868),(1290,2796),(1170,2532),(1242,2208)}
fp=(glob.glob("/usr/share/fonts/**/DejaVuSansMono.ttf",recursive=True))[0]; font=ImageFont.truetype(fp,13)
L=B+"resources/derivatives/masters"
summ={}
for tag,a,b in TR:
    rows=c.execute("""select a.Z_PK,a.ZUUID,a.ZDATECREATED,a.ZOVERALLAESTHETICSCORE,a.ZFAVORITE,ifnull(e.ZCAMERAMODEL,'?'),a.ZWIDTH,a.ZHEIGHT,a.ZUNIFORMTYPEIDENTIFIER
     from ZASSET a left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK
     where a.ZTRASHEDSTATE=0 and a.ZKIND=0 and a.ZHIDDEN=0 and (a.ZCLOUDISMYASSET is null or a.ZCLOUDISMYASSET=1)
     and a.ZDATECREATED between ? and ? order by a.ZDATECREATED""",(D(a),D(b)+86400)).fetchall()
    X=[]
    for pk,u,dc,sc,fav,cam,w,h,ut in rows:
        if (w,h) in scr or (h,w) in scr or (ut or '').endswith('png'): continue
        X.append(dict(pk=pk,u=u,t=dc+978307200,sc=sc or 0,fav=fav or 0,cam=cam.strip(),st=('F' if pk in fin else inch.get(pk,''))))
    comp=[];cur=[X[0]]
    for x in X[1:]:
        if x['t']-cur[-1]['t']<=20 and x['cam']==cur[-1]['cam']: cur.append(x)
        else: comp.append(cur);cur=[x]
    comp.append(cur)
    best=[]
    for g in comp:
        b=max(g,key=lambda x:(x['st']!='',x['fav'],x['sc'])); b=dict(b); b['n']=len(g); best.append(b)
    for i,x in enumerate(best): x['id']="%s%04d"%(tag,i+1)
    json.dump(best,open(f"trip_{tag}.json","w"))
    O=os.path.expanduser(f"~/mnt/Pictures/_IA_review/trips/{tag}"); os.makedirs(O,exist_ok=True)
    C,R,W,H=6,5,320,262; miss=0
    for s in range(0,len(best),30):
        im=Image.new("RGB",(C*W,R*H),"black"); dr=ImageDraw.Draw(im)
        for i,x in enumerate(best[s:s+30]):
            u=x['u']; cx,cy=(i%C)*W,(i//C)*H
            p=f"{L}/{u[0]}/{u}_4_5005_c.jpeg"
            if os.path.exists(p):
                t=Image.open(p); t.draft('RGB',(W,H)); t.thumbnail((W-4,H-18)); im.paste(t,(cx+2,cy+2))
            else: miss+=1; dr.text((cx+8,cy+60),"no preview",fill="red",font=font)
            col={'F':'magenta','T':'lime','m':'cyan'}.get(x['st'],'yellow')
            dr.text((cx+3,cy+H-15),"%04d %s x%d %s %s"%(s+i+1,datetime.datetime.utcfromtimestamp(x['t']).strftime("%m%d"),x['n'],x['cam'][:9],x['st']),fill=col,font=font)
        im.save(os.path.join(O,"%s_%03d.jpg"%(tag,s//30)),quality=76)
    summ[tag]=(len(X),len(best),(len(best)+29)//30,miss,sum(1 for x in best if x['st']))
for k,v in summ.items(): print(k,"frames %d shots %d sheets %d nopreview %d already-in %d"%v)
