# XIVOpeners
This is a WIP addon that will do your opener and handle control back to the main bot, be it ACR or SkillManager.

**Currently, it is in early alpha, and it can stop working mid opener and ruin your parse.** The goal is to have it fully working when Eden savage drops.

## Status
|     **Job**     |   **Status**  |
|:---------------:|:-------------:|
|       BRD       |     Fully Working     |
|       MCH       |     Fully Working     |
|       MNK       |     Mostly Working     |
|       SMN       |     Mostly Working     |
| Everything Else | Not Implemented |

**Alpha**: Implemented and tested against a dummy, but not in an actual raid environment

**Fully Working**: Tested in an actual raid environment

**Mostly Working**: There might be a few edge cases here and there but it shouldn't affect your parse or it has a very minimal impact

**Not Working**: Has been implemented but might not be fully working yet

**Not Implemented**: Hasn't been added to the addon yet

## Installation
Just drag and drop the XIVOpeners folder into ``MINIONAPP\Bots\FFXIVMinion64\LuaMods``, so there should be a new folder called XIVOpeners. After that, reload LUA or restart your game.

## Custom Openers
If you want to make your own opener, **you need to have basic knowledge of lua**. I have provided and commented 2 polar examples, and it should be easy enough to copy from them.

MCH is a fairly straight-forward example. It has a set, linear rotation with no conditionals, and _no ability gets executed multiple times in a row_. The logic is fairly clear cut, you insert your opener and select it, and it should work. It's important that there's no repeated consecutive casts, because other wise the cast detection will fail and count it all as one cast.

On the other hand, BRD, although the job may be simple, the opener is fairly complicated. There are _consecutive repeated abilities_ which require custom cast detection to handle as well as multiple conditions in every step of the opener.
The addon can handle both of these extremes completely fine. The function used in the BRD opener to detect repeated consecutive casts works reliably.

Feel free to combine different aspects of both files for your openers.

## Development 
Extremely high IQ readers may have noticed, but repeated consecutive casts are quite an important problem to deal with. So how exactly do we deal with them? In the ``BRD.lua`` file, there are a few things we can copy.

I would recommend looking through the BRD.lua file for handling complicated openers like Bards. Some notable areas that are worth looking into:
1. `` xivopeners_brd.updateLastCast()``
2. ``xivopeners_brd.useNextAction(target)``
3. Check how ``xivopeners_brd.main(event, tickcount)`` handles a custom lastcastid and the additional RA procs it has to deal with
