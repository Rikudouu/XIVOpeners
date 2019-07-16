#XIVOpeners
This is a WIP addon that will do your opener and handle control back to the main bot, be it ACR or SkillManager.

**Currently, it is in early alpha, and it can stop working mid opener and ruin your parse.** The goal is to have it fully working when savage drops.

###Custom Openers
If you want to make your own opener, **you need to have basic knowledge of lua**. I have provided and commented 2 polar examples, and it should be easy enough to copy from them.

MCH is a fairly straight-forward example. It has a set, linear rotation with no conditionals, and _no ability gets executed multiple times in a row_. The logic is fairly clear cut, you insert your opener and select it, and it should work. It's important that there's no repeated consecutive casts, because other wise the cast detection will fail and count it all as one cast.

On the other hand, BRD, although the job may be simple, the opener is fairly complicated. There are _consecutive repeated abilities_ which require custom cast detection to handle as well as multiple conditions in every step of the opener.

The addon can handle both of these extremes completely fine. The function used in the BRD opener to detect repeated consecutive casts works reliably, however it is recommended to avoid using that function for anything other than the specific casts you need it for. It relies on detecting changing animations, which is problematic if you want to weave in OGCDs. 

Feel free to combine different aspects of both files for your openers. For example, if you have repeated consecutive casts but your opener doesn't require any logic in between, you can use the `useNextAction()` function from the MCH file, and use the `updateActionUsed()` function from the BRD file to only check for duplicates. If you do this, be sure to look in the BRD's `main()` as there is an extra conditional that needs to be added. 