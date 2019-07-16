# XIVOpeners
This is a WIP addon that will do your opener and handle control back to the main bot, be it ACR or SkillManager.

**Currently, it is in early alpha, and it can stop working mid opener and ruin your parse.** The goal is to have it fully working when Eden savage drops.

### Status


### Custom Openers
If you want to make your own opener, **you need to have basic knowledge of lua**. I have provided and commented 2 polar examples, and it should be easy enough to copy from them.

MCH is a fairly straight-forward example. It has a set, linear rotation with no conditionals, and _no ability gets executed multiple times in a row_. The logic is fairly clear cut, you insert your opener and select it, and it should work. It's important that there's no repeated consecutive casts, because other wise the cast detection will fail and count it all as one cast.

On the other hand, BRD, although the job may be simple, the opener is fairly complicated. There are _consecutive repeated abilities_ which require custom cast detection to handle as well as multiple conditions in every step of the opener.

The addon can handle both of these extremes completely fine. The function used in the BRD opener to detect repeated consecutive casts works reliably, however it is recommended to avoid using that function for anything other than the specific casts you need it for. It relies on detecting changing animations, which is problematic if you want to weave in OGCDs. 

Feel free to combine different aspects of both files for your openers.

### Development 
Extremely high IQ readers may have noticed, but repeated consecutive casts are quite an important problem to deal with. So how exactly do we deal with them? In the ``BRD.lua`` file, there are a few things we can copy.
1. Copy ``xivopeners_brd.updateActionUsed()``
2. Copy ``xivopeners_brd.dequeue()``
3. In your ``main()``, add the following extra conditional
```
elseif(xivopeners_brd.abilityQueue[1] == xivopeners_brd.abilityQueue[2]) then
   if (xivopeners_brd.lastCastFromQueue.casted) then -- we use casted here, which is updated from the updateActionUsed call above to detect if the cast went off
       xivopeners_brd.dequeue()
   end
   
   xivopeners_brd.useNextAction(target) -- we still want to call this every pulse to weave in ogcds and use any procs we might get
elseif (...)
```
There's some additional conditionals added to bard, such as ``xivopeners_brd.lastCastFromQueue.id ~= -1``, that aren't part of the consecutive cast detection logic
