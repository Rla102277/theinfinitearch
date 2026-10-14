import os,json,sys,re
from PIL import Image,ImageDraw,ImageFont
LIB=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary")
OUT=os.path.expanduser("~/mnt/Pictures/_IA_review/gaps")
C=json.load(open("candidates.json"))
bucket=sys.argv[1]; slug=re.sub(r'[^a-z0-9]+','_',bucket.lower()).strip('_')
rows=C[bucket]
def deriv(u):
    for p in (f"{LIB}/resources/derivatives/masters/{u[0]}/{u}_4_5005_c.jpeg",
              f"{LIB}/resources/derivatives/{u[0]}/{u}_1_105_c.jpeg"): 
        if os.path.exists(p): return p
items=[]
for u,fn,d in rows:
    p=deriv(u)
    if p: items.append({"uuid":u,"file":fn,"date":d,"deriv":p})
for i,it in enumerate(items): it["idx"]=i+1
COLS,ROWS,CW,CH,PER,PAD,LBL=6,8,260,195,48,4,16
try: font=ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf",13)
except: font=ImageFont.load_default()
try: hf=ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf",17)
except: hf=font
os.makedirs(f"{OUT}/{slug}",exist_ok=True)
n=0
for s in range(0,len(items),PER):
    ch=items[s:s+PER];n+=1
    W=COLS*(CW+PAD)+PAD;H=ROWS*(CH+LBL+PAD)+PAD+26
    sh=Image.new("RGB",(W,H),(22,22,24));dr=ImageDraw.Draw(sh)
    dr.text((PAD,6),f"{bucket}  sheet {n}   F{ch[0]['idx']}-F{ch[-1]['idx']}   {ch[0]['date']} .. {ch[-1]['date']}",fill=(240,240,240),font=hf)
    for k,it in enumerate(ch):
        r_,cc=divmod(k,COLS);x=PAD+cc*(CW+PAD);y=26+PAD+r_*(CH+LBL+PAD)
        try:
            im=Image.open(it["deriv"]).convert("RGB");im.thumbnail((CW,CH),Image.LANCZOS)
            sh.paste(im,(x+(CW-im.width)//2,y+(CH-im.height)//2))
        except: dr.text((x+8,y+8),"ERR",fill=(255,80,80),font=font)
        dr.text((x+1,y+CH+1),f"F{it['idx']} {it['date'][2:]}",fill=(185,185,190),font=font)
    sh.save(f"{OUT}/{slug}/{slug}_{n:03d}.jpg",quality=80)
json.dump(items,open(f"{OUT}/{slug}/index.json","w"),indent=0)
print(f"{bucket}: {len(items)} frames with derivatives, {n} sheets -> {OUT}/{slug}/")
