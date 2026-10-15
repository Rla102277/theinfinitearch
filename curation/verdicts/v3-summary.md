# v3 location rebuild (15 Oct 2026)

Method: strip every `Loc:`. Re-place every frame from Apple's own reverse-geocode on GPS frames
(E-510 coordinates discarded), nearest anchor in time within 36 h inside the same day-cluster.
Every cluster with no anchor (243) and every home-anchored cluster with 8+ real-camera frames (60)
was rendered as a sheet and read by eye: 229 sheets, verdicts in `v3-cluster-verdicts.tsv`.

## Result
- 64,389 live frames. 62,401 placed, 1,988 in NO LOCATION AVAILABLE.
- 340 `Loc:` values (city level), 41 `Place:` regions (state or country). Home (DFW) 32,847.
- Wyoming is real this time: 26 iPhone frames, Casper and Cheyenne, Nov 2015 and Jan 2016.

## Trips recovered that no metadata pass could see
Boston Jul 2006 (199) and Mar 2010; San Diego Jan 2005; New York Apr 2007 (236, the one inside
"Disney World"); SeaWorld Orlando Aug 2007; Atlanta Oct 2007 (341); Riviera Maya Sep 2007; Napa Nov 2007;
Corpus Christi Jan 2008; Santa Monica + Anaheim Aug 2008 (878); Philadelphia Nov 2008; NOLA Aug 2009;
Chicago + Seattle 2010; Niagara Falls Nov 2010; Costa Rica Dec 2011 (278, hidden under one home iPhone
frame); New Braunfels + Galveston 2013; Amarillo/Palo Duro + Colorado Springs Jul 2014 (656);
the Feb-2015 New Orleans cemetery day (St. Louis No. 1); Scarborough Faire 2015.

## Open: Randy names these and they move out of NO LOCATION
- c128 Jul 22-26 2009: drive east across the Mississippi at Vicksburg to a family wedding. Where?
- c173 Nov 2010: stingray touch pool, garden with seahorse columns.
- c504 Mar 2023: flooded river bottom, spillway (B&W).
- c508 Apr 2023: pumpjacks on a reservoir shore, pelicans.
- c075 Dec 2007 Kodak: horse barn, clear spring.
- Date dumps with no derivatives: c417 (143), c440 (351, includes NOLA), c095, c422 dump.

## Clock faults found
- GFX50R: all 31 frames are dated Mar-May 2018, before the camera shipped (Nov 2018). The clock was never set. 14 are Ennis Apr 2026; the other 17 (dog on bed, desk) are home with unknown real dates.
- KODAK V1253 is a year early through mid-2007 (toddler in "Jan 2007" swimsuit frames).
- NEX-5N frames dated before Aug 2011 are impossible; c176/c177 are really late 2011/early 2012.

## Work candidates spotted while placing (not graded)
c480 pecan orchard corridors; c504 drowned trees; c511 collapsed barn B&W; c531 dead tree in water;
c281 Palo Duro / Pikes Peak B&W; c296 St. Louis No. 1; c072 Napa vines in fog.

## Named by Randy (15 Oct 2026)
- c480 May 21 2022 pecan orchard = Brinkman Ranch, Eldorado and Coit, Frisco, before construction (29 frames, Home). The orchard is gone now, which makes these frames a record of a vanished place.
- c368 + c570 = Ennis, TX (81 frames). The "May 2018" frames are GFX50R with a bad clock; they belong to the April 2026 Ennis shoot. My first read (same place) was right.
- Fishing near May 2022: only Bayfield, CO on Jun 6 (already GPS-placed). No Brinkman fishing frames found by the search index.
