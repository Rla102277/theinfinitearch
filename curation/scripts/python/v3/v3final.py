import json,collections,datetime
d=json.load(open("v3place.json")); F={x['u']:x for x in d['frames']}
CL={c['id']:c for c in d['clusters']}
US={'AL':'Alabama','AK':'Alaska','AZ':'Arizona','AR':'Arkansas','CA':'California','CO':'Colorado','CT':'Connecticut','DE':'Delaware','DC':'Washington DC','FL':'Florida','GA':'Georgia','HI':'Hawaii','ID':'Idaho','IL':'Illinois','IN':'Indiana','IA':'Iowa','KS':'Kansas','KY':'Kentucky','LA':'Louisiana','ME':'Maine','MD':'Maryland','MA':'Massachusetts','MI':'Michigan','MN':'Minnesota','MS':'Mississippi','MO':'Missouri','MT':'Montana','NE':'Nebraska','NV':'Nevada','NH':'New Hampshire','NJ':'New Jersey','NM':'New Mexico','NY':'New York','NC':'North Carolina','ND':'North Dakota','OH':'Ohio','OK':'Oklahoma','OR':'Oregon','PA':'Pennsylvania','RI':'Rhode Island','SC':'South Carolina','SD':'South Dakota','TN':'Tennessee','TX':'Texas','UT':'Utah','VT':'Vermont','VA':'Virginia','WA':'Washington','WV':'West Virginia','WI':'Wisconsin','WY':'Wyoming'}
def clean(l):
    if not l: return l
    l=l.replace('$null, ','').replace(', $null','')
    return l
def region(l):
    if l is None: return None
    if l=='Home (DFW)' or l.endswith('Frisco, TX'): return 'Home (DFW)'
    p=[s.strip() for s in l.split(',')]
    last=p[-1]
    if last in US: return US[last]
    if len(last)==2 and last.isupper(): return last
    return last
NOLOC=None
H='Home (DFW)'
def rng(a,b): return lambda x: a<=x['d']<=b
def cam(s): return lambda x: s in x['cam']
def AND(*f): return lambda x: all(g(x) for g in f)
# rules: cluster -> list of (predicate, loc); first match wins; default
R={
 'c000':[(None,NOLOC)],
 'c005':[(None,'Glen Rose, TX')],'c006':[(None,'San Diego, CA')],
 'c023':[(cam('EOS 20D'),'Crested Butte, CO'),(None,H)],'c024':[(cam('EOS 20D'),'Crested Butte, CO'),(None,H)],
 'c025':[(None,'Boston, MA')],
 'c041':[(AND(cam('V1253'),rng('2007-01-07','2007-01-10')),'Galveston, TX'),(None,H)],
 'c043':[(cam('V1253'),'Galveston, TX'),(None,H)],
 'c046':[(AND(cam('SD600'),rng('2007-03-07','2007-03-09')),'San Francisco, CA'),(None,H)],
 'c052':[(None,'New York, NY')],'c063':[(None,'Orlando, FL')],
 'c065':[(rng('2007-08-31','2007-09-04'),'Riviera Maya, Mexico'),(None,H)],
 'c067':[(None,'Atlanta, GA')],'c072':[(None,'Napa, CA')],
 'c075':[(AND(cam('V1253'),rng('2007-12-07','2007-12-09')),NOLOC),(None,H)],
 'c077':[(None,'Glen Rose, TX')],'c079':[(None,'Corpus Christi, TX')],
 'c088':[(rng('2008-04-19','2008-04-19'),NOLOC),(None,H)],
 'c091':[(rng('2008-05-24','2008-05-26'),'Galveston, TX'),(None,H)],
 'c095':[(None,NOLOC)],
 'c098':[(rng('2008-08-14','2008-08-15'),'Santa Monica, CA'),(None,'Anaheim, CA')],
 'c105':[(None,'Philadelphia, PA')],
 'c128':[(rng('2009-07-22','2009-07-27'),NOLOC),(None,H)],
 'c129':[(rng('2009-08-03','2009-08-06'),'New Orleans, LA'),(None,H)],
 'c150':[(rng('2010-03-26','2010-03-28'),'Boston, MA'),(None,H)],
 'c164':[(AND(cam('SD880'),rng('2010-08-18','2010-08-21')),'Chicago, IL'),(rng('2010-09-02','2010-09-06'),'Seattle, WA'),(None,H)],
 'c171':[(None,'Niagara Falls, NY')],'c173':[(None,NOLOC)],
 'c209':[(rng('2011-12-14','2011-12-18'),'Tamarindo, Costa Rica'),(None,H)],
 'c247':[(rng('2013-07-05','2013-07-06'),'New Braunfels, TX'),(None,H)],
 'c249':[(rng('2013-07-25','2013-07-28'),'Galveston, TX'),(None,H)],
 'c265':[(lambda x: x['cam']=='?' and x['d']=='2014-02-06',NOLOC),(None,H)],
 'c281':[(rng('2014-07-12','2014-07-12'),'Amarillo, TX'),(None,'Colorado Springs, CO')],
 'c296':[(rng('2015-02-27','2015-02-28'),'New Orleans, LA'),(None,H)],
 'c301':[(None,'Waxahachie, TX')],
 'c366':[(lambda x: x['cam']=='?' and x['d']=='2018-03-22',NOLOC),(None,H)],
 'c368':[(rng('2018-05-08','2018-05-08'),'Ennis, TX'),(None,H)],
 'c417':[(None,NOLOC)],
 'c422':[(rng('2019-12-29','2019-12-29'),NOLOC),(None,H)],
 'c440':[(None,NOLOC)],
 'c480':[(rng('2022-05-21','2022-05-21'),'Brinkman Ranch, Frisco, TX'),(None,H)],
 'c504':[(None,NOLOC)],
 'c508':[(rng('2023-04-08','2023-04-08'),NOLOC),(None,H)],
 'c563':[(rng('2025-11-23','2025-11-23'),NOLOC),(None,H)],
 'c570':[(rng('2026-04-05','2026-04-05'),'Ennis, TX'),(None,H)],
}
verified={l.split('\t')[0][:4] for l in open('verdicts.tsv') if l[:1]=='c'}
out={};how=collections.Counter()
for cid,c in CL.items():
    k=cid[:4]
    for u in c['uuids']:
        x=F[u]
        if k in R:
            for p,l in R[k]:
                if p is None or p(x): loc=l;break
            how['verdict']+=1
        elif k in verified:
            loc=H if x['loc'] in (None,H) else x['loc']; how['verified-home']+=1
            if x['loc'] is None: loc=H
        else:
            loc=x['loc']; how['gps' if x['loc'] else 'unseen-blind']+=1
        out[u]=clean(loc)
locs=collections.Counter(v for v in out.values())
reg=collections.Counter(region(v) for v in out.values())
print(dict(how))
print("NO LOCATION:",locs[None])
print(len(locs)-1,"Loc values,",len(reg)-1,"regions")
for k,v in reg.most_common(60): print("  %6d  %s"%(v,k))
json.dump({u:{'loc':l,'region':region(l)} for u,l in out.items()},open("v3final.json","w"))
