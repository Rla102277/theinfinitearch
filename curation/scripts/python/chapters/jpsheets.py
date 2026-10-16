import sqlite3,urllib.parse,os,datetime,json
from PIL import Image,ImageDraw,ImageFont
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
P=sqlite3.connect("file:"+urllib.parse.quote(L+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=5)
D=lambda y,m,d:(datetime.datetime(y,m,d)-datetime.datetime(2001,1,1)).total_seconds()
rows=P.execute("""select a.ZUUID,b.ZORIGINALFILENAME,a.ZWIDTH,a.ZHEIGHT,a.ZDATECREATED,a.ZADDEDDATE,e.ZCAMERAMODEL
 from ZASSET a join ZADDITIONALASSETATTRIBUTES b on b.ZASSET=a.Z_PK left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK
 where a.ZTRASHEDSTATE=0 and a.ZKIND=0 and a.ZDATECREATED between ? and ? and (e.ZCAMERAMODEL is null or e.ZCAMERAMODEL='')
 order by a.ZADDEDDATE, b.ZORIGINALFILENAME""",(D(2026,7,16),D(2026,7,29))).fetchall()
rows=[r for r in rows if not ((r[2],r[3]) in((1242,2208),(1179,2556),(1320,2868)) )]
ids=[dict(id="J%04d"%(i+1),u=r[0],fn=r[1]) for i,r in enumerate(rows)]; json.dump(ids,open("jp_pick.json","w"))
font=ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",13)
O=os.path.expanduser("~/mnt/Pictures/_IA_review/japan"); os.makedirs(O,exist_ok=True)
for f in os.listdir(O): os.remove(os.path.join(O,f))
C,R,W,H=8,6,240,200
for s in range(0,len(rows),48):
    im=Image.new("RGB",(C*W,R*H),"black"); dr=ImageDraw.Draw(im)
    for i,r in enumerate(rows[s:s+48]):
        u=r[0]; cx,cy=(i%C)*W,(i//C)*H
        try: t=Image.open(os.path.join(L,"resources/derivatives/masters",u[0],u+"_4_5005_c.jpeg")); t.draft('RGB',(W,H)); t.thumbnail((W-4,H-18)); im.paste(t,(cx+2,cy+2))
        except: dr.text((cx+8,cy+50),"no preview",fill="red",font=font)
        ad=datetime.datetime.utcfromtimestamp(r[5]+978307200).strftime("%m%d")
        dr.text((cx+3,cy+H-15),"%04d a%s %dx%d"%(s+i+1,ad,r[2],r[3]),fill="yellow",font=font)
    im.save(os.path.join(O,"jp_%03d.jpg"%(s//48)),quality=75)
print(len(rows),"frames",(len(rows)+47)//48,"sheets")
