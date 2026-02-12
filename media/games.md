---
layout: default
title: Video games
---

# Video games

## LAN party games

### [Artemis](https://www.artemisspaceshipbridge.com)
Artemis is a Star Trek -like spaceship bridge simulator,
where each player has a specific role on the bridge of a spaceship.
To complete various missions, the players must work together and communicate effectively.
This makes it a great game for LAN parties.


#### Artemis Cosmos
This is an updated version of Artemis.
[Available on Steam](https://store.steampowered.com/app/2467840/Artemis_Cosmos/).


#### Artemis Spaceship Bridge Simulator
This is the older version of Artemis.
[Available on Steam](https://store.steampowered.com/app/247350/Artemis_Spaceship_Bridge_Simulator/).
Android: [Amazon Appstore](https://www.amazon.com/Incandescent-Workshop-Artemis-Spaceship-Simulator/dp/B00CPD33MC).
The Google Play version has been removed.


### [Empire Earth II](https://en.wikipedia.org/wiki/Empire_Earth_II)
Empire Earth II is a classic real-time strategy (RTS) game that is great for LAN parties.
The game starts from the stone age and progresses throughout human history
all the way to nuclear weapons, satellites and autonomous combat robots.
Available on [GOG.com](https://www.gog.com/en/game/empire_earth_2_gold).
Unofficial patch by Dr.MonaLisa is available [here](https://ee2.eu/patch/).


### [Factorio](https://www.factorio.com/)


### [OpenArena](https://www.openarena.ws/)
A free and open-source first-person shooter (FPS) game similar to
[Quake III Arena](https://en.wikipedia.org/wiki/Quake_III_Arena).
- Installation
  - Android: [Google Play](https://play.google.com/store/apps/details?id=ws.openarena.sdl)
  - Ubuntu: `sudo apt update && sudo apt install openarena`
  - Windows: download from [the official website](https://www.openarena.ws/)
- My server configs are available [on GitHub](https://github.com/AgenttiX/openarena-server)


### Minecraft
Please see the separate [Minecraft page](./minecraft).


### [Supreme Commander](https://store.steampowered.com/sub/11732/)
Supreme Commander is a classic sci-fi real-time strategy (RTS) game.
- [Forged Alliance Forever](https://www.faforever.com/)
- [Linux instructions](https://github.com/FAForever/faf-linux)


### [Zero-K](https://zero-k.info/)
Zero-K is a free and open-source real-time strategy (RTS) game similar to Supreme Commander.
[Available on Steam](https://store.steampowered.com/app/334920/ZeroK/).


## Mobile games

### [Ingress](https://ingress.com/)


### Subnautica
- [App Store](https://apps.apple.com/us/app/subnautica/id6478639011)
- [Google Play](https://play.google.com/store/apps/details?id=com.unknownworlds.subnautica)


## Other games

### [Bitburner](https://store.steampowered.com/app/1812820/Bitburner/)


### [Kerbal Space Program](https://www.kerbalspaceprogram.com/)


### [Mass Effect](https://store.steampowered.com/app/1328670/Mass_Effect_Legendary_Edition/)
Mass effect is a deep and rich universe.
It tackles some philosophical themes at a level that even Star Trek has been reluctant to grasp.

- [Fan-made trailer](https://www.youtube.com/watch?v=wvqYN2RJfVA)
- [Description on the underlying themes](https://gizmodo.com/why-mass-effect-is-the-most-important-science-fiction-u-5886178)


### [Quantum Break](https://en.wikipedia.org/wiki/Quantum_Break)
[Steam](https://store.steampowered.com/app/474960/Quantum_Break/)

If you have a CPU with many threads such as an AMD Threadripper,
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


### Subnautica
[Steam](https://store.steampowered.com/app/264710/Subnautica/)
