import json,os,datetime,sys
from PIL import Image,ImageDraw,ImageFont
P,pref=sys.argv[1],sys.argv[2]
X=json.load(open(P))
L=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/resources/derivatives")
font=ImageFont.truetype("/System/Library/Fonts/Menlo.ttc",13) if os.path.exists("/System/Library/Fonts/Menlo.ttc") else ImageFont.load_default()
O=os.path.expanduser("~/mnt/Pictures/_IA_review/"+pref); os.makedirs(O,exist_ok=True)
C,R,W,H=8,6,240,200; miss=0
for s in range(0,len(X),48):
    im=Image.new("RGB",(C*W,R*H),"black"); dr=ImageDraw.Draw(im)
    for i,x in enumerate(X[s:s+48]):
        u=x['u']; cx,cy=(i%C)*W,(i//C)*H
        p=None
        for q in (f"{L}/masters/{u[0]}/{u}_4_5005_c.jpeg",f"{L}/{u[0]}/{u}_1_105_c.jpeg"):
            if os.path.exists(q): p=q;break
        if p:
            t=Image.open(p); t.draft('RGB',(W,H)); t.thumbnail((W-4,H-18)); im.paste(t,(cx+2,cy+2))
        else: miss+=1; dr.text((cx+8,cy+50),"no preview",fill="red",font=font)
        dr.text((cx+3,cy+H-15),"%s %s x%d %s"%(x['id'][1:],datetime.datetime.utcfromtimestamp(x['t']).strftime("%y%m"),x.get('n',1),x.get('loc','')[:11]),fill="yellow",font=font)
    im.save(os.path.join(O,"%s_%03d.jpg"%(pref,s//48)),quality=74)
print(len(X),"frames",(len(X)+47)//48,"sheets, missing previews",miss)
