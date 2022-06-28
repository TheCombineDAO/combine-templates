/+  dbug, default-agent
/+  ethereum
:: poke
:::: [%address address desciprtion]
:::: [%events address]
:::: [%balance token-address address]
:::: [%azimuth address] (basically for watching for tx proxies)
:: scry
:::: addresses (return list of addresses)
:::: address (return data for address)
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  ::[%0 watch-list=(map address:ethereum @t)]
  [%0 val=@ud]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %.n) bowl)
++  on-init
  ^-  (quip card _this)
  `this(val 42)
::  keeping these around for type signatures
::++  on-save   !>(~)
::++  on-load   |=(vase `..on-init)
::++  on-poke   |=(cage !!)
::++  on-watch  |=(path !!)
::++  on-leave  |=(path `..on-init)
::++  on-peek   |=(path ~)
::++  on-agent  |=([wire sign:agent:gall] !!)
::++  on-arvo   |=([wire sign-arvo] !!)
::++  on-fail   |=([term tang] `..on-init)
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?-  -.old
    %0  `this(state old)
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
