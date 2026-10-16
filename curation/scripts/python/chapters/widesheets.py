import json,os,datetime
from PIL import Image,ImageDraw,ImageFont
b=[x for x in json.load(open("wide_all.json")) if x['face']<0.03 and not (x['cam'].startswith('iPhone') or x['cam'].startswith('iPad'))]
b.sort(key=lambda x:x['t'])
for i,x in enumerate(b): x['id']="X%04d"%(i+1)
json.dump(b,open("X_pick.json","w"))
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/resources/derivatives/masters")
O=os.path.expanduser("~/mnt/Pictures/_IA_review/wide"); os.makedirs(O,exist_ok=True)
font=ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",13)
C,R,W,H=8,6,240,200
for s in range(0,len(b),C*R):
    out=os.path.join(O,"x_%03d.jpg"%(s//(C*R)))
    if os.path.exists(out): continue
    im=Image.new("RGB",(C*W,R*H),"black"); dr=ImageDraw.Draw(im)
    for i,x in enumerate(b[s:s+C*R]):
        cx,cy=(i%C)*W,(i//C)*H; u=x['u']
        try: t=Image.open(os.path.join(L,u[0],u+"_4_5005_c.jpeg")); t.draft('RGB',(W,H)); t.thumbnail((W-4,H-18)); im.paste(t,(cx+2,cy+2))
        except: dr.text((cx+8,cy+50),"no preview",fill="red",font=font)
        dr.text((cx+3,cy+H-15),"%s %s %s"%(x['id'][1:],datetime.datetime.utcfromtimestamp(x['t']).strftime("%y%m"),x['loc'][:14]),fill="yellow",font=font)
    im.save(out,quality=72)
print(len(b),"frames", (len(b)+47)//48,"sheets")
