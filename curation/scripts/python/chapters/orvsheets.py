import json,os,datetime,sqlite3,urllib.parse,collections,re,sys
from PIL import Image,ImageDraw,ImageFont
d=json.load(open("v3place.json")); F={x['u']:x for x in d['frames']}; f=json.load(open("v3final.json"))
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
P=sqlite3.connect("file:"+urllib.parse.quote(L+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=5)
q={u:(k,fn or '',sc or 0,fav) for k,u,fn,sc,fav in P.execute("select a.Z_PK,a.ZUUID,b.ZORIGINALFILENAME,a.ZOVERALLAESTHETICSCORE,a.ZFAVORITE from ZASSET a join ZADDITIONALASSETATTRIBUTES b on b.ZASSET=a.Z_PK")}
used={}
for c,fn in zip("TCWEK",["T_pick.json","C_pick.json","W_pick.json","E_pick.json","K_pick.json"]):
    for x in json.load(open(fn)): used[x['u']]=c
X=json.load(open("X_pick.json")); wp={}
for line in open("wp_compact.txt"):
    k,v=line.strip().split(":")
    for i in v.split(","): wp["X%04d"%int(i)]=k
for x in X:
    if x['id'] in wp: used[x['u']]=wp[x['id']].lower()
def pool(mode):
    if mode=="orv":
        us=[u for u in F if ('2022-03-14'<=F[u]['d']<='2022-03-21') or ('2024-03-09'<=F[u]['d']<='2024-03-11')]
        us.sort(key=lambda u:F[u]['t'])
    else:
        us=[u for u in F if u in q and (re.match(r'\d{7}_\d{7}-R',q[u][1]) or F[u]['cam'].strip()=='QSS-32_33' or 'Scan' in q[u][1])]
        us.sort(key=lambda u:q[u][1])
    return us
mode=sys.argv[1]; us=[u for u in pool(mode) if u in q]
font=ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",13)
O=os.path.expanduser("~/mnt/Pictures/_IA_review/"+mode); os.makedirs(O,exist_ok=True)
C,R,W,H=8,6,240,200; ids=[]
for i,u in enumerate(us): ids.append(dict(id="%s%04d"%(mode[0].upper(),i+1),u=u))
json.dump(ids,open(mode+"_pick.json","w"))
for s in range(0,len(us),C*R):
    im=Image.new("RGB",(C*W,R*H),"black"); dr=ImageDraw.Draw(im)
    for i,u in enumerate(us[s:s+C*R]):
        cx,cy=(i%C)*W,(i//C)*H; n=s+i+1
        try: t=Image.open(os.path.join(L,"resources/derivatives/masters",u[0],u+"_4_5005_c.jpeg")); t.draft('RGB',(W,H)); t.thumbnail((W-4,H-18)); im.paste(t,(cx+2,cy+2))
        except Exception as e: dr.text((cx+8,cy+50),"no preview",fill="red",font=font)
        lab="%04d %s %s %s"%(n,datetime.datetime.utcfromtimestamp(F[u]['t']).strftime("%m%d"),F[u]['cam'][:7],used.get(u,''))
        dr.text((cx+3,cy+H-15),lab,fill="cyan" if u in used else "yellow",font=font)
    im.save(os.path.join(O,"%s_%03d.jpg"%(mode,s//(C*R))),quality=75)
print(mode,len(us),"frames",(len(us)+47)//48,"sheets; already chaptered",sum(u in used for u in us))
