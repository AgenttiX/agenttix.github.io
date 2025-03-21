---
layout: default
title: Video games
---

# Video games

## [Bitburner](https://store.steampowered.com/app/1812820/Bitburner/)


## [Empire Earth II](https://en.wikipedia.org/wiki/Empire_Earth_II)


## [Factorio](https://www.factorio.com/)


## [Ingress](https://ingress.com/)



## [Kerbal Space Program](https://www.kerbalspaceprogram.com/)


## [Mass Effect](https://store.steampowered.com/app/1328670/Mass_Effect_Legendary_Edition/)
Mass effect is a deep and rich universe.
It tackles some philosophical themes at a level that even Star Trek has been reluctant to grasp.

- [Fan-made trailer](https://www.youtube.com/watch?v=wvqYN2RJfVA)
- [Description on the underlying themes](https://gizmodo.com/why-mass-effect-is-the-most-important-science-fiction-u-5886178)


## [Minecraft](https://www.minecraft.net/)
[Feed the Beast](https://www.feed-the-beast.com/) App (FTBA)
is among the easiest ways to install modpacks.
[On Linux installing the launcher requires Java 17](https://github.com/FTBTeam/FTB-App/issues/536),
so please install it first using the instructions below.

For instructions on setting up a server, please see my
[Minecraft server GitHub repository](https://github.com/AgenttiX/minecraft-server).

### Rules for my server
Enjoy the game and let others do the same.
However, if you want to be specific, this includes:
- Respect other players and their property
  - No PvP except between players that have agreed to it
  - No griefing
  - No stealing
- Keep the spawn area clean.
  - Discuss with the admins before building a base near the spawn
  - No large quarries < 2000 blocks from the spawn
- No political symbols or offensive art visible from the spawn or on the map

### Installing Java on Ubuntu
Minecraft 1.16 and later are based on Java 16,
so I recommend installing the latest Java from the
[Linux Uprising PPA](https://launchpad.net/~linuxuprising/+archive/ubuntu/java).

Older versions of Minecraft are based on Java 8,
and various mods are not compatible with later versions.
For those,
[download the latest Java 8 from Oracle](https://www.java.com/en/download/).
Then unpack the files to the folder where FTBA can find them.
``` bash
sudo tar -xf jre-8uVERSION-linux-x64.tar.gz -C /usr/lib/jvm
```
No configuration with `update-alternatives` is necessary.
Open FTBA and go to Library -> your modpack -> Settings -> Java version
and select the Java 8 you just installed.
You should increase the instance memory to at least 4 GB, preferably more.

### Using a discrete Nvidia GPU on a Linux laptop
Run the FTB App with these environment variables:
``` bash
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia ~/FTBA/FTBApp
```
You can use the command `nvidia-smi` to check that Minecraft is indeed using the discrete GPU.

### Mods
- [Applied Energistics 2](https://appliedenergistics.github.io/)
- [Mekanism](https://wiki.aidancbrady.com/)

#### [Rubidium](https://www.curseforge.com/minecraft/mc-mods/rubidium)
Rubidium can double your FPS, and it works with FTB modpacks.
Just copy it to the mods folder of your client.

#### [Oculus](https://www.curseforge.com/minecraft/mc-mods/oculus)
Shader mod.

#### OptiFine
[OptiFine](https://www.optifine.net/)
is highly recommended for improving the graphics.
Unfortunately it's not bundled in modpacks by default due to its restrictive licensing
and incompatibilities with various mods.

You can try installing OptiFine to a FTB modpack.
First download the OptiFine version appropriate for your Minecraft version.
Then open FTBA and go to
Library -> your modpack -> "three dots" -> Open... -> Mods folder.
Copy-paste the OptiFine jar there, and try starting Minecraft.
If it doesn't work, just remove the OptiFine jar from the mods folder.

[FTB Beyond works only with some OptiFine versions](https://www.reddit.com/r/feedthebeast/comments/62vfps/ftb_beyond_and_optifine/).
According to my testing version D7 is compatible, and versions D6 and I5 are incompatible.

Good shaders
- [SEUS](https://www.sonicether.com/seus/)
- [Sildur's Shaders](https://sildurs-shaders.github.io/)


## [Quantum Break](https://en.wikipedia.org/wiki/Quantum_Break)
[Steam](https://store.steampowered.com/app/474960/Quantum_Break/)

If you have a CPU with many threads such as an AMD threadripper,
the game may crash at launch with the following error.
```
R_ASSERT( Havok Error (id 0xf03454fe)
Memory\System\FreeList\hkFreeListMemorySystem.cpp (100): Too many threads
)
File: Memory\System\FreeList\hkFreeListMemorySystem.cpp
Line: 100

Reason: Too many threads
```
When running the game with Proton, you can fix this with the launch option:
```
WINE_CPU_TOPOLOGY=31:0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30 %command%
```


## [Supreme Commander](https://store.steampowered.com/sub/11732/)
- [Forged Alliance Forever](https://www.faforever.com/)
- [Linux instructions](https://github.com/FAForever/faf-linux)

## [Zero-K](https://zero-k.info/)
