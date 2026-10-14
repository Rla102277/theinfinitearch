import sqlite3,urllib.parse,os,json
from PIL import Image,ImageDraw,ImageFont
LIB=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary")
c=sqlite3.connect("file:"+urllib.parse.quote(LIB+"/database/Photos.sqlite")+"?mode=ro",uri=True)
rows=c.execute("""select ZUUID,ZFILENAME,strftime('%Y-%m-%d',ZDATECREATED+978307200,'unixepoch') d
 from ZASSET where ZTRASHEDSTATE=0 and ZKIND=0 and ZHIDDEN=0
 and d in ('2015-02-22','2015-02-28','2015-03-10','2015-03-11') order by ZDATECREATED""").fetchall()
print("frames:",len(rows))
def deriv(u):
    for p in (f"{LIB}/resources/derivatives/masters/{u[0]}/{u}_4_5005_c.jpeg",
              f"{LIB}/resources/derivatives/{u[0]}/{u}_1_105_c.jpeg"):
        if os.path.exists(p): return p
items=[]
for u,fn,d in rows:
    p=deriv(u)
    if p: items.append({"uuid":u,"file":fn,"date":d,"deriv":p})
for i,it in enumerate(items): it["idx"]=i+1
print("with derivatives:",len(items))
COLS,ROWS=4,6;CW,CH=500,375;PER=24;PAD=6;LBL=22
try: font=ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf",18)
except: font=ImageFont.load_default()
n=0
for s in range(0,len(items),PER):
    ch=items[s:s+PER];n+=1
    W=COLS*(CW+PAD)+PAD;H=ROWS*(CH+LBL+PAD)+PAD+30
    sh=Image.new("RGB",(W,H),(24,24,26));dr=ImageDraw.Draw(sh)
    dr.text((PAD,8),f"FEB-MAR 2015 sheet {n}  F{ch[0]['idx']}-F{ch[-1]['idx']}  {ch[0]['date']} to {ch[-1]['date']}",fill=(235,235,235),font=font)
    for k,it in enumerate(ch):
        r_,cc=divmod(k,COLS);x=PAD+cc*(CW+PAD);y=30+PAD+r_*(CH+LBL+PAD)
        try:
            im=Image.open(it["deriv"]).convert("RGB");im.thumbnail((CW,CH),Image.LANCZOS)
            sh.paste(im,(x+(CW-im.width)//2,y+(CH-im.height)//2))
        except: dr.text((x+10,y+10),"ERR",fill=(255,80,80),font=font)
        dr.text((x+2,y+CH+2),f"F{it['idx']}  {it['date']}",fill=(190,190,195),font=font)
    sh.save(os.path.expanduser(f"~/mnt/Pictures/_IA_review/feb2015/f15_{n:03d}.jpg"),quality=82)
json.dump(items,open(os.path.expanduser("~/mnt/Pictures/_IA_review/feb2015/index.json"),"w"),indent=0)
print("sheets:",n)
