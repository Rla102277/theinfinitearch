import sqlite3,urllib.parse,os,json
from PIL import Image, ImageDraw, ImageFont
LIB=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary")
c=sqlite3.connect("file:"+urllib.parse.quote(LIB+"/database/Photos.sqlite")+"?mode=ro",uri=True)
rows=c.execute("""select a.ZUUID,a.ZFILENAME,strftime('%Y-%m-%d',a.ZDATECREATED+978307200,'unixepoch') d,
 a.ZFAVORITE, a.ZDATECREATED
 from Z_34ASSETS j join ZASSET a on a.Z_PK=j.Z_3ASSETS
 where j.Z_34ALBUMS=2908 and a.ZKIND=0 and a.ZTRASHEDSTATE=0 and a.ZHIDDEN=0
 order by a.ZDATECREATED""").fetchall()
print("photos:",len(rows))
def deriv(u):
    for pth in (f"{LIB}/resources/derivatives/masters/{u[0]}/{u}_4_5005_c.jpeg",
                f"{LIB}/resources/derivatives/{u[0]}/{u}_1_105_c.jpeg"):
        if os.path.exists(pth): return pth
    return None
items=[]
for u,fn,d,fav,_ in rows:
    p=deriv(u)
    if p: items.append({"uuid":u,"file":fn,"date":d,"fav":bool(fav),"deriv":p})
print("with derivatives:",len(items))
COLS,ROWS=4,6; CW,CH=500,375; PER=COLS*ROWS; PAD=6; LBL=22
try: font=ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf",18)
except: font=ImageFont.load_default()
for i,it in enumerate(items): it["idx"]=i+1
nsheet=0
for s in range(0,len(items),PER):
    chunk=items[s:s+PER]; nsheet+=1
    W=COLS*(CW+PAD)+PAD; H=ROWS*(CH+LBL+PAD)+PAD+30
    sheet=Image.new("RGB",(W,H),(24,24,26)); dr=ImageDraw.Draw(sheet)
    dr.text((PAD,8),f"NOLA sheet {nsheet}  —  frames {chunk[0]['idx']}-{chunk[-1]['idx']}  —  {chunk[0]['date']} to {chunk[-1]['date']}",fill=(235,235,235),font=font)
    for k,it in enumerate(chunk):
        r,cc=divmod(k,COLS)
        x=PAD+cc*(CW+PAD); y=30+PAD+r*(CH+LBL+PAD)
        try:
            im=Image.open(it["deriv"]).convert("RGB"); im.thumbnail((CW,CH),Image.LANCZOS)
            sheet.paste(im,(x+(CW-im.width)//2,y+(CH-im.height)//2))
        except Exception as e:
            dr.text((x+10,y+10),"ERR",fill=(255,80,80),font=font)
        tag=f"{it['idx']}  {it['date']}"+("  ★" if it["fav"] else "")
        dr.text((x+2,y+CH+2),tag,fill=(190,190,195),font=font)
    sheet.save(f"sheets/nola_{nsheet:03d}.jpg",quality=82)
json.dump(items,open("index.json","w"),indent=0)
print("sheets:",nsheet)
