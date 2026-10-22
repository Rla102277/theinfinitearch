import sqlite3,bisect,collections,datetime,json
o=sqlite3.connect("ia_index.sqlite")
mine=('X-T5','X-T2','X-Pro3','X-E2','X-E4','X-E5','X100V','X100VI','GFX100RF','GFX100S II','GFX 50R','X-T100','X-M1','LEICA Q3 43','ILCE-6000','NEX-5','NEX-5N','NEX-5R','NEX-5T','DSC-WX9','E-510','E-M10 Mark III','E-M10MarkII','NIKON D3400')
ts=lambda s:datetime.datetime.fromisoformat(s).timestamp()
A=[]  # anchors: GPS-bearing non-E-510 frames with Place keyword
for d,kw,md,la in o.execute("select date_utc,keywords,model,lat from assets where trashed=0 and lat is not null and model<>'E-510' and keywords like '%Place:%'"):
    pl=[k for k in kw.split('|') if k.startswith('Place:') and 'NO LOCATION' not in k]
    lc=[k for k in kw.split('|') if k.startswith('Loc:')]
    if pl: A.append((ts(d),pl[0],lc[0] if lc else ''))
A.sort(); T=[a[0] for a in A]
q=o.execute(f"select uuid,date_utc,model,keywords from assets where model in ({','.join('?'*len(mine))}) and trashed=0 and kind=0",mine).fetchall()
P=[];stat=collections.Counter()
for u,d,md,kw in q:
    has=any(k.startswith('Place:') and 'NO LOCATION' not in k for k in (kw or '').split('|'))
    if has: stat['already']+=1; continue
    t=ts(d); i=bisect.bisect_left(T,t-3*3600); j=bisect.bisect_right(T,t+3*3600)
    near=A[i:j]
    if not near: stat['no anchor']+=1; continue
    places=collections.Counter(a[1] for a in near)
    if len(places)==1:
        locs=collections.Counter(a[2] for a in near if a[2])
        P.append((u,near[0][1],locs.most_common(1)[0][0] if locs and len(locs)==1 else '',len(near))); stat['agree']+=1
    else: stat['conflict']+=1
json.dump(P,open("place_proposals.json","w"))
print(stat); print(collections.Counter(p[1] for p in P).most_common(15))
