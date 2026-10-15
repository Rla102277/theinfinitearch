import json,os,datetime
from PIL import Image,ImageDraw,ImageFont
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/resources/derivatives/masters")
OUT=os.path.expanduser("~/mnt/Pictures/_IA_review/v3clusters"); os.makedirs(OUT,exist_ok=True)
d=json.load(open("v3place.json")); F={x['u']:x for x in d['frames']}
want={b['id']:'BLIND' for b in d['blind'] if b['n']>=8}; want.update({s['id']:'HOME?' for s in d['suspect']})
try: font=ImageFont.truetype("/System/Library/Fonts/Menlo.ttc",13)
except: font=ImageFont.load_default()
TW,TH,COLS,ROWS=320,260,6,5
idx=[]
for cl in d['clusters']:
    if cl['id'] not in want: continue
    us=cl['uuids']; kind=want[cl['id']]
    if kind=='HOME?': us=[u for u in us if not F[u]['cam'].startswith('iPhone') and not F[u]['anchor']] or us
    n=len(us); k=min(n,COLS*ROWS); pick=[us[int(i*n/k)] for i in range(k)]
    im=Image.new("RGB",(COLS*TW,ROWS*TH+40),"black"); dr=ImageDraw.Draw(im)
    dr.text((8,8),"%s  %s  %d frames  anchors:%s"%(cl['id'],kind,cl['n'],cl['places'][:3]),fill="yellow",font=font)
    for i,u in enumerate(pick):
        x=F[u]; path=os.path.join(L,u[0],u+"_4_5005_c.jpeg")
        cx,cy=(i%COLS)*TW,40+(i//COLS)*TH
        try:
            t=Image.open(path); t.thumbnail((TW-4,TH-22)); im.paste(t,(cx+2,cy+2))
        except Exception as e: dr.text((cx+8,cy+40),"no derivative",fill="red",font=font)
        dr.text((cx+4,cy+TH-18),"%s %s"%(datetime.datetime.utcfromtimestamp(x['t']).strftime("%m-%d %H:%M"),x['cam'].strip()[:18]),fill="white",font=font)
    im.save(os.path.join(OUT,cl['id']+".jpg"),quality=82)
    idx.append(dict(id=cl['id'],kind=kind,n=cl['n'],shown=k,anchors=cl['places'][:3]))
json.dump(idx,open(os.path.join(OUT,"index.json"),"w"),indent=1)
print(len(idx),"sheets")
