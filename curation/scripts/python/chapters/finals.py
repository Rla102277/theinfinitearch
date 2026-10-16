import sqlite3,urllib.parse,os,re,json,collections,datetime
from PIL import Image,ImageStat
B=os.path.expanduser("~/mnt/Pictures/Photos Library.photoslibrary/")
c=sqlite3.connect("file:"+urllib.parse.quote(B+"database/Photos.sqlite")+"?mode=ro",uri=True,timeout=5)
rows=c.execute("""select a.ZUUID,b.ZORIGINALFILENAME,ifnull(b.ZTITLE,''),a.ZWIDTH,a.ZHEIGHT,a.ZDATECREATED,e.ZCAMERAMODEL,a.ZADDEDDATE
 from Z_33ASSETS z join ZASSET a on a.Z_PK=z.Z_3ASSETS join ZADDITIONALASSETATTRIBUTES b on b.ZASSET=a.Z_PK left join ZEXTENDEDATTRIBUTES e on e.ZASSET=a.Z_PK
 where z.Z_33ALBUMS=3827 and a.ZTRASHEDSTATE=0""").fetchall()
cam=re.compile(r'^(DSCF|_DSF|DSC|IMG|GFRF|GFXS|XT\d|P\d|PICT|L\d{3}|_?MG|E\d)',re.I)
def border(u):
    p=os.path.join(B,"resources/derivatives/masters",u[0],u+"_4_5005_c.jpeg")
    if not os.path.exists(p): return None
    im=Image.open(p).convert("L"); w,h=im.size; k=max(2,int(min(w,h)*0.012))
    strips=[im.crop((0,0,w,k)),im.crop((0,h-k,w,h)),im.crop((0,0,k,h)),im.crop((w-k,0,w,h))]
    st=[ImageStat.Stat(s) for s in strips]
    return min(s.mean[0] for s in st)>235 and max(s.stddev[0] for s in st)<12
out=[]
for u,fn,ti,w,h,dc,cm,ad in rows:
    stem=os.path.splitext(fn or '')[0]
    named=bool(ti.strip()) or (not cam.match(stem) and not re.fullmatch(r'[\d_\-A-F]+',stem,re.I))
    out.append(dict(u=u,fn=fn,title=ti,named=named,border=border(u),w=w,h=h,cam=cm or '?',d=datetime.datetime.utcfromtimestamp(dc+978307200).strftime("%Y-%m-%d") if dc else '?'))
json.dump(out,open("finals.json","w"))
C=collections.Counter((x['named'],x['border']) for x in out); print(C)
print("READY:",sum(x['named'] and x['border'] for x in out))
for x in [x for x in out if x['named']][:40]: print(x['border'],x['fn'],'|',x['title'])
