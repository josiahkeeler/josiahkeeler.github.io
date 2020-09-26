---
layout: post
title: Custom Keyboard Layouts with XKB
date: 2020-09-25 22:32
categories: coding
---
I recently switched back to a TKL keyboard after months of using a 65%. I love my 65%, but sometimes I need dedicated arrow and function keys. I still miss my arrow key shortcuts for text editing though. I would use IJKL as an arrow key cluster when coding so I wouldn't have to move my fingers off the home row to move the cursor around. On the TKL keyboard I keep hitting the IJKL cluster from muscle memory. I wanted to keep the muscle memory and the benefits of having the arrow keys nearby, so I made my own keyboard layout. Here's how!

# Setup 
I'm currently using the [Fnatic Ministreak](https://fnatic.com/gear/en/mini-streak/) **\(#notsponsored\)**, a beautiful tenkeyless RGB keyboard. While all the buttons can be remapped and a function layer added, it wasn't powerful enough to toggle IJKL as arrow keys. My main operating system is [Pop!_OS](https://pop.system76.com/), an Ubuntu variant by System 76. Some quick googling revealed that XKB (X keyboard extension) controls keyboard layouts. I quickly found a sample keyboard layout config file in `/usr/share/X11/xkb/symbols/` and studied the structure and syntax. Time to make my own keyboard layout!

# Layout
These posts helped me so much. Without them it would have taken me days to understand how XKB works.

[- Creating a Custom Keyboard Layout](https://askubuntu.com/questions/482678/how-to-add-a-new-keyboard-layout-custom-keyboard-layout-definition)

[- A simple, humble but comprehensive guide to XKB for linux](https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450)

```
default	partial alphanumeric_keys
xkb_symbols "basic" {

    include "us(basic)"
    name[Group1]= "English (IJKL as arrow keys)";
	key <CAPS> { [ ISO_Level3_Shift            ] };
	key <AD08> { [ i , I, Up, Up               ] };
	key <AC07> { [ j, J , Left, Left           ] };
	key <AC08> { [ k, K, Down, Down            ] };
	key <AC09> { [ l, L, Right, Right          ] };	
    include "level3(ralt_switch)"
};
```

The first post explains the structure better than I ever can. What's important is that this layout  inherits `us(basic)`  keyboard layout. Any unmodified keys in the config file default to US keyboard keys. This makes the config file so much smaller and easier to understand.

`key <CAPS> { [ ISO_Level3_Shift            ] };` is pretty cool. It turns your CAPS LOCK key into a 3rd level shift key. Similar to how you can type a capital J when  holding shift and pressing **j**, holding CAPS LOCK will go to the 3rd entry in the config file and use that key.

[*Modifier keys*](/images/stack.png)

- No modifiers (level 1)
- 2nd level modifier, a.k.a. shift (level 2)
- 3rd level modifier (level 3)
- 2nd + 3rd modifier (level 4)

from [AskUbuntu](https://askubuntu.com/questions/41213/what-does-key-to-choose-5th-level-in-gnome-keyboard-properties-do)

After writing up the layout and adding it to the `evdev.xml` file, I restarted X11 and *voila* my custom layout appeared!

[*The IJKL layout*](/images/layout.png)

Thanks internet! I'm probably going to write a small bash script to automatically install my layout so I can add it to any computer with one click. Peak efficiency am I right? *It took me 2 hours to write 12 lines of code*

Peace out!

JK
