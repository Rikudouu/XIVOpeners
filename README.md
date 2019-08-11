# XIVOpeners
This is a WIP addon that will do your opener and handle control back to the main bot, be it ACR or SkillManager.

**Currently, it is in early alpha, and it can stop working mid opener and ruin your parse.** I have been using it throughout Eden 1-4 savage, and have had absolutely zero issues with it stalling. If it's stalling for you, it's highly likely that it's not the addon, and other foreign forces are the cause.

## Status
|     **Job**     |    **Status**   |
|:---------------:|:---------------:|
|       BRD       |  Fully Working  |
|       MCH       |  Fully Working  |
|       MNK       |  Fully Working  |
|       SMN       |  Fully Working  |
|       SAM       |  Fully Working  |
|       SCH       |  Fully Working  |
|       NIN       |  Fully Working  |
|       DRG       |  Fully Working  |
|       PLD       |  Fully Working  |
|       GNB       |  Fully Working  |
|       BLM       |      Alpha      |
|       DNC       |      Alpha      |
|       WAR       |      Alpha      |
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
### Opener Logic
Extremely high IQ readers may have noticed, but repeated consecutive casts are quite an important problem to deal with. So how exactly do we deal with them? In the ``BRD.lua`` file, there are a few things we can copy.

I would recommend looking through the BRD.lua file for handling complicated openers like Bards. Some notable areas that are worth looking into:
1. `` xivopeners_brd.updateLastCast()``
2. ``xivopeners_brd.useNextAction(target)``
3. Check how ``xivopeners_brd.main(event, tickcount)`` handles a custom lastcastid and the additional RA procs it has to deal with

For melee jobs, I recommend taking a look at the ``MNK.lua`` file, in which you'll find ``xivopeners_mnk.drawPosWindow(event, tickcount)`` and several other constructs that assist with positional window handling. Additionally, the ``SAM.lua`` file does not contain any position handling code. This is because the ACR provided by Ace already handles the logic for the positional window independently. However, should you choose to use this SAM opener without the ACR, you are free to add your own postional code by copying ``MNK.lua``.

### Adding a custom opener
Replace ``JOB`` with the name of the job you're adding.

Once you've made your ``JOB.lua`` file, make sure it's in ``XIVOpeners/Jobs`` Folder. You should see all the other jobs listed there as well. Finally, inside ``XIVOpeners.lua``, append your job to the ``xivopeners.supportedJobs`` table, following the format of the other jobs.

## Afterword
This addon was never intended for consumption by the general public. It's primary intention was to make modifiable openers for me, and any other LUA dev that would want to modify the addon to their needs. A lot of the "user friendliness" is not in the UI, but in the code. The addon was written and designed to be modular and support any custom logic you might want. It was **not** designed to be user-friendly to the average user that we often encounter in the botting community.

The only reason the addon got released to public is because the ACR dev team had not implemented openers, and it appeared that they did not intend to finish openers by the start of the Savage raid tier. This proposed a problem for me, and I created this addon as an interim solution. Once the official openers are out, I highly recommend everyone except for the intended audience to switch to the official openers.

Development of this addon will still continue past the official opener's release. This addon has been extremely reliable and very modular for me, and I will continue tweaking and adding custom fight-specific openers that the official team won't have time to do. This addon's true purpose is to satisfy a niche of us lua devs that also do end-game raiding. It offers a ton of customization for us that can automate rank 1 _that_ much more.
