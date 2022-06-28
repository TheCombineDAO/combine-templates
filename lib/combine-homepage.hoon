::++  home-page-body
::  ^-  manx
::  ;body
::    ;div(class "w-full")
::      ;div(class "bg-hero bg-cover bg-bottom")
::        ;section(class "w-full px-4 md:px-8 py-20 layout pt-32 pb-52 md:pt-52 md:pb-72 lg:pb-96 m-auto")
::          ;h1(class "text-black measure mb-12"): Tools for a new society
::          ;h2(class "text-black measure"): The Combine invests in teams expanding the frontiers ;span(class "whitespace-nowrap"): of Urbit.
::        ==
::      ==
::    ==
::    ;div(class "flex flex-col w-full items-center max-w-screen-2xl")
::      ;section(class "w-full px-4 md:px-8 py-20 layout")
::        ;h2(name "teams", class "pb-10"): For Teams
::        ;div(class "mb-12")
::          ;h4(class "measure"): We fund teams that create tools to make Urbit better for groups and for individual users.
::        ==
::      ==
::    ==
::     ::   ;div(class "md:grid md:gap-8 lg:gap-16 grid-cols-2 w-full mb-12");
::     ::     ;div
::     ::       ;p(class "indent measure"): A new digital society is growing on Urbit, built around human-scale organizations. Be they DAOs, crypto syndicates, group chats or book clubs, they'll be decentralized, autonomous, pseudonymous and resilient.
::     ::       ;p(class "indent measure"): Urbit is built for groups and governed by a DAO. The network's flagship client, Landscape, is already home to groups of all kinds, from crypto anarchists to aficionados of off-beat photographic techniques. Urbit itself is governed by a smart-contract constitution ratified by a Senate of Galaxy owners, a DAO 
::     ::       ;a(href "https://urbit.org/blog/azimuth-is-on-chain"): in existence since 2019
::     ::       ;p(class "indent measure"): Urbit is the
::     ::       ;a(href "https://medium.com/dcspark/why-urbit-410d32961031", target "_blank"): natural tool
::     ::       ;p: for the new wave of DAOs, too. As a decentralized operating system with pseudonymous identity and built-in
::     ::       ;a(href "https://urbit.org/docs/glossary/ames"): exactly once messaging
::     ::       ;p: Urbit can unify the social and technical management of DAOs into one operating system, unlocking exciting new potentials. Imagine your Landscape group chipping in to buy a castle in Portugal. Or to start a hedge fund.
::     ::       ;p(class "indent measure"): Much work remains, however, to surface these benefits and to make Urbit useful to the DAOs of the future. If your team is working on tools for teams on Urbit, reach out to us below.
::     ::     ==
::     ::   ==
::     ::   ;div
::     ::     ;p(class "indent measure"): Whether you're making financial decisions, making music or writing a book, your actions are dictated by the creative possibilities of the PC. When you expand those possibilities, you can make a freer, more creative world.
::     ::     ;p(class "indent measure"): An urbit ship can be an outpost of digital sovereignty in a world that desperately needs it. Urbit has cryptographic identity, encrypted networking and built-in integrations to Ethereum and Bitcoin chains. Compatible with hardware from a fortified, arctic data center to a
::     ::     ;a(href "https://frame.work/"): laptop
::     ::     ;p: , Urbit opens the door to a world of private, secure computing for your social and financial transactions.
::     ::     ;p(class "indent measure"): The PC has expanded the creative possibilities available to the average person. But a mass-produced computer will always be just that: average. The promise of Urbit is that your computer is a high precision creative implement perfectly adapted to its one user. As a master portraitist might mix his own paints, the user of the future can turn his creativity into configuring his own ship.
::     ::     ;p(class "indent measure"): If your team is working on making these visions a reality, reach out to us below.
::     ::   ==
::     :: ==
::    :::==
::  ==
::
::::</p></div></div><div><a class="inline-block" href="mailto:info@the-combine.org"><button class="flex-center px-6 py-1 rounded-xl h-14 type-ui bg-green-400 text-white hover:bg-green-300">Email Us</button></a></div></section><section class="w-full px-4 md:px-8 py-20 layout "><h2 name="partners" class="pb-10">For Partners</h2><div class="mb-12"><h4 class="measure">The growth of the Urbit network will open a new world of opportunities to generate and capture value.</h4></div><div class="md:grid md:gap-8 lg:gap-16 grid-cols-2 w-full mb-12"><div><p(class indent measure)The
::::::Combine and the Urbit Foundation invest in teams that are ready to 
::::build this world by providing them address space, working capital and 
::::support.
::::;/p><p(class indent measure">Urbit address space, or<!-- --> <a href="https://urbit.org/understanding-urbit/urbit-id)Urbit IDs,<!-- --> </a>are
::::scarce NFTs that represent ownership of a fraction of the total Urbit 
::::network. They function as addresses, deeds and identities all rolled 
::::into one. Their scarcity means gives them an economic value based on the
::::utility of the network.
::::;/p><p(class indent measure)Of course, Urbit 
::::IDs reflect the value of the network as a whole. We also believe that 
::::individual projects and teams will be able to generate returns above the
::::value of the network. We invest in these teams in return for an equity 
::::stake.
::::;/p></div><div><p(class indent measure)Running an organization 
::::on such a new network is a tremendous opportunity, but it's not without 
::::its quandries. The Combine also connects teams to experts within the 
::::broader Urbit community to render advice on marketing, operations, 
::::fundraising, strategy, and technical support. Our hope is that each 
::::Combine team can blaze a trail for a new generation of organizations on 
::::Urbit.
::  
::++  build-home-page
::  |=  [si=site-inputs body=manx]
::  ^-  mime
::  =/  home-url  (spud path.binding.si)
::  :-  [%text %html ~]
::  %-  as-octt:mimes:html
::  %+  welp  "<!doctype html>"
::  %-  en-xml:html
::  ;html
::    ;head
::      ;meta(charset "utf-8");
::      ;title: The Combine Blog
::      ;meta(name "viewport", content "width=device-width, initial-scale=1, maximum-scale=1");
::      ;link(rel "stylesheet", href "https://rsms.me/inter/inter.css");
::      ;link(href "https://storage.googleapis.com/the-combine/styles.css", rel "stylesheet");
::    ==
::    ;*  ~[body]
::  ==
