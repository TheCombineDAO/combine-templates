/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
      state-1
      state-2
  ==
+$  state-0  [%0 val=@ud]
+$  state-1  [%1 val=[@ud @ud]]
+$  state-2  [%2 val=[@ud @ud @ud]]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-2
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
::
++  on-init
  ^-  (quip card _this)
  `this(val [27 32 100])
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?-  -.old
    %2  `this(state old)
    %1  `this(state 2+[0 1 20])
    %0  `this(state 2+[0 1 20])
  ==
::
++  on-poke   on-poke:def
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
