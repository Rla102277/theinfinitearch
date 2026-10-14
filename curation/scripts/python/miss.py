import sqlite3,urllib.parse,os,json,collections
from PIL import Image,ImageDraw,ImageFont
LIB=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary")
c=sqlite3.connect("file:"+urllib.parse.quote(LIB+"/database/Photos.sqlite")+"?mode=ro",uri=True)
WIN=[("2009-08-03","2009-08-07"),("2013-06-17","2013-06-19"),("2016-01-22","2016-01-25"),
("2017-09-28","2017-10-02"),("2018-10-18","2018-10-22"),("2019-10-17","2019-10-21"),
("2021-10-21","2021-10-25"),("2022-10-20","2022-10-24"),("2023-10-19","2023-10-23"),("2024-03-10","2024-03-12")]
inalb=set(r[0] for r in c.execute("select Z_3ASSETS from Z_34ASSETS where Z_34ALBUMS=2908"))
rows=[]
for s,e in WIN:
    for pk,u,fn,d,la,lo in c.execute("""select Z_PK,ZUUID,ZFILENAME,strftime('%Y-%m-%d',ZDATECREATED+978307200,'unixepoch') dd,ZLATITUDE,ZLONGITUDE
        from ZASSET where ZTRASHEDSTATE=0 and ZKIND=0 and ZHIDDEN=0 and dd>=? and dd<=? order by ZDATECREATED""",(s,e)):
        if pk in inalb: continue
        # keep if GPS is in NOLA box OR has no usable GPS (unknown, keep for review)
        ok = (la and -90.2<lo<-89.9 and 29.85<la<30.10) or (not la or la<-179)
        if ok: rows.append({"uuid":u,"file":fn,"date":d})
print("candidates:",len(rows))
def deriv(u):
    for pth in (f"{LIB}/resources/derivatives/masters/{u[0]}/{u}_4_5005_c.jpeg",
                f"{LIB}/resources/derivatives/{u[0]}/{u}_1_105_c.jpeg"):
        if os.path.exists(pth): return pth
items=[]
for r in rows:
    p=deriv(r["uuid"])
    if p: r["deriv"]=p; items.append(r)
for i,it in enumerate(items): it["idx"]=i+1
print("with derivatives:",len(items))
COLS,ROWS=4,6;CW,CH=500,375;PER=24;PAD=6;LBL=22
try: font=ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf",18)
except: font=ImageFont.load_default()
n=0
for s in range(0,len(items),PER):
    ch=items[s:s+PER]; n+=1
    W=COLS*(CW+PAD)+PAD; H=ROWS*(CH+LBL+PAD)+PAD+30
    sh=Image.new("RGB",(W,H),(24,24,26)); dr=ImageDraw.Draw(sh)
    dr.text((PAD,8),f"NOLA-MISSING sheet {n}  frames {ch[0]['idx']}-{ch[-1]['idx']}  {ch[0]['date']} to {ch[-1]['date']}",fill=(235,235,235),font=font)
    for k,it in enumerate(ch):
        r_,cc=divmod(k,COLS); x=PAD+cc*(CW+PAD); y=30+PAD+r_*(CH+LBL+PAD)
        try:
            im=Image.open(it["deriv"]).convert("RGB"); im.thumbnail((CW,CH),Image.LANCZOS)
            sh.paste(im,(x+(CW-im.width)//2,y+(CH-im.height)//2))
        except: dr.text((x+10,y+10),"ERR",fill=(255,80,80),font=font)
        dr.text((x+2,y+CH+2),f"M{it['idx']}  {it['date']}",fill=(190,190,195),font=font)
    sh.save(os.path.expanduser(f"~/mnt/Pictures/_IA_review/nola_missing/miss_{n:03d}.jpg"),quality=82)
json.dump(items,open(os.path.expanduser("~/mnt/Pictures/_IA_review/nola_missing/index.json"),"w"),indent=0)
print("sheets:",n)
